import React from 'react';
import katex from 'katex';
import 'katex/dist/katex.min.css';
import { TimelineHistory, FlowchartExperimental, FlowchartModel } from './PhysicsDiagrams';
import TikzViewer from './TikzViewer';
import BangTable from './BangTable';
import { renderTextWithMath, KATEX_MACROS } from '../utils/renderTextWithMath';

export { renderTextWithMath };

export default function Latex({ content }) {
  if (!content) return null;

  let contentWithPlaceholders = content;

  // Trích xuất khối \begin{bang}...\end{bang} trước (có thể chứa TikZ/hình ảnh trong ô)
  const bangRegex = /\\begin\{bang\}(?:\[([\s\S]*?)\])?\{([\s\S]*?)\}([\s\S]*?)\\end\{bang\}/g;
  const bangBlocks = [];
  let bangCounter = 0;
  contentWithPlaceholders = contentWithPlaceholders.replace(
    bangRegex,
    (_match, _opts, title, body) => {
      bangBlocks.push({ title, body: body.trim() });
      return `__BANG_BLOCK_${bangCounter++}__`;
    }
  );

  // Trích xuất tất cả các khối __TIKZ_START__...__TIKZ_END__
  const tikzRegex = /__TIKZ_START__([\s\S]+?)__TIKZ_END__/g;
  const tikzBlocks = [];
  let counter = 0;

  const matches = [...contentWithPlaceholders.matchAll(tikzRegex)];
  matches.forEach((m) => {
    tikzBlocks.push(m[1]);
    contentWithPlaceholders = contentWithPlaceholders.replace(m[0], `__TIKZ_BLOCK_${counter}__`);
    counter++;
  });

  // Trích xuất tất cả các khối $$...$$ (display math) để tránh việc split theo dòng mới
  const mathBlockRegex = /\$\$([\s\S]+?)\$\$/g;
  const mathBlocks = [];
  let mathCounter = 0;
  contentWithPlaceholders = contentWithPlaceholders.replace(
    mathBlockRegex,
    (_match, formula) => {
      mathBlocks.push(formula.trim());
      return `__MATH_BLOCK_${mathCounter++}__`;
    }
  );

  const lines = contentWithPlaceholders.split('\n');
  const renderedElements = [];
  let currentList = null; // Để nhóm các thẻ <li> vào <ul> hoặc <ol>
  let currentListType = null; // 'ul' hoặc 'ol'
  let currentBlockquote = null;
  let isInBang = false;
  let currentBangTitle = "";
  let currentTable = null;

  const pushCurrentList = () => {
    if (currentList) {
      const Tag = currentListType === 'ol' ? 'ol' : 'ul';
      renderedElements.push(
        <Tag key={`list-${renderedElements.length}`} className={currentListType === 'ol' ? 'custom-ol' : 'custom-ul'}>
          {currentList}
        </Tag>
      );
      currentList = null;
      currentListType = null;
    }
  };

  const pushCurrentBlockquote = () => {
    if (currentBlockquote) {
      const firstLine = currentBlockquote[0] || "";
      let borderClass = "border-primary";
      if (firstLine.includes("Lưu ý") || firstLine.includes("Chú ý")) {
        borderClass = "border-warning";
      } else if (firstLine.includes("Bình luận")) {
        borderClass = "border-info";
      }

      renderedElements.push(
        <blockquote key={`bq-${renderedElements.length}`} className={`theory-blockquote ${borderClass}`}>
          {currentBlockquote.map((line, idx) => (
            <p key={idx} className="blockquote-p">
              {renderTextWithMath(line)}
            </p>
          ))}
        </blockquote>
      );
      currentBlockquote = null;
    }
  };

  const pushCurrentTable = () => {
    if (currentTable) {
      const tableElement = (
        <table className="theory-bang-table">
          {currentTable.headers.length > 0 && (
            <thead>
              <tr>
                {currentTable.headers.map((h, i) => (
                  <th key={i}>{renderTextWithMath(h)}</th>
                ))}
              </tr>
            </thead>
          )}
          <tbody>
            {currentTable.rows.map((row, rIdx) => (
              <tr key={rIdx}>
                {row.map((cell, cIdx) => (
                  <td key={cIdx}>{renderTextWithMath(cell)}</td>
                ))}
              </tr>
            ))}
          </tbody>
        </table>
      );

      if (isInBang) {
        renderedElements.push(
          <div key={`bang-${renderedElements.length}`} className="theory-bang-wrapper">
            {currentBangTitle && (
              <div className="theory-bang-title">{renderTextWithMath(currentBangTitle)}</div>
            )}
            <div className="theory-bang-scroll">
              {tableElement}
            </div>
          </div>
        );
      } else {
        renderedElements.push(
          <div key={`table-${renderedElements.length}`} className="theory-bang-scroll" style={{ margin: '1rem 0' }}>
            {tableElement}
          </div>
        );
      }
      currentTable = null;
    }
  };

  const pushAllGrouped = () => {
    pushCurrentList();
    pushCurrentBlockquote();
    pushCurrentTable();
  };

  lines.forEach((line, index) => {
    const trimmed = line.trim();

    // 1. Dòng trống
    if (trimmed === '') {
      pushAllGrouped();
      return;
    }

    // Nhận diện __BANG_START__
    if (trimmed.startsWith('__BANG_START__')) {
      pushAllGrouped();
      isInBang = true;
      currentBangTitle = trimmed.substring(14).trim();
      currentTable = { headers: [], rows: [] };
      return;
    }

    // Nhận diện __BANG_END__
    if (trimmed === '__BANG_END__') {
      pushCurrentTable();
      isInBang = false;
      currentBangTitle = "";
      return;
    }

    // Nhận diện dòng bảng starting with '|'
    if (trimmed.startsWith('|')) {
      const isSeparator = /^\|[\s\-\:\d|]+\|$/.test(trimmed);
      if (isSeparator) {
        return;
      }
      
      if (!currentTable) {
        pushAllGrouped();
        currentTable = { headers: [], rows: [] };
      }
      
      const cells = trimmed.split('|').map(c => c.trim()).filter((_, i, arr) => i > 0 && i < arr.length - 1);
      if (currentTable.headers.length === 0) {
        currentTable.headers = cells;
      } else {
        currentTable.rows.push(cells);
      }
      return;
    }

    if (!trimmed.startsWith('|') && currentTable && !isInBang) {
      pushCurrentTable();
    }

    // Nhận diện blockquote starting with '>'
    if (trimmed.startsWith('>')) {
      pushCurrentList();
      pushCurrentTable();
      if (!currentBlockquote) {
        currentBlockquote = [];
      }
      const cleanLine = trimmed.substring(1).trim();
      currentBlockquote.push(cleanLine);
      return;
    }

    if (!trimmed.startsWith('>') && currentBlockquote) {
      pushCurrentBlockquote();
    }

    // Nhận diện placeholder __BANG_BLOCK_N__
    const bangPlaceholderMatch = trimmed.match(/^__BANG_BLOCK_(\d+)__$/);
    if (bangPlaceholderMatch) {
      pushAllGrouped();
      const block = bangBlocks[parseInt(bangPlaceholderMatch[1], 10)];
      renderedElements.push(
        <BangTable key={`bang-${index}`} title={block.title} body={block.body} />
      );
      return;
    }

    // Nhận diện placeholder __TIKZ_BLOCK_N__
    const tikzPlaceholderMatch = trimmed.match(/^__TIKZ_BLOCK_(\d+)__$/);
    if (tikzPlaceholderMatch) {
      pushAllGrouped();
      const blockIdx = parseInt(tikzPlaceholderMatch[1], 10);
      const blockContent = tikzBlocks[blockIdx];
      renderedElements.push(<TikzViewer key={index} code={blockContent} />);
      return;
    }

    // Nhận diện placeholder __MATH_BLOCK_N__
    const mathPlaceholderMatch = trimmed.match(/^__MATH_BLOCK_(\d+)__$/);
    if (mathPlaceholderMatch) {
      pushAllGrouped();
      const formula = mathBlocks[parseInt(mathPlaceholderMatch[1], 10)];
      try {
        const html = katex.renderToString(formula, {
          displayMode: true,
          throwOnError: false,
          macros: KATEX_MACROS,
        });
        renderedElements.push(
          <div
            key={index}
            className="latex-block"
            dangerouslySetInnerHTML={{ __html: html }}
          />
        );
      } catch (e) {
        renderedElements.push(
          <div key={index} className="latex-block-error">
            <code>{formula}</code>
          </div>
        );
      }
      return;
    }

    // 2.5. Hình ảnh Markdown (![Mô tả](đường_dẫn))
    const imgMatch = trimmed.match(/^!\[(.*?)\]\((.*?)\)$/);
    if (imgMatch) {
      pushAllGrouped();
      renderedElements.push(
        <div key={index} className="theory-image-wrapper">
          <img src={imgMatch[2]} alt={imgMatch[1]} className="theory-image" />
          {imgMatch[1] && <div className="theory-image-caption">{imgMatch[1]}</div>}
        </div>
      );
      return;
    }
    // 2.6. Biểu đồ/Sơ đồ tương tác (Timeline & Flowcharts)
    if (trimmed === '[TIMELINE_HISTORY_PHYSICS]') {
      pushAllGrouped();
      renderedElements.push(<TimelineHistory key={index} />);
      return;
    }
    if (trimmed === '[FLOWCHART_EXPERIMENTAL_METHOD]') {
      pushAllGrouped();
      renderedElements.push(<FlowchartExperimental key={index} />);
      return;
    }
    if (trimmed === '[FLOWCHART_MODEL_METHOD]') {
      pushAllGrouped();
      renderedElements.push(<FlowchartModel key={index} />);
      return;
    }

    // 3. Tiêu đề (#### hoặc ### hoặc ## hoặc #)
    if (trimmed.startsWith('#### ')) {
      pushAllGrouped();
      renderedElements.push(
        <h4 key={index} className="theory-h4">
          {renderTextWithMath(trimmed.substring(5))}
        </h4>
      );
      return;
    }
    if (trimmed.startsWith('### ')) {
      pushAllGrouped();
      renderedElements.push(
        <h3 key={index} className="theory-h3">
          {renderTextWithMath(trimmed.substring(4))}
        </h3>
      );
      return;
    }
    if (trimmed.startsWith('## ')) {
      pushAllGrouped();
      renderedElements.push(
        <h2 key={index} className="theory-h2">
          {renderTextWithMath(trimmed.substring(3))}
        </h2>
      );
      return;
    }
    if (trimmed.startsWith('# ')) {
      pushAllGrouped();
      renderedElements.push(
        <h1 key={index} className="theory-h1">
          {renderTextWithMath(trimmed.substring(2))}
        </h1>
      );
      return;
    }

    // 4. Danh sách không thứ tự (- hoặc *)
    if (trimmed.startsWith('- ') || trimmed.startsWith('* ')) {
      pushCurrentTable();
      pushCurrentBlockquote();
      if (currentListType !== 'ul') {
        pushCurrentList();
        currentListType = 'ul';
        currentList = [];
      }
      currentList.push(
        <li key={`li-${index}`} className="theory-li">
          {renderTextWithMath(trimmed.substring(2))}
        </li>
      );
      return;
    }

    // 5. Danh sách có thứ tự (1. , 2. )
    const olMatch = trimmed.match(/^(\d+)\.\s(.*)/);
    if (olMatch) {
      pushCurrentTable();
      pushCurrentBlockquote();
      if (currentListType !== 'ol') {
        pushCurrentList();
        currentListType = 'ol';
        currentList = [];
      }
      currentList.push(
        <li key={`li-${index}`} className="theory-li">
          {renderTextWithMath(olMatch[2])}
        </li>
      );
      return;
    }

    // 6. Dòng văn bản bình thường (Paragraph)
    pushAllGrouped();
    renderedElements.push(
      <p key={index} className="theory-p">
        {renderTextWithMath(line)}
      </p>
    );
  });

  // Đẩy tất cả các nhóm còn lại
  pushAllGrouped();

  return <div className="latex-rendered-content">{renderedElements}</div>;
}


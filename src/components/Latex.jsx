import React from 'react';
import katex from 'katex';
import 'katex/dist/katex.min.css';
import { TimelineHistory, FlowchartExperimental, FlowchartModel } from './PhysicsDiagrams';
import TikzViewer from './TikzViewer';

// Hàm helper để render chữ thường xen kẽ inline LaTeX và bold text
export function renderTextWithMath(text) {
  if (!text) return null;

  // Regex tìm **bold** hoặc $inline math$
  const regex = /\*\*([\s\S]+?)\*\*|\$([\s\S]+?)\$/g;
  const parts = [];
  let lastIndex = 0;
  let match;

  while ((match = regex.exec(text)) !== null) {
    const textBefore = text.substring(lastIndex, match.index);
    if (textBefore) {
      parts.push({ content: textBefore, type: 'text' });
    }

    const boldText = match[1];
    const mathText = match[2];

    if (boldText !== undefined) {
      parts.push({ content: boldText, type: 'bold' });
    } else if (mathText !== undefined) {
      parts.push({ content: mathText, type: 'math' });
    }

    lastIndex = regex.lastIndex;
  }

  const textAfter = text.substring(lastIndex);
  if (textAfter) {
    parts.push({ content: textAfter, type: 'text' });
  }

  return parts.map((part, index) => {
    if (part.type === 'bold') {
      return <strong key={index} style={{ fontWeight: '700', color: 'var(--text-bright)' }}>{part.content}</strong>;
    } else if (part.type === 'math') {
      try {
        const html = katex.renderToString(part.content, {
          displayMode: false,
          throwOnError: false,
        });
        return (
          <span
            key={index}
            className="latex-inline"
            dangerouslySetInnerHTML={{ __html: html }}
          />
        );
      } catch (e) {
        return <code key={index} className="math-error">{part.content}</code>;
      }
    } else {
      return part.content;
    }
  });
}

export default function Latex({ content }) {
  if (!content) return null;

  // Trích xuất tất cả các khối [TIKZ: ...] (có thể trải dài trên nhiều dòng)
  const tikzRegex = /\[TIKZ: ([\s\S]+?)\]/g;
  const tikzBlocks = [];
  let contentWithPlaceholders = content;
  let counter = 0;
  
  // Tìm các đoạn trùng khớp và thay thế bằng placeholder dạng __TIKZ_BLOCK_N__
  const matches = [...content.matchAll(tikzRegex)];
  matches.forEach((m) => {
    tikzBlocks.push(m[1]);
    contentWithPlaceholders = contentWithPlaceholders.replace(m[0], `__TIKZ_BLOCK_${counter}__`);
    counter++;
  });

  const lines = contentWithPlaceholders.split('\n');
  const renderedElements = [];
  let currentList = null; // Để nhóm các thẻ <li> vào <ul> hoặc <ol>
  let currentListType = null; // 'ul' hoặc 'ol'

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

  lines.forEach((line, index) => {
    const trimmed = line.trim();

    // 1. Dòng trống
    if (trimmed === '') {
      pushCurrentList();
      return;
    }

    // Nhận diện placeholder __TIKZ_BLOCK_N__
    const tikzPlaceholderMatch = trimmed.match(/^__TIKZ_BLOCK_(\d+)__$/);
    if (tikzPlaceholderMatch) {
      pushCurrentList();
      const blockIdx = parseInt(tikzPlaceholderMatch[1], 10);
      const blockContent = tikzBlocks[blockIdx];
      renderedElements.push(<TikzViewer key={index} code={blockContent} />);
      return;
    }

    // 2. Block LaTeX ($$...$$)
    if (trimmed.startsWith('$$') && trimmed.endsWith('$$')) {
      pushCurrentList();
      const formula = trimmed.slice(2, -2);
      try {
        const html = katex.renderToString(formula, {
          displayMode: true,
          throwOnError: false,
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
      pushCurrentList();
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
      pushCurrentList();
      renderedElements.push(<TimelineHistory key={index} />);
      return;
    }
    if (trimmed === '[FLOWCHART_EXPERIMENTAL_METHOD]') {
      pushCurrentList();
      renderedElements.push(<FlowchartExperimental key={index} />);
      return;
    }
    if (trimmed === '[FLOWCHART_MODEL_METHOD]') {
      pushCurrentList();
      renderedElements.push(<FlowchartModel key={index} />);
      return;
    }

    // 3. Tiêu đề (#### hoặc ### hoặc ## hoặc #)
    if (trimmed.startsWith('#### ')) {
      pushCurrentList();
      renderedElements.push(
        <h4 key={index} className="theory-h4">
          {renderTextWithMath(trimmed.substring(5))}
        </h4>
      );
      return;
    }
    if (trimmed.startsWith('### ')) {
      pushCurrentList();
      renderedElements.push(
        <h3 key={index} className="theory-h3">
          {renderTextWithMath(trimmed.substring(4))}
        </h3>
      );
      return;
    }
    if (trimmed.startsWith('## ')) {
      pushCurrentList();
      renderedElements.push(
        <h2 key={index} className="theory-h2">
          {renderTextWithMath(trimmed.substring(3))}
        </h2>
      );
      return;
    }
    if (trimmed.startsWith('# ')) {
      pushCurrentList();
      renderedElements.push(
        <h1 key={index} className="theory-h1">
          {renderTextWithMath(trimmed.substring(2))}
        </h1>
      );
      return;
    }

    // 4. Danh sách không thứ tự (- hoặc *)
    if (trimmed.startsWith('- ') || trimmed.startsWith('* ')) {
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
    pushCurrentList();
    renderedElements.push(
      <p key={index} className="theory-p">
        {renderTextWithMath(line)}
      </p>
    );
  });

  // Đẩy danh sách cuối cùng nếu còn
  pushCurrentList();

  return <div className="latex-rendered-content">{renderedElements}</div>;
}

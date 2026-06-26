import React from 'react';
import { renderTextWithMath } from '../utils/renderTextWithMath';
import TikzViewer from './TikzViewer';

function cleanTitle(raw) {
  return raw
    .replace(/\\&/g, '&')
    .replace(/\\\\+$/g, '')
    .trim();
}

function cleanCell(raw) {
  return raw
    .replace(/\\hline/g, '')
    .replace(/\\text\s*\{([^}]*)\}/g, '$1')
    .replace(/\\textbf\{([^}]*)\}/g, '**$1**')
    .replace(/\\quad/g, ' ')
    .replace(/\\vspace\{[^}]*\}/g, '')
    .trim();
}

function protectTikzBlocks(text) {
  const blocks = [];
  const protectedText = text.replace(/\[TIKZ: ([\s\S]+?)\]/g, (_match, content) => {
    blocks.push(content);
    return `__TIKZ_CELL_${blocks.length - 1}__`;
  });
  return { text: protectedText, blocks };
}

function splitRows(body) {
  const { text, blocks } = protectTikzBlocks(body);
  const rows = text
    .split(/\\\\(?:\s*\\hline)?/)
    .map((row) => row.replace(/\\hline/g, '').trim())
    .filter(Boolean);
  return { rows, tikzBlocks: blocks };
}

function splitCells(row) {
  return row.split('&').map((cell) => cleanCell(cell));
}

function renderCellContent(cell, tikzBlocks) {
  if (!cell) return null;

  const tikzPlaceholder = cell.match(/^__TIKZ_CELL_(\d+)__$/);
  if (tikzPlaceholder) {
    const code = tikzBlocks[parseInt(tikzPlaceholder[1], 10)];
    return code ? <TikzViewer code={code} /> : null;
  }

  const tikzInline = cell.match(/\[TIKZ:\s*([\s\S]+?)\]/);
  if (tikzInline) {
    return <TikzViewer code={tikzInline[1]} />;
  }

  const imgMatch = cell.match(/!\[(.*?)\]\((.*?)\)/);
  if (imgMatch) {
    return <img src={imgMatch[2]} alt={imgMatch[1]} className="theory-table-img" />;
  }

  return renderTextWithMath(cell);
}

export default function BangTable({ title, body }) {
  const { rows, tikzBlocks } = splitRows(body);
  if (rows.length === 0) return null;

  const headerCells = splitCells(rows[0]);
  const dataRows = rows.slice(1).map(splitCells);
  const colCount = Math.max(headerCells.length, ...dataRows.map((r) => r.length), 1);

  return (
    <div className="theory-bang-wrapper">
      {title && (
        <div className="theory-bang-title">{renderTextWithMath(cleanTitle(title))}</div>
      )}
      <div className="theory-bang-scroll">
        <table className="theory-bang-table">
          <thead>
            <tr>
              {headerCells.map((cell, i) => (
                <th key={i}>{renderCellContent(cell, tikzBlocks)}</th>
              ))}
            </tr>
          </thead>
          <tbody>
            {dataRows.map((cells, ri) => (
              <tr key={ri}>
                {Array.from({ length: colCount }).map((_, ci) => (
                  <td key={ci}>{renderCellContent(cells[ci] || '', tikzBlocks)}</td>
                ))}
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  );
}

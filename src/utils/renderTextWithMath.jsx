import React from 'react';
import katex from 'katex';

export const KATEX_MACROS = {
  "\\ct": "\\text{#1}",
  "\\sh": "\\text{#1}",
  "\\bth": "\\displaystyle{#1}",
  "\\hoac": "\\left[\\begin{aligned}#1\\end{aligned}\\right.",
  "\\heva": "\\left\\{\\begin{aligned}#1\\end{aligned}\\right.",
  "\\pso": "\\displaystyle{\\frac{#1}{#2}}",
  "\\vec": "\\overrightarrow{#1}",
  "\\degree": "^\\circ",
  "\\doC": "^\\circ\\text{C}",
  "\\microc": "\\mu\\text{C}",
  "\\microm": "\\mu\\text{m}",
  "\\microf": "\\mu\\text{F}",
  "\\microh": "\\mu\\text{H}",
  "\\ohm": "\\Omega",
  "\\angstrom": "\\text{\\AA}",
};

export function renderTextWithMath(text) {
  if (!text) return null;

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
    }
    if (part.type === 'math') {
      try {
        const html = katex.renderToString(part.content, {
          displayMode: false,
          throwOnError: false,
          macros: KATEX_MACROS,
        });
        return (
          <span
            key={index}
            className="latex-inline"
            dangerouslySetInnerHTML={{ __html: html }}
          />
        );
      } catch {
        return <code key={index} className="math-error">{part.content}</code>;
      }
    }
    const textLines = part.content.split('\\\\');
    return (
      <React.Fragment key={index}>
        {textLines.map((line, lIdx) => (
          <React.Fragment key={lIdx}>
            {line}
            {lIdx < textLines.length - 1 && <br />}
          </React.Fragment>
        ))}
      </React.Fragment>
    );
  });
}

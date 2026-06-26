import React from 'react';
import katex from 'katex';

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
    return part.content;
  });
}

import React, { useState } from 'react';
import { Code, Copy, Check, ChevronDown, ChevronUp } from 'lucide-react';

export default function TikzViewer({ code }) {
  const [isOpen, setIsOpen] = useState(false);
  const [copied, setCopied] = useState(false);

  let svgUrl = null;
  let tikzCode = code;
  if (code && code.includes('|')) {
    const parts = code.split('|');
    svgUrl = parts[0];
    tikzCode = parts.slice(1).join('|');
  }

  const handleCopy = async () => {
    try {
      await navigator.clipboard.writeText(tikzCode);
      setCopied(true);
      setTimeout(() => setCopied(false), 2000);
    } catch (err) {
      console.error('Failed to copy text: ', err);
    }
  };

  // Trích xuất chú thích từ code Tikz nếu có (ví dụ các dòng chú thích % ...)
  const extractCaption = (tikzCodeText) => {
    const lines = tikzCodeText.split('\n');
    for (let line of lines) {
      const trimmed = line.trim();
      if (trimmed.startsWith('%') && trimmed.length > 2) {
        // Trả về chú thích không chứa ký tự %
        return trimmed.replace(/^%\s*/, '');
      }
    }
    return 'Sơ đồ hình vẽ Vật lí';
  };

  const caption = extractCaption(tikzCode);

  return (
    <div className="tikz-viewer-card custom-diagram-wrapper">
      <div className="tikz-viewer-header">
        <div className="tikz-title-area">
          <div className="tikz-icon-circle">
            <Code size={18} className="tikz-pulse-icon" />
          </div>
          <span className="tikz-title">{caption}</span>
        </div>
        <button 
          className={`tikz-toggle-btn ${isOpen ? 'active' : ''}`}
          onClick={() => setIsOpen(!isOpen)}
          aria-label={isOpen ? 'Thu gọn mã Tikz' : 'Xem mã Tikz'}
        >
          {isOpen ? <ChevronUp size={16} /> : <ChevronDown size={16} />}
          <span className="tikz-toggle-text">{isOpen ? 'Thu gọn mã' : 'Xem mã Tikz'}</span>
        </button>
      </div>

      {/* Phần minh họa đồ họa SVG thay thế sinh động cho sơ đồ vật lí */}
      <div className="tikz-graphic-placeholder">
        {svgUrl && svgUrl !== 'placeholder' ? (
          <img 
            src={svgUrl} 
            alt={caption} 
            className="tikz-svg-image" 
            style={{ width: '100%', maxHeight: '450px', objectFit: 'contain', display: 'block', margin: '0 auto' }} 
          />
        ) : (
          <svg viewBox="0 0 400 160" className="tikz-svg-schematic" xmlns="http://www.w3.org/2000/svg">
            {/* Lưới tọa độ mờ */}
            <defs>
              <pattern id="grid" width="20" height="20" patternUnits="userSpaceOnUse">
                <path d="M 20 0 L 0 0 0 20" fill="none" stroke="rgba(255, 255, 255, 0.04)" strokeWidth="1" />
              </pattern>
              <linearGradient id="grad-primary" x1="0%" y1="0%" x2="100%" y2="100%">
                <stop offset="0%" stopColor="var(--accent-blue, #6366f1)" stopOpacity="0.8" />
                <stop offset="100%" stopColor="var(--accent-purple, #a855f7)" stopOpacity="0.8" />
              </linearGradient>
            </defs>
            <rect width="100%" height="100%" fill="url(#grid)" />

            {/* Trục tọa độ đại diện */}
            <line x1="40" y1="130" x2="360" y2="130" stroke="rgba(255,255,255,0.3)" strokeWidth="2" markerEnd="url(#arrow)" />
            <line x1="50" y1="140" x2="50" y2="20" stroke="rgba(255,255,255,0.3)" strokeWidth="2" />
            <text x="350" y="145" fill="rgba(255,255,255,0.6)" fontSize="10">x</text>
            <text x="40" y="25" fill="rgba(255,255,255,0.6)" fontSize="10">y</text>
            <text x="40" y="145" fill="rgba(255,255,255,0.6)" fontSize="10">O</text>

            {/* Đường cong đồ thị hoặc lực vec-tơ */}
            <path d="M 50 110 Q 150 20, 250 80 T 350 30" fill="none" stroke="url(#grad-primary)" strokeWidth="3" />
            
            {/* Điểm nút & Vectơ lực */}
            <circle cx="150" cy="50" r="5" fill="var(--accent-red, #ef4444)" />
            <line x1="150" y1="50" x2="200" y2="20" stroke="var(--accent-red, #ef4444)" strokeWidth="2" />
            <polygon points="200,20 193,22 197,27" fill="var(--accent-red, #ef4444)" />
            <text x="205" y="22" fill="var(--accent-red, #ef4444)" fontSize="10" fontWeight="bold">F</text>

            {/* Nhãn mô tả */}
            <rect x="110" y="110" width="180" height="25" rx="5" fill="rgba(0,0,0,0.4)" stroke="rgba(255,255,255,0.1)" strokeWidth="1" />
            <text x="200" y="126" fill="rgba(255,255,255,0.8)" fontSize="10" textAnchor="middle" fontStyle="italic">
              Sơ đồ hình vẽ được mã hóa bằng Tikz
            </text>
          </svg>
        )}
      </div>

      {/* Code details expanded */}
      {isOpen && (
        <div className="tikz-code-expanded-panel animate-fade-in">
          <div className="tikz-code-toolbar">
            <span className="tikz-language-label">Tikz LaTeX Code</span>
            <button 
              className={`tikz-copy-btn ${copied ? 'copied' : ''}`}
              onClick={handleCopy}
              aria-label="Sao chép mã Tikz"
            >
              {copied ? (
                <>
                  <Check size={14} />
                  <span>Đã sao chép!</span>
                </>
              ) : (
                <>
                  <Copy size={14} />
                  <span>Sao chép mã</span>
                </>
              )}
            </button>
          </div>
          <pre className="tikz-code-pre">
            <code>{tikzCode}</code>
          </pre>
        </div>
      )}
    </div>
  );
}

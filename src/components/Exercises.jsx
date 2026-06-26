import React, { useState, useEffect, useRef } from 'react';
import { renderTextWithMath } from './Latex';
import { KATEX_MACROS } from '../utils/renderTextWithMath';
import {
  Lock, Check, X, HelpCircle, RefreshCw, Award, AlertCircle,
  ChevronLeft, ChevronRight, BookOpen, Clock, Send
} from 'lucide-react';
import katex from 'katex';

/* ── Render lời giải có LaTeX ── */
function ExplanationBlock({ text }) {
  if (!text) return null;

  // Trích xuất tất cả các khối $$...$$ (display math) để tránh việc split theo dòng mới
  const mathBlocks = [];
  let mathCounter = 0;
  const contentWithPlaceholders = text.replace(/\$\$([\s\S]+?)\$\$/g, (_match, formula) => {
    mathBlocks.push(formula.trim());
    return `__MATH_BLOCK_${mathCounter++}__`;
  });

  return (
    <div className="az-explanation">
      <div className="az-explanation-label">📘 Lời giải chi tiết</div>
      <div className="az-explanation-body">
        {contentWithPlaceholders.split('\n').map((line, i) => {
          const trimmed = line.trim();
          if (!trimmed) return null;

          const mathPlaceholderMatch = trimmed.match(/^__MATH_BLOCK_(\d+)__$/);
          if (mathPlaceholderMatch) {
            const formula = mathBlocks[parseInt(mathPlaceholderMatch[1], 10)];
            try {
              const html = katex.renderToString(formula, {
                displayMode: true,
                throwOnError: false,
                macros: KATEX_MACROS,
              });
              return <div key={i} className="latex-block" dangerouslySetInnerHTML={{ __html: html }} />;
            } catch {
              return <div key={i} className="latex-block-error"><code>{formula}</code></div>;
            }
          }

          return <p key={i} className="explanation-line">{renderTextWithMath(line)}</p>;
        })}
      </div>
    </div>
  );
}

/* ── Màn hình chọn Dạng ── */
function DangSelector({ dangOrder, groupedExercises, onSelect }) {
  const icons = ['📖', '🧮', '⚖️', '⚡', '🔧'];
  const colors = ['#3b82f6', '#10b981', '#f59e0b', '#8b5cf6', '#ef4444'];

  return (
    <div className="az-dang-screen">
      <div className="az-dang-header">
        <h2>🎯 Bài tập vận dụng</h2>
        <p>Chọn dạng bài tập bạn muốn luyện tập</p>
      </div>
      <div className="az-dang-grid">
        {dangOrder.map((dang, idx) => {
          const count = groupedExercises[dang].length;
          const color = colors[idx % colors.length];
          return (
            <button
              key={idx}
              className="az-dang-card"
              style={{ '--dang-color': color }}
              onClick={() => onSelect(dang)}
            >
              <span className="az-dang-badge">{icons[idx % icons.length]}</span>
              <div className="az-dang-info">
                <span className="az-dang-name">{dang}</span>
                <span className="az-dang-meta">{count} câu hỏi</span>
              </div>
              <span className="az-dang-arrow">→</span>
            </button>
          );
        })}
      </div>
    </div>
  );
}

/* ── Component chính ── */
export default function Exercises({ exercises, studentInfo, onOpenLogin, lessonTitle }) {
  const [activeDang, setActiveDang] = useState(null);
  const [currentIdx, setCurrentIdx] = useState(0);
  const [answers, setAnswers] = useState({});   // { id: optionIndex }
  const [isSubmitted, setIsSubmitted] = useState(false);
  const [showWarning, setShowWarning] = useState(false);
  const [seconds, setSeconds] = useState(0);
  const timerRef = useRef(null);
  const questionRef = useRef(null);

  /* Reset khi chuyển bài học */
  useEffect(() => {
    setActiveDang(null);
    setCurrentIdx(0);
    setAnswers({});
    setIsSubmitted(false);
    setShowWarning(false);
    setSeconds(0);
  }, [exercises]);

  /* Đồng hồ đếm giờ */
  useEffect(() => {
    if (activeDang && !isSubmitted) {
      timerRef.current = setInterval(() => setSeconds(s => s + 1), 1000);
    }
    return () => clearInterval(timerRef.current);
  }, [activeDang, isSubmitted]);

  const formatTime = (s) => {
    const m = Math.floor(s / 60).toString().padStart(2, '0');
    const sec = (s % 60).toString().padStart(2, '0');
    return `${m}:${sec}`;
  };

  /* Nhóm bài theo dạng */
  const dangOrder = [];
  const groupedExercises = (exercises || []).reduce((g, item) => {
    const t = item.type || 'Bài tập tổng hợp';
    if (!g[t]) { g[t] = []; dangOrder.push(t); }
    g[t].push(item);
    return g;
  }, {});

  const handleSelectDang = (dang) => {
    setActiveDang(dang);
    setCurrentIdx(0);
    setAnswers({});
    setIsSubmitted(false);
    setShowWarning(false);
    setSeconds(0);
  };

  const handleBack = () => {
    setActiveDang(null);
    setCurrentIdx(0);
    setAnswers({});
    setIsSubmitted(false);
    setShowWarning(false);
    setSeconds(0);
  };

  /* Chưa có bài */
  if (!exercises || exercises.length === 0) {
    return (
      <div className="az-empty">
        <HelpCircle size={40} />
        <p>Bài học này hiện chưa có bài tập vận dụng.</p>
      </div>
    );
  }

  /* Chưa đăng nhập */
  if (!studentInfo) {
    return (
      <div className="az-locked">
        <div className="az-locked-icon"><Lock size={36} /></div>
        <h3>Bài tập đang khóa</h3>
        <p>Vui lòng đăng nhập để mở khóa và làm bài tập tự luyện</p>
        <button className="az-unlock-btn" onClick={onOpenLogin}>
          Đăng ký làm bài ngay
        </button>
      </div>
    );
  }

  /* Màn hình chọn dạng */
  if (!activeDang) {
    return <DangSelector dangOrder={dangOrder} groupedExercises={groupedExercises} onSelect={handleSelectDang} />;
  }

  /* Làm bài */
  const list = groupedExercises[activeDang] || [];
  const total = list.length;
  const answered = list.filter(ex => answers[ex.id] !== undefined).length;
  const allDone = answered === total;
  const current = list[currentIdx];

  const correct = list.filter(ex => answers[ex.id] === ex.correctOption).length;
  const pct = total > 0 ? Math.round((correct / total) * 100) : 0;

  const handleAnswer = (id, idx) => {
    if (isSubmitted) return;
    setAnswers(prev => ({ ...prev, [id]: idx }));
    setShowWarning(false);
  };

  const handlePrev = () => {
    setCurrentIdx(i => Math.max(0, i - 1));
    questionRef.current?.scrollIntoView({ behavior: 'smooth', block: 'start' });
  };

  const handleNext = () => {
    setCurrentIdx(i => Math.min(total - 1, i + 1));
    questionRef.current?.scrollIntoView({ behavior: 'smooth', block: 'start' });
  };

  const handleGoTo = (idx) => {
    setCurrentIdx(idx);
    questionRef.current?.scrollIntoView({ behavior: 'smooth', block: 'start' });
  };

  const saveMock = (payload) => {
    const item = { ...payload, submittedAt: new Date().toISOString() };
    const raw = localStorage.getItem('admin_mock_submissions');
    let list = [];
    try { list = JSON.parse(raw || '[]'); } catch {}
    list.unshift(item);
    localStorage.setItem('admin_mock_submissions', JSON.stringify(list));
  };

  const handleSubmit = async () => {
    if (!allDone) { setShowWarning(true); return; }
    clearInterval(timerRef.current);
    setIsSubmitted(true);
    setShowWarning(false);
    setCurrentIdx(0);
    const payload = {
      name: studentInfo.name,
      phone: studentInfo.phone,
      lessonTitle: `${lessonTitle || 'Bài học Vật lý'} – ${activeDang}`,
      correctCount: correct,
      totalQuestions: total
    };
    try {
      const res = await fetch('/api/submit', { method: 'POST', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify(payload) });
      const data = await res.json();
      if (data.warning) saveMock(payload);
    } catch { saveMock(payload); }
  };

  const handleReset = () => {
    setAnswers({});
    setIsSubmitted(false);
    setShowWarning(false);
    setCurrentIdx(0);
    setSeconds(0);
  };

  /* Trạng thái từng câu cho navigator */
  const getQStatus = (ex, idx) => {
    if (isSubmitted) {
      return answers[ex.id] === ex.correctOption ? 'correct' : 'incorrect';
    }
    if (answers[ex.id] !== undefined) return 'answered';
    if (idx === currentIdx) return 'current';
    return 'unanswered';
  };

  const selOpt = answers[current?.id];
  const isCurrentCorrect = selOpt === current?.correctOption;

  return (
    <div className="az-exam-wrap">
      {/* ── TOP BAR ── */}
      <div className="az-topbar">
        <button className="az-back-btn" onClick={handleBack}>
          <ChevronLeft size={16} /> Chọn dạng khác
        </button>
        <div className="az-topbar-title">
          <BookOpen size={16} />
          <span>{activeDang}</span>
        </div>
        <div className="az-topbar-right">
          {!isSubmitted && (
            <span className="az-timer"><Clock size={14} />{formatTime(seconds)}</span>
          )}
          <span className="az-progress-text">{answered}/{total} câu</span>
        </div>
      </div>

      {/* ── PROGRESS BAR ── */}
      <div className="az-progress-bar-wrap">
        <div className="az-progress-bar" style={{ width: `${(answered / total) * 100}%` }} />
      </div>

      {/* ── KẾT QUẢ (sau nộp) ── */}
      {isSubmitted && (
        <div className="az-result-banner">
          <div className="az-result-left">
            <Award size={32} className="az-result-icon" />
            <div>
              <div className="az-result-name">{studentInfo.name}</div>
              <div className="az-result-score">
                Đúng <strong>{correct}/{total}</strong> câu · Đạt <strong>{pct}%</strong>
              </div>
            </div>
          </div>
          <div className="az-result-actions">
            <button className="az-btn-reset" onClick={handleReset}>
              <RefreshCw size={15} /> Làm lại
            </button>
            <button className="az-btn-back" onClick={handleBack}>
              <ChevronLeft size={15} /> Chọn dạng khác
            </button>
          </div>
        </div>
      )}

      {/* ── BODY: NAVIGATOR + QUESTION ── */}
      <div className="az-body">

        {/* Navigator bảng số câu */}
        <aside className="az-navigator">
          <div className="az-nav-title">Danh sách câu hỏi</div>
          <div className="az-nav-grid">
            {list.map((ex, idx) => (
              <button
                key={ex.id}
                className={`az-nav-btn az-nav-${getQStatus(ex, idx)}`}
                onClick={() => handleGoTo(idx)}
                title={`Câu ${idx + 1}`}
              >
                {idx + 1}
              </button>
            ))}
          </div>
          <div className="az-nav-legend">
            <span className="az-legend-dot answered" />Đã chọn
            <span className="az-legend-dot unanswered" />Chưa làm
            {isSubmitted && <><span className="az-legend-dot correct" />Đúng</>}
            {isSubmitted && <><span className="az-legend-dot incorrect" />Sai</>}
          </div>
        </aside>

        {/* Khung câu hỏi */}
        <main className="az-question-panel" ref={questionRef}>
          {current && (
            <div className={`az-question-card ${isSubmitted ? (isCurrentCorrect ? 'az-card-correct' : 'az-card-incorrect') : ''}`}>

              {/* Số câu + badge */}
              <div className="az-q-header">
                <span className="az-q-num">Câu {currentIdx + 1} / {total}</span>
                {isSubmitted && (
                  <span className={`az-q-badge ${isCurrentCorrect ? 'badge-correct' : 'badge-incorrect'}`}>
                    {isCurrentCorrect ? <><Check size={13} /> Đúng</> : <><X size={13} /> Sai</>}
                  </span>
                )}
              </div>

              {/* Nội dung câu hỏi */}
              <div className="az-q-text">
                {renderTextWithMath(current.question)}
              </div>

              {/* 4 phương án */}
              <div className="az-options">
                {current.options.map((opt, optIdx) => {
                  let cls = 'az-opt';
                  if (isSubmitted) {
                    if (optIdx === current.correctOption) cls += ' az-opt-correct';
                    else if (optIdx === selOpt) cls += ' az-opt-wrong';
                    else cls += ' az-opt-disabled';
                  } else if (selOpt === optIdx) {
                    cls += ' az-opt-selected';
                  }
                  return (
                    <button
                      key={optIdx}
                      className={cls}
                      onClick={() => handleAnswer(current.id, optIdx)}
                      disabled={isSubmitted}
                    >
                      <span className="az-opt-letter">{String.fromCharCode(65 + optIdx)}</span>
                      <span className="az-opt-text">{renderTextWithMath(opt)}</span>
                      {isSubmitted && optIdx === current.correctOption && (
                        <Check size={16} className="az-opt-check" />
                      )}
                      {isSubmitted && optIdx === selOpt && optIdx !== current.correctOption && (
                        <X size={16} className="az-opt-x" />
                      )}
                    </button>
                  );
                })}
              </div>

              {/* Lời giải */}
              {isSubmitted && <ExplanationBlock text={current.explanation} />}

              {/* Nút điều hướng prev / next */}
              <div className="az-q-nav">
                <button className="az-nav-prev" onClick={handlePrev} disabled={currentIdx === 0}>
                  <ChevronLeft size={16} /> Câu trước
                </button>
                <span className="az-q-dot-row">
                  {list.map((_, i) => (
                    <button
                      key={i}
                      className={`az-dot ${i === currentIdx ? 'az-dot-active' : ''}`}
                      onClick={() => handleGoTo(i)}
                    />
                  ))}
                </span>
                <button className="az-nav-next" onClick={handleNext} disabled={currentIdx === total - 1}>
                  Câu sau <ChevronRight size={16} />
                </button>
              </div>
            </div>
          )}

          {/* Cảnh báo chưa làm hết */}
          {showWarning && (
            <div className="az-warning">
              <AlertCircle size={16} />
              Còn <strong>{total - answered}</strong> câu chưa chọn đáp án. Vui lòng làm hết trước khi nộp!
            </div>
          )}

          {/* Nút nộp bài */}
          {!isSubmitted && (
            <button
              className={`az-submit-btn ${allDone ? 'az-submit-ready' : ''}`}
              onClick={handleSubmit}
            >
              <Send size={16} />
              Nộp bài &amp; Xem kết quả ({answered}/{total})
            </button>
          )}
        </main>
      </div>
    </div>
  );
}

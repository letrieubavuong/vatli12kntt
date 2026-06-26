import React, { useState, useEffect } from 'react';
import { renderTextWithMath } from './Latex';
import { Lock, Check, X, HelpCircle, RefreshCw, Award, AlertCircle, ChevronLeft, BookOpen } from 'lucide-react';
import katex from 'katex';

export default function Exercises({ exercises, studentInfo, onOpenLogin, lessonTitle }) {
  // Dạng đang được chọn (null = màn hình chọn dạng)
  const [activeDang, setActiveDang] = useState(null);
  // Đáp án học sinh chọn cho từng câu: { [exerciseId]: index }
  const [selectedOptions, setSelectedOptions] = useState({});
  // Đã nộp bài dạng hiện tại chưa
  const [isSubmitted, setIsSubmitted] = useState(false);
  // Cảnh báo chưa làm hết
  const [showWarning, setShowWarning] = useState(false);

  // Reset khi chuyển bài học
  useEffect(() => {
    setActiveDang(null);
    setSelectedOptions({});
    setIsSubmitted(false);
    setShowWarning(false);
  }, [exercises]);

  // Reset khi chuyển dạng
  const handleSelectDang = (dang) => {
    setActiveDang(dang);
    setSelectedOptions({});
    setIsSubmitted(false);
    setShowWarning(false);
  };

  const handleBackToDang = () => {
    setActiveDang(null);
    setSelectedOptions({});
    setIsSubmitted(false);
    setShowWarning(false);
  };

  if (!exercises || exercises.length === 0) {
    return (
      <div className="no-exercises">
        <HelpCircle className="no-ex-icon" size={32} />
        <p>Bài học này hiện chưa có bài tập vận dụng.</p>
      </div>
    );
  }

  // Nhóm bài tập theo dạng — giữ thứ tự xuất hiện lần đầu
  const dangOrder = [];
  const groupedExercises = exercises.reduce((groups, item) => {
    const type = item.type || 'Bài tập tổng hợp';
    if (!groups[type]) {
      groups[type] = [];
      dangOrder.push(type);
    }
    groups[type].push(item);
    return groups;
  }, {});

  // ── Màn hình chưa đăng nhập ──
  if (!studentInfo) {
    return (
      <div className="exercises-section">
        <div className="section-header">
          <h3>🎯 Bài tập vận dụng</h3>
        </div>
        <div className="exercises-locked-card">
          <div className="lock-icon-wrapper">
            <Lock size={32} />
          </div>
          <h4>Nội dung bài tập đang khóa</h4>
          <p>Học sinh vui lòng đăng nhập thông tin cá nhân (Họ tên &amp; Số điện thoại) để mở khóa làm bài tập tự luyện và xem lời giải chi tiết.</p>
          <button className="unlock-btn" onClick={onOpenLogin}>
            Đăng ký làm bài tập ngay
          </button>
        </div>
      </div>
    );
  }

  // ── Màn hình chọn Dạng ──
  if (!activeDang) {
    return (
      <div className="exercises-section">
        <div className="section-header">
          <h3>🎯 Bài tập vận dụng</h3>
          <p className="dang-intro">Chọn dạng bài tập bạn muốn luyện tập:</p>
        </div>
        <div className="dang-grid">
          {dangOrder.map((dang, idx) => {
            const count = groupedExercises[dang].length;
            const icons = ['📖', '🧮', '⚖️', '⚡', '🔧'];
            return (
              <button
                key={idx}
                className="dang-card"
                onClick={() => handleSelectDang(dang)}
              >
                <span className="dang-icon">{icons[idx] || '📝'}</span>
                <span className="dang-name">{dang}</span>
                <span className="dang-count">{count} câu hỏi</span>
                <span className="dang-start-btn">Bắt đầu →</span>
              </button>
            );
          })}
        </div>
      </div>
    );
  }

  // ── Màn hình làm bài của 1 dạng ──
  const currentExercises = groupedExercises[activeDang] || [];
  const totalQuestions = currentExercises.length;
  const answeredCount = currentExercises.filter(ex => selectedOptions[ex.id] !== undefined).length;
  const allAnswered = answeredCount === totalQuestions;
  const correctCount = currentExercises.filter(ex => selectedOptions[ex.id] === ex.correctOption).length;
  const scorePercentage = totalQuestions > 0 ? Math.round((correctCount / totalQuestions) * 100) : 0;

  const handleSelectOption = (exerciseId, optionIndex) => {
    if (isSubmitted) return;
    setSelectedOptions(prev => ({ ...prev, [exerciseId]: optionIndex }));
    setShowWarning(false);
  };

  const saveMockSubmission = (payload) => {
    const submission = { ...payload, submittedAt: new Date().toISOString() };
    const current = localStorage.getItem('admin_mock_submissions');
    let list = [];
    if (current) { try { list = JSON.parse(current); } catch (e) {} }
    list.unshift(submission);
    localStorage.setItem('admin_mock_submissions', JSON.stringify(list));
  };

  const handleSubmit = async () => {
    if (!allAnswered) { setShowWarning(true); return; }
    setIsSubmitted(true);
    setShowWarning(false);
    const payload = {
      name: studentInfo.name,
      phone: studentInfo.phone,
      lessonTitle: `${lessonTitle || 'Bài học Vật lý'} - ${activeDang}`,
      correctCount,
      totalQuestions
    };
    try {
      const res = await fetch('/api/submit', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(payload)
      });
      const data = await res.json();
      if (data.warning) saveMockSubmission(payload);
    } catch (e) {
      saveMockSubmission(payload);
    }
  };

  const handleReset = () => {
    setSelectedOptions({});
    setIsSubmitted(false);
    setShowWarning(false);
  };

  return (
    <div className="exercises-section">
      {/* Header với nút quay lại */}
      <div className="section-header dang-header">
        <button className="back-to-dang-btn" onClick={handleBackToDang}>
          <ChevronLeft size={16} /> Chọn dạng khác
        </button>
        <div className="dang-title-row">
          <BookOpen size={18} />
          <h3>{activeDang}</h3>
        </div>
        {isSubmitted && (
          <div className="score-summary">
            <Award size={18} />
            <span>Kết quả: <strong>{correctCount}/{totalQuestions}</strong> câu ({scorePercentage}%)</span>
          </div>
        )}
      </div>

      <div className="exercises-list">
        {/* Bảng điểm sau khi nộp */}
        {isSubmitted && (
          <div className="score-board-card animate-fade-in">
            <Award size={36} className="score-board-icon" />
            <div>
              <h4>Hoàn thành {activeDang}!</h4>
              <p>Học sinh: <strong>{studentInfo.name}</strong> — SĐT: <strong>{studentInfo.phone}</strong></p>
              <p className="score-text">
                Đúng <strong>{correctCount}</strong> / <strong>{totalQuestions}</strong> câu &nbsp;
                (Đạt <strong>{scorePercentage}%</strong>)
              </p>
            </div>
          </div>
        )}

        {/* Danh sách câu hỏi */}
        {currentExercises.map((ex, exIdx) => {
          const selectedOption = selectedOptions[ex.id];
          const isCorrect = selectedOption === ex.correctOption;

          return (
            <div
              key={ex.id}
              className={`exercise-card ${isSubmitted ? (isCorrect ? 'correct-border' : 'incorrect-border') : ''}`}
            >
              <div className="exercise-question-header">
                <span className="question-number">Câu {exIdx + 1}:</span>
                <div className="question-text">{renderTextWithMath(ex.question)}</div>
              </div>

              <div className="exercise-options">
                {ex.options.map((opt, optIdx) => {
                  let optionClass = '';
                  if (isSubmitted) {
                    if (optIdx === ex.correctOption) optionClass = 'correct-option';
                    else if (optIdx === selectedOption) optionClass = 'incorrect-option';
                    else optionClass = 'disabled-option';
                  } else if (selectedOption === optIdx) {
                    optionClass = 'selected-option';
                  }
                  return (
                    <button
                      key={optIdx}
                      className={`option-btn ${optionClass}`}
                      onClick={() => handleSelectOption(ex.id, optIdx)}
                      disabled={isSubmitted}
                    >
                      <span className="option-marker">
                        {isSubmitted && optIdx === ex.correctOption && <Check size={14} />}
                        {isSubmitted && optIdx === selectedOption && optIdx !== ex.correctOption && <X size={14} />}
                        {!isSubmitted && String.fromCharCode(65 + optIdx)}
                      </span>
                      <span className="option-text">{renderTextWithMath(opt)}</span>
                    </button>
                  );
                })}
              </div>

              {/* Lời giải sau khi nộp */}
              {isSubmitted && (
                <div className="exercise-explanation animate-fade-in">
                  <div className="explanation-title">
                    {isCorrect
                      ? <span className="text-success">🎉 Chính xác! Lời giải chi tiết:</span>
                      : <span className="text-danger">❌ Chưa chính xác. Lời giải chi tiết:</span>
                    }
                  </div>
                  <div className="explanation-content">
                    {ex.explanation.split('\n').map((line, idx) => {
                      if (line.trim().startsWith('$$') && line.trim().endsWith('$$')) {
                        const formula = line.trim().slice(2, -2);
                        try {
                          const html = katex.renderToString(formula, { displayMode: true, throwOnError: false });
                          return <div key={idx} className="latex-block" dangerouslySetInnerHTML={{ __html: html }} />;
                        } catch (e) {
                          return <div key={idx} className="latex-block-error"><code>{formula}</code></div>;
                        }
                      }
                      return <p key={idx} className="explanation-line">{renderTextWithMath(line)}</p>;
                    })}
                  </div>
                </div>
              )}
            </div>
          );
        })}

        {/* Footer: nộp bài / làm lại / chọn dạng khác */}
        <div className="exercise-footer-actions">
          {showWarning && (
            <div className="warning-banner animate-fade-in">
              <AlertCircle size={16} />
              <span>
                Bạn chưa làm hết! Còn <strong>{totalQuestions - answeredCount}</strong> câu chưa chọn đáp án.
              </span>
            </div>
          )}

          {!isSubmitted ? (
            <button
              className={`submit-all-btn ${allAnswered ? 'ready' : ''}`}
              onClick={handleSubmit}
            >
              Nộp bài &amp; Xem kết quả ({answeredCount}/{totalQuestions})
            </button>
          ) : (
            <div className="footer-btn-row">
              <button className="reset-all-btn" onClick={handleReset}>
                <RefreshCw size={16} /> Làm lại dạng này
              </button>
              <button className="back-dang-btn" onClick={handleBackToDang}>
                <ChevronLeft size={16} /> Chọn dạng khác
              </button>
            </div>
          )}
        </div>
      </div>
    </div>
  );
}

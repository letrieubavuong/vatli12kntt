import React, { useState, useEffect } from 'react';
import { renderTextWithMath } from './Latex';
import { Lock, Check, X, HelpCircle, RefreshCw, Award, AlertCircle } from 'lucide-react';
import katex from 'katex';

export default function Exercises({ exercises, studentInfo, onOpenLogin, lessonTitle }) {
  // State lưu đáp án đang chọn của học sinh cho mỗi câu hỏi: { [exerciseId]: index }
  const [selectedOptions, setSelectedOptions] = useState({});
  // State lưu trạng thái đã nộp toàn bộ bài tập hay chưa
  const [isSubmittedAll, setIsSubmittedAll] = useState(false);
  // State hiển thị cảnh báo nếu nhấn nộp bài khi chưa làm hết
  const [showWarning, setShowWarning] = useState(false);

  // Reset trạng thái làm bài khi chuyển bài học mới
  useEffect(() => {
    setSelectedOptions({});
    setIsSubmittedAll(false);
    setShowWarning(false);
  }, [exercises]);

  if (!exercises || exercises.length === 0) {
    return (
      <div className="no-exercises">
        <HelpCircle className="no-ex-icon" size={32} />
        <p>Bài học này hiện chưa có bài tập vận dụng.</p>
      </div>
    );
  }

  // Nhóm bài tập theo dạng (Dạng bài)
  const groupedExercises = exercises.reduce((groups, item) => {
    const type = item.type || "Bài tập tổng hợp";
    if (!groups[type]) {
      groups[type] = [];
    }
    groups[type].push(item);
    return groups;
  }, {});

  const handleSelectOption = (exerciseId, optionIndex) => {
    if (!studentInfo) {
      onOpenLogin();
      return;
    }
    if (isSubmittedAll) return;

    setSelectedOptions(prev => ({
      ...prev,
      [exerciseId]: optionIndex
    }));
    setShowWarning(false);
  };

  // Tính số câu đã trả lời
  const totalQuestions = exercises.length;
  const answeredCount = Object.keys(selectedOptions).length;
  const allAnswered = answeredCount === totalQuestions;

  // Tính số câu đúng sau khi nộp
  const correctCount = exercises.filter(ex => selectedOptions[ex.id] === ex.correctOption).length;
  const scorePercentage = Math.round((correctCount / totalQuestions) * 100);

  const saveMockSubmission = (payload) => {
    const submission = {
      ...payload,
      submittedAt: new Date().toISOString()
    };
    const current = localStorage.getItem('admin_mock_submissions');
    let list = [];
    if (current) {
      try {
        list = JSON.parse(current);
      } catch (e) {}
    }
    list.unshift(submission);
    localStorage.setItem('admin_mock_submissions', JSON.stringify(list));
  };

  const handleSubmitAll = async () => {
    if (!studentInfo) {
      onOpenLogin();
      return;
    }
    if (!allAnswered) {
      setShowWarning(true);
      return;
    }
    setIsSubmittedAll(true);
    setShowWarning(false);

    const payload = {
      name: studentInfo.name,
      phone: studentInfo.phone,
      lessonTitle: lessonTitle || 'Bài học Vật lý',
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
      if (data.warning) {
        saveMockSubmission(payload);
      }
    } catch (e) {
      saveMockSubmission(payload);
    }
  };

  const handleResetAll = () => {
    setSelectedOptions({});
    setIsSubmittedAll(false);
    setShowWarning(false);
  };

  return (
    <div className="exercises-section">
      <div className="section-header">
        <h3>🎯 Bài tập vận dụng</h3>
        {studentInfo && isSubmittedAll && (
          <div className="score-summary">
            <Award size={18} />
            <span>Kết quả: <strong>{correctCount}/{totalQuestions}</strong> câu ({scorePercentage}%)</span>
          </div>
        )}
      </div>

      {!studentInfo ? (
        // Hiển thị màn hình Khóa nếu chưa đăng nhập
        <div className="exercises-locked-card">
          <div className="lock-icon-wrapper">
            <Lock size={32} />
          </div>
          <h4>Nội dung bài tập đang khóa</h4>
          <p>Học sinh vui lòng đăng nhập thông tin cá nhân (Họ tên & Số điện thoại) để mở khóa làm bài tập tự luyện và xem lời giải chi tiết.</p>
          <button className="unlock-btn" onClick={onOpenLogin}>
            Đăng ký làm bài tập ngay
          </button>
        </div>
      ) : (
        // Giao diện làm bài tập
        <div className="exercises-list">
          {/* Kết quả tổng quan nếu đã nộp bài */}
          {isSubmittedAll && (
            <div className="score-board-card animate-fade-in">
              <Award size={36} className="score-board-icon" />
              <div>
                <h4>Chúc mừng bạn đã hoàn thành bài tập!</h4>
                <p>Học sinh: <strong>{studentInfo.name}</strong> - SĐT: <strong>{studentInfo.phone}</strong></p>
                <p className="score-text">Đúng <strong>{correctCount}</strong> trên tổng số <strong>{totalQuestions}</strong> câu hỏi (Đạt <strong>{scorePercentage}%</strong> điểm).</p>
              </div>
            </div>
          )}

          {Object.keys(groupedExercises).map((type, groupIdx) => (
            <div key={groupIdx} className="exercise-group">
              <h4 className="exercise-group-title">{type}</h4>
              
              {groupedExercises[type].map((ex, exIdx) => {
                const isSelected = selectedOptions[ex.id] !== undefined;
                const selectedOption = selectedOptions[ex.id];
                const isCorrect = selectedOption === ex.correctOption;

                return (
                  <div key={ex.id} className={`exercise-card ${isSubmittedAll ? (isCorrect ? 'correct-border' : 'incorrect-border') : ''}`}>
                    <div className="exercise-question-header">
                      <span className="question-number">Câu {exIdx + 1}:</span>
                      <div className="question-text">{renderTextWithMath(ex.question)}</div>
                    </div>

                    <div className="exercise-options">
                      {ex.options.map((opt, optIdx) => {
                        let optionClass = "";
                        
                        if (isSubmittedAll) {
                          if (optIdx === ex.correctOption) {
                            optionClass = "correct-option"; // Đáp án đúng tô xanh lá
                          } else if (optIdx === selectedOption) {
                            optionClass = "incorrect-option"; // Đáp án học sinh chọn sai tô đỏ
                          } else {
                            optionClass = "disabled-option";
                          }
                        } else if (selectedOption === optIdx) {
                          optionClass = "selected-option"; // Đáp án đang được chọn
                        }

                        return (
                          <button
                            key={optIdx}
                            className={`option-btn ${optionClass}`}
                            onClick={() => handleSelectOption(ex.id, optIdx)}
                            disabled={isSubmittedAll}
                          >
                            <span className="option-marker">
                              {isSubmittedAll && optIdx === ex.correctOption && <Check size={14} />}
                              {isSubmittedAll && optIdx === selectedOption && optIdx !== ex.correctOption && <X size={14} />}
                              {!isSubmittedAll && String.fromCharCode(65 + optIdx)}
                            </span>
                            <span className="option-text">{renderTextWithMath(opt)}</span>
                          </button>
                        );
                      })}
                    </div>

                    {/* Hiển thị lời giải chi tiết khi ĐÃ nộp bài */}
                    {isSubmittedAll && (
                      <div className="exercise-explanation animate-fade-in">
                        <div className="explanation-title">
                          {isCorrect ? (
                            <span className="text-success">🎉 Chính xác! Lời giải chi tiết:</span>
                          ) : (
                            <span className="text-danger">❌ Chưa chính xác. Lời giải chi tiết:</span>
                          )}
                        </div>
                        <div className="explanation-content">
                          {ex.explanation.split('\n').map((line, idx) => {
                            if (line.trim().startsWith('$$') && line.trim().endsWith('$$')) {
                              const formula = line.trim().slice(2, -2);
                              try {
                                const html = katex.renderToString(formula, { displayMode: true, throwOnError: false });
                                return <div key={idx} className="latex-block" dangerouslySetInnerHTML={{ __html: html }} />;
                              } catch(e) {
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
            </div>
          ))}

          {/* Khu vực nút nộp bài / làm lại ở dưới cùng */}
          <div className="exercise-footer-actions">
            {showWarning && (
              <div className="warning-banner animate-fade-in">
                <AlertCircle size={16} />
                <span>Bạn chưa làm hết tất cả các câu hỏi. Vui lòng hoàn thành cả <strong>{totalQuestions}</strong> câu (Hiện tại mới chọn: <strong>{answeredCount}</strong> câu) để xem kết quả.</span>
              </div>
            )}

            {!isSubmittedAll ? (
              <button
                className={`submit-all-btn ${allAnswered ? 'ready' : ''}`}
                onClick={handleSubmitAll}
              >
                Nộp bài & Xem kết quả ({answeredCount}/{totalQuestions})
              </button>
            ) : (
              <button
                className="reset-all-btn"
                onClick={handleResetAll}
              >
                <RefreshCw size={16} /> Làm lại bài tập bài này
              </button>
            )}
          </div>
        </div>
      )}
    </div>
  );
}

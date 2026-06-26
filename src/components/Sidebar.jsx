import React, { useState } from 'react';
import { ChevronDown, ChevronRight, BookOpen, Menu, X, GraduationCap } from 'lucide-react';

export default function Sidebar({
  chapters,
  currentLessonId,
  onSelectLesson,
  isOpen,
  onToggle,
  onSelectAdminView,
  onExitRole
}) {
  // Trạng thái mở rộng/thu gọn của từng chương (mặc định mở chương 1)
  const [expandedChapters, setExpandedChapters] = useState({
    'chuong-1': true,
    'chuong-2': true,
  });

  const toggleChapter = (chapterId) => {
    setExpandedChapters(prev => ({
      ...prev,
      [chapterId]: !prev[chapterId]
    }));
  };

  return (
    <>
      {/* Nút bấm Hamburger hiển thị trên Mobile */}
      <button className="mobile-toggle-btn" onClick={onToggle} aria-label="Toggle menu">
        {isOpen ? <X size={24} /> : <Menu size={24} />}
      </button>

      {/* Lớp nền tối mờ khi mở Sidebar trên Mobile */}
      {isOpen && <div className="sidebar-backdrop" onClick={onToggle}></div>}

      {/* Sidebar chính */}
      <aside className={`sidebar-container ${isOpen ? 'is-open' : ''}`}>
        <div className="sidebar-brand">
          <GraduationCap className="brand-icon" size={32} />
          <div>
            <h1>Vật lí 12</h1>
            <span>Kết nối tri thức</span>
          </div>
        </div>

        <nav className="sidebar-nav">
          {chapters.map(chapter => {
            const isExpanded = !!expandedChapters[chapter.id];
            
            return (
              <div key={chapter.id} className="chapter-group">
                {/* Tiêu đề chương (Nhấp vào để đóng/mở) */}
                <button
                  className="chapter-header-btn"
                  onClick={() => toggleChapter(chapter.id)}
                  aria-expanded={isExpanded}
                >
                  <span className="chapter-title-text">{chapter.title}</span>
                  {isExpanded ? <ChevronDown size={18} className="chevron-icon" /> : <ChevronRight size={18} className="chevron-icon" />}
                </button>

                {/* Danh sách các bài học thuộc chương */}
                {isExpanded && (
                  <ul className="lesson-list">
                    {chapter.lessons.map(lesson => {
                      const isActive = lesson.id === currentLessonId;
                      return (
                        <li key={lesson.id} className="lesson-item">
                          <button
                            className={`lesson-link-btn ${isActive ? 'is-active' : ''}`}
                            onClick={() => {
                              onSelectLesson(lesson.id);
                              // Tự động đóng sidebar trên mobile khi chọn xong bài học
                              if (window.innerWidth <= 768) {
                                onToggle();
                              }
                            }}
                          >
                            <BookOpen size={16} className="lesson-icon" />
                            <span className="lesson-title">{lesson.title}</span>
                          </button>
                        </li>
                      );
                    })}
                  </ul>
                )}
              </div>
            );
          })}
        </nav>

        <div className="sidebar-footer">
          <button 
            className="admin-link-btn" 
            onClick={onSelectAdminView}
            style={{ marginBottom: '0.4rem' }}
          >
            Dành cho Giáo viên
          </button>
          <button 
            className="exit-role-btn" 
            onClick={onExitRole}
          >
            Thoát / Đổi vai trò
          </button>
          <p style={{ marginTop: '0.5rem' }}>© 2026 Bài giảng Vật Lí 12</p>
        </div>
      </aside>
    </>
  );
}

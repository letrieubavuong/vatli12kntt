import React, { useState, useEffect } from 'react';
import Sidebar from './components/Sidebar';
import Header from './components/Header';
import Latex from './components/Latex';
import Exercises from './components/Exercises';
import AdminView from './components/AdminView';
import { physicsCatalog } from './data/physicsCatalog';
import { BookOpen, Award, GraduationCap, Shield, User, Phone, Key, AlertCircle, RefreshCw } from 'lucide-react';

export default function App() {
  // 1. Vai trò trong phiên làm việc hiện tại: 'student' | 'admin' | null
  const [sessionRole, setSessionRole] = useState(() => {
    // Đọc vai trò đã chọn trong phiên làm việc
    return sessionStorage.getItem('sessionRole') || null;
  });

  // 2. Bài học hiện tại (cho Học sinh)
  const [currentLessonId, setCurrentLessonId] = useState('bai-1');

  // 3. Thông tin học sinh đăng ký (đọc từ localStorage nếu có)
  const [studentInfo, setStudentInfo] = useState(null);

  // 4. Tab hiển thị: Lý thuyết / Bài tập
  const [activeTab, setActiveTab] = useState('theory');

  // 5. Trạng thái Sidebar trên Mobile
  const [isSidebarOpen, setIsSidebarOpen] = useState(false);

  // --- Dynamic Loading for Lesson Content ---
  const [activeLessonContent, setActiveLessonContent] = useState(null);
  const [isLessonLoading, setIsLessonLoading] = useState(true);

  // --- Các State phục vụ màn hình Portal Đăng nhập ---
  const [portalSelection, setPortalSelection] = useState(null); // 'student' | 'admin' | null
  const [regName, setRegName] = useState('');
  const [regPhone, setRegPhone] = useState('');
  const [regErrors, setRegErrors] = useState({});
  
  const [adminPassword, setAdminPassword] = useState('');
  const [adminError, setAdminError] = useState('');
  const [loading, setLoading] = useState(false);

  // Đọc thông tin học sinh từ localStorage
  useEffect(() => {
    const savedInfo = localStorage.getItem('studentInfo');
    if (savedInfo) {
      try {
        setStudentInfo(JSON.parse(savedInfo));
      } catch (e) {
        localStorage.removeItem('studentInfo');
      }
    }
  }, []);

  // Tải động nội dung bài học khi đổi bài
  useEffect(() => {
    let isMounted = true;
    setIsLessonLoading(true);
    
    import(`./data/lessons/${currentLessonId}.js`)
      .then((module) => {
        if (isMounted) {
          setActiveLessonContent(module.default);
          setIsLessonLoading(false);
        }
      })
      .catch((err) => {
        console.error('Failed to load lesson content:', err);
        if (isMounted) {
          setActiveLessonContent({ theory: '', exercises: [] });
          setIsLessonLoading(false);
        }
      });
      
    return () => {
      isMounted = false;
    };
  }, [currentLessonId]);

  // Tìm bài học hiện tại dựa trên ID
  const allLessons = physicsCatalog.flatMap(chapter => chapter.lessons);
  const currentLesson = allLessons.find(lesson => lesson.id === currentLessonId) || allLessons[0];

  // Tìm chương chứa bài học hiện tại
  const currentChapter = physicsCatalog.find(chapter =>
    chapter.lessons.some(lesson => lesson.id === currentLesson.id)
  ) || physicsCatalog[0];

  const handleSelectLesson = (lessonId) => {
    setCurrentLessonId(lessonId);
    setActiveTab('theory');
  };

  const handleLogoutStudent = () => {
    if (window.confirm('Bạn muốn đăng xuất học sinh và xóa thông tin lưu trên máy này?')) {
      localStorage.removeItem('studentInfo');
      setStudentInfo(null);
      setSessionRole(null);
      sessionStorage.removeItem('sessionRole');
      setPortalSelection(null);
    }
  };

  const handleExitSession = () => {
    setSessionRole(null);
    sessionStorage.removeItem('sessionRole');
    setPortalSelection(null);
  };

  // Hàm lưu đăng ký giả lập cục bộ khi chạy offline/localhost
  const saveMockReg = (payload) => {
    const record = {
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
    list.unshift(record);
    localStorage.setItem('admin_mock_submissions', JSON.stringify(list));
  };

  // Học sinh Đăng ký tài khoản
  const handleRegister = async (e) => {
    e.preventDefault();
    const cleanName = regName.trim();
    const cleanPhone = regPhone.trim();
    const phoneRegex = /^(0[3|5|7|8|9])([0-9]{8})$/;
    
    const errors = {};
    if (!cleanName) {
      errors.name = 'Vui lòng điền họ và tên.';
    } else if (cleanName.length < 3) {
      errors.name = 'Họ tên phải từ 3 ký tự trở lên.';
    }

    if (!cleanPhone) {
      errors.phone = 'Vui lòng điền số điện thoại.';
    } else if (!phoneRegex.test(cleanPhone)) {
      errors.phone = 'Số điện thoại không đúng định dạng VN (10 số).';
    }

    if (Object.keys(errors).length > 0) {
      setRegErrors(errors);
      return;
    }

    setLoading(true);
    const info = { name: cleanName, phone: cleanPhone };
    
    // Gửi thông tin đăng ký vào cơ sở dữ liệu
    const payload = {
      name: cleanName,
      phone: cleanPhone,
      lessonTitle: "Đăng ký tài khoản",
      correctCount: 0,
      totalQuestions: 0
    };

    try {
      const res = await fetch('/api/submit', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(payload)
      });
      const data = await res.json();
      if (data.warning) {
        saveMockReg(payload);
      }
    } catch (err) {
      saveMockReg(payload);
    } finally {
      setLoading(false);
    }

    // Lưu cục bộ và chuyển vai trò học tập
    localStorage.setItem('studentInfo', JSON.stringify(info));
    setStudentInfo(info);
    setSessionRole('student');
    sessionStorage.setItem('sessionRole', 'student');
  };

  // Đăng nhập vai trò Học sinh (nếu đã có thông tin đăng ký trước)
  const handleEnterAsStudent = () => {
    if (studentInfo) {
      setSessionRole('student');
      sessionStorage.setItem('sessionRole', 'student');
    } else {
      setPortalSelection('student');
    }
  };

  // Giáo viên đăng nhập
  const handleTeacherLogin = async (e) => {
    e.preventDefault();
    if (!adminPassword) {
      setAdminError('Vui lòng nhập mật khẩu.');
      return;
    }

    setLoading(true);
    setAdminError('');

    try {
      const res = await fetch(`/api/results?password=${encodeURIComponent(adminPassword)}`);
      
      if (res.status === 401) {
        setAdminError('Mật khẩu quản trị không chính xác.');
        setLoading(false);
        return;
      }
      
      // Cho phép đăng nhập thành công nếu API trả kết quả hoặc fallback giả lập
      sessionStorage.setItem('adminPassword', adminPassword);
      setSessionRole('admin');
      sessionStorage.setItem('sessionRole', 'admin');
    } catch (err) {
      // Offline local mode fallback
      if (adminPassword === 'admin123') {
        sessionStorage.setItem('adminPassword', adminPassword);
        setSessionRole('admin');
        sessionStorage.setItem('sessionRole', 'admin');
      } else {
        setAdminError('Sai mật khẩu offline (mặc định: admin123).');
      }
    } finally {
      setLoading(false);
    }
  };

  // --- 1. GIAO DIỆN CỔNG CHÀO MỪNG (PORTAL VIEW) ---
  if (sessionRole === null) {
    return (
      <div className="portal-overlay">
        <div className="portal-container animate-fade-in">
          <header className="portal-header">
            <GraduationCap className="portal-logo" size={48} />
            <h1>Cổng Học Tập Vật Lí 10 KNTT</h1>
            <p>Hệ thống bài giảng điện tử và bài tập tự luyện thông minh</p>
          </header>

          <div className="portal-roles-grid">
            {/* CARD 1: HỌC SINH */}
            <div className={`portal-card ${portalSelection === 'student' ? 'active' : ''}`}>
              <div className="portal-card-header">
                <div className="role-icon-wrapper student">
                  <User size={32} />
                </div>
                <h2>Khu vực Học sinh</h2>
                <p>Xem bài giảng lý thuyết, công thức Vật lý và làm bài tập trắc nghiệm vận dụng.</p>
              </div>

              {portalSelection !== 'student' ? (
                <button className="portal-action-btn student" onClick={handleEnterAsStudent}>
                  {studentInfo ? `Tiếp tục học (${studentInfo.name})` : 'Đăng nhập học tập'}
                </button>
              ) : (
                // Form đăng ký nếu chưa có tài khoản lưu sẵn
                <form onSubmit={handleRegister} className="portal-form animate-fade-in">
                  <h4>Đăng ký tài khoản mới</h4>
                  <div className="form-group">
                    <label>Họ và tên</label>
                    <div className="input-wrapper">
                      <User className="input-icon" size={16} />
                      <input
                        type="text"
                        placeholder="Nguyễn Văn A"
                        value={regName}
                        onChange={(e) => setRegName(e.target.value)}
                        disabled={loading}
                      />
                    </div>
                    {regErrors.name && <span className="error-message">{regErrors.name}</span>}
                  </div>

                  <div className="form-group">
                    <label>Số điện thoại</label>
                    <div className="input-wrapper">
                      <Phone className="input-icon" size={16} />
                      <input
                        type="tel"
                        placeholder="0987654321"
                        value={regPhone}
                        onChange={(e) => setRegPhone(e.target.value)}
                        disabled={loading}
                      />
                    </div>
                    {regErrors.phone && <span className="error-message">{regErrors.phone}</span>}
                  </div>

                  <div className="portal-form-buttons">
                    <button type="button" className="btn-cancel" onClick={() => setPortalSelection(null)} disabled={loading}>
                      Hủy
                    </button>
                    <button type="submit" className="btn-submit student" disabled={loading}>
                      {loading ? <RefreshCw className="animate-spin" size={16} /> : 'Đăng ký & Vào học'}
                    </button>
                  </div>
                </form>
              )}
            </div>

            {/* CARD 2: GIÁO VIÊN */}
            <div className={`portal-card ${portalSelection === 'admin' ? 'active' : ''}`}>
              <div className="portal-card-header">
                <div className="role-icon-wrapper teacher">
                  <Shield size={32} />
                </div>
                <h2>Khu vực Giáo viên</h2>
                <p>Xem danh sách học sinh đã đăng ký và theo dõi bảng điểm chi tiết bài tập vận dụng.</p>
              </div>

              {portalSelection !== 'admin' ? (
                <button className="portal-action-btn teacher" onClick={() => setPortalSelection('admin')}>
                  Quản lý lớp học
                </button>
              ) : (
                // Form đăng nhập mật khẩu admin
                <form onSubmit={handleTeacherLogin} className="portal-form animate-fade-in">
                  <h4>Xác thực quyền quản trị</h4>
                  <div className="form-group">
                    <label>Mật khẩu Giáo viên</label>
                    <div className="input-wrapper">
                      <Key className="input-icon" size={16} />
                      <input
                        type="password"
                        placeholder="Mật khẩu (Mặc định: admin123)"
                        value={adminPassword}
                        onChange={(e) => setAdminPassword(e.target.value)}
                        disabled={loading}
                      />
                    </div>
                    {adminError && <span className="error-message">{adminError}</span>}
                  </div>

                  <div className="portal-form-buttons">
                    <button type="button" className="btn-cancel" onClick={() => setPortalSelection(null)} disabled={loading}>
                      Hủy
                    </button>
                    <button type="submit" className="btn-submit teacher" disabled={loading}>
                      {loading ? <RefreshCw className="animate-spin" size={16} /> : 'Đăng nhập'}
                    </button>
                  </div>
                </form>
              )}
            </div>
          </div>
        </div>
      </div>
    );
  }

  // --- 2. GIAO DIỆN GIÁO VIÊN (ADMIN VIEW) ---
  if (sessionRole === 'admin') {
    return <AdminView onClose={handleExitSession} />;
  }

  // --- 3. GIAO DIỆN HỌC SINH (STUDENT VIEW) ---
  return (
    <div className="app-container">
      {/* 1. Thanh điều hướng Mục lục bên trái */}
      <Sidebar
        chapters={physicsCatalog}
        currentLessonId={currentLessonId}
        onSelectLesson={handleSelectLesson}
        isOpen={isSidebarOpen}
        onToggle={() => setIsSidebarOpen(!isSidebarOpen)}
        onSelectAdminView={() => {
          setSessionRole('admin');
          sessionStorage.setItem('sessionRole', 'admin');
        }}
        onExitRole={handleExitSession}
      />

      {/* 2. Phần nội dung chính bên phải */}
      <div className="main-wrapper">
        {/* Thanh đầu trang */}
        <Header
          studentInfo={studentInfo}
          onLogout={handleLogoutStudent}
          onOpenLogin={() => {
            setSessionRole(null);
            sessionStorage.removeItem('sessionRole');
            setPortalSelection('student');
          }}
        />

        <main className="content-container">
          <div className="lesson-container">
            {/* Tiêu đề & Tag chương */}
            <div className="lesson-header animate-fade-in">
              <span className="lesson-tag">{currentChapter.title}</span>
              <h1 className="lesson-main-title">{currentLesson.title}</h1>
            </div>

            {/* Điều hướng Tab: Lý thuyết / Bài tập */}
            <div className="tabs-navigation">
              <button
                className={`tab-btn ${activeTab === 'theory' ? 'is-active' : ''}`}
                onClick={() => setActiveTab('theory')}
              >
                <BookOpen size={18} />
                <span>📚 Lý thuyết bài học</span>
              </button>
              <button
                className={`tab-btn ${activeTab === 'exercises' ? 'is-active' : ''}`}
                onClick={() => setActiveTab('exercises')}
              >
                <Award size={18} />
                <span>🎯 Bài tập vận dụng</span>
              </button>
            </div>

            {/* Chi tiết nội dung của từng Tab */}
            <div className="tab-content-panel">
              {isLessonLoading ? (
                <div className="az-loading-container animate-fade-in">
                  <div className="az-spinner"></div>
                  <p>Đang tải nội dung bài học...</p>
                </div>
              ) : activeTab === 'theory' ? (
                <article className="theory-card animate-fade-in">
                  <Latex content={activeLessonContent?.theory} />
                </article>
              ) : (
                <Exercises
                  exercises={activeLessonContent?.exercises || []}
                  studentInfo={studentInfo}
                  onOpenLogin={() => {
                    setSessionRole(null);
                    sessionStorage.removeItem('sessionRole');
                    setPortalSelection('student');
                  }}
                  lessonTitle={currentLesson.title}
                />
              )}
            </div>
          </div>
        </main>
      </div>
    </div>
  );
}

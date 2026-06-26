import React, { useState, useEffect } from 'react';
import { Shield, Key, Search, Calendar, Award, RefreshCw, Trash2, ArrowLeft, LogOut, Users, FileText, Check } from 'lucide-react';

export default function AdminView({ onClose }) {
  const [password, setPassword] = useState('');
  const [isAuthorized, setIsAuthorized] = useState(false);
  const [submissions, setSubmissions] = useState([]);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');
  const [warning, setWarning] = useState('');
  
  // Tab hiện tại: 'scores' (Bảng điểm bài tập) hoặc 'students' (Danh sách học sinh)
  const [adminTab, setAdminTab] = useState('scores');

  // Các bộ lọc
  const [searchTerm, setSearchTerm] = useState('');
  const [selectedLesson, setSelectedLesson] = useState('all');

  // Kiểm tra nếu đã đăng nhập admin trước đó
  useEffect(() => {
    const savedPassword = sessionStorage.getItem('adminPassword');
    if (savedPassword) {
      setPassword(savedPassword);
      fetchData(savedPassword);
    }
  }, []);

  const fetchData = async (pwd) => {
    setLoading(true);
    setError('');
    setWarning('');
    
    try {
      const res = await fetch(`/api/results?password=${encodeURIComponent(pwd)}`);
      
      if (res.status === 401) {
        setError('Mật khẩu quản trị không chính xác.');
        setIsAuthorized(false);
        sessionStorage.removeItem('adminPassword');
        setLoading(false);
        return;
      }
      
      if (!res.ok) {
        throw new Error('Không thể tải dữ liệu từ máy chủ.');
      }
      
      const data = await res.json();
      
      if (data.warning) {
        setWarning(data.warning);
        loadMockData();
      } else {
        setSubmissions(data.submissions || []);
        setIsAuthorized(true);
        sessionStorage.setItem('adminPassword', pwd);
      }
    } catch (e) {
      console.warn('Lỗi kết nối API backend, chuyển sang chế độ giả lập cục bộ (Local Mode):', e);
      setWarning('Đang chạy ở chế độ giả lập cục bộ (Offline Local Mode). Dữ liệu lấy từ LocalStorage.');
      loadMockData();
    } finally {
      setLoading(false);
    }
  };

  const loadMockData = () => {
    const mock = localStorage.getItem('admin_mock_submissions');
    if (mock) {
      try {
        setSubmissions(JSON.parse(mock));
      } catch (e) {
        setSubmissions([]);
      }
    } else {
      setSubmissions([]);
    }
    setIsAuthorized(true);
  };

  const handleLogin = (e) => {
    e.preventDefault();
    if (!password) {
      setError('Vui lòng nhập mật khẩu.');
      return;
    }
    fetchData(password);
  };

  const handleLogout = () => {
    setIsAuthorized(false);
    setPassword('');
    sessionStorage.removeItem('adminPassword');
  };

  const handleResetData = async () => {
    if (!window.confirm('CẢNH BÁO: Hành động này sẽ xóa toàn bộ bảng điểm và danh sách học sinh trên cơ sở dữ liệu. Bạn có chắc chắn muốn tiếp tục?')) {
      return;
    }

    setLoading(true);
    try {
      const res = await fetch('/api/reset', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ password })
      });

      if (res.ok) {
        setSubmissions([]);
        localStorage.removeItem('admin_mock_submissions');
        alert('Đã xóa sạch dữ liệu bảng điểm thành công.');
      } else {
        const data = await res.json();
        alert(data.error || 'Lỗi khi xóa bảng điểm.');
      }
    } catch (e) {
      setSubmissions([]);
      localStorage.removeItem('admin_mock_submissions');
      alert('Đã xóa sạch dữ liệu giả lập cục bộ.');
    } finally {
      setLoading(false);
    }
  };

  // --- PHÂN PHỐI VÀ LỌC DỮ LIỆU ---

  // 1. Phân loại chỉ lấy bản ghi làm bài tập (lọc bỏ bản ghi đăng ký tài khoản)
  const scoreSubmissions = submissions.filter(sub => sub.lessonTitle !== 'Đăng ký tài khoản');

  // Lọc danh sách bài làm theo ô tìm kiếm và bài học
  const filteredScores = scoreSubmissions.filter(item => {
    const matchesSearch = 
      item.name.toLowerCase().includes(searchTerm.toLowerCase()) ||
      item.phone.includes(searchTerm);
      
    const matchesLesson = 
      selectedLesson === 'all' || 
      item.lessonTitle === selectedLesson;

    return matchesSearch && matchesLesson;
  });

  // 2. Gom nhóm danh sách Học sinh duy nhất (Unique Students)
  const studentsMap = {};
  submissions.forEach(sub => {
    const phone = sub.phone;
    if (!studentsMap[phone]) {
      studentsMap[phone] = {
        name: sub.name,
        phone: sub.phone,
        registeredAt: sub.submittedAt, // Mặc định thời gian nộp bản ghi đầu tiên
        completedLessonsCount: 0
      };
    }
    
    // Nếu là bản ghi đăng ký chính thức
    if (sub.lessonTitle === 'Đăng ký tài khoản') {
      studentsMap[phone].registeredAt = sub.submittedAt;
    } else {
      // Đếm số bài học học sinh này đã làm bài tập
      studentsMap[phone].completedLessonsCount += 1;
    }
  });

  const studentsList = Object.values(studentsMap);

  // Lọc danh sách học sinh theo ô tìm kiếm
  const filteredStudents = studentsList.filter(student => 
    student.name.toLowerCase().includes(searchTerm.toLowerCase()) ||
    student.phone.includes(searchTerm)
  );

  // --- TÍNH TOÁN CÁC CHỈ SỐ THỐNG KÊ ---
  const totalSubmissionsCount = scoreSubmissions.length;
  const uniqueStudentsCount = studentsList.length;
  const averageScore = totalSubmissionsCount > 0 
    ? Math.round((scoreSubmissions.reduce((acc, s) => acc + (s.correctCount / s.totalQuestions), 0) / totalSubmissionsCount) * 100)
    : 0;

  // Lấy các bài học duy nhất có bài nộp
  const uniqueLessons = Array.from(new Set(scoreSubmissions.map(s => s.lessonTitle)));

  // Định dạng ngày giờ VN
  const formatDateTime = (isoString) => {
    try {
      const date = new Date(isoString);
      const hours = String(date.getHours()).padStart(2, '0');
      const minutes = String(date.getMinutes()).padStart(2, '0');
      const day = String(date.getDate()).padStart(2, '0');
      const month = String(date.getMonth() + 1).padStart(2, '0');
      const year = date.getFullYear();
      return `${hours}:${minutes} ${day}/${month}/${year}`;
    } catch (e) {
      return isoString;
    }
  };

  if (!isAuthorized) {
    // 1. Màn hình nhập mật khẩu Admin
    return (
      <div className="admin-login-overlay">
        <div className="admin-login-card animate-fade-in">
          <div className="admin-icon-wrapper">
            <Shield size={36} />
          </div>
          <h2>Bảng điểm Giáo viên</h2>
          <p>Vui lòng nhập mật khẩu quản trị để truy cập dữ liệu học sinh làm bài tập.</p>

          <form onSubmit={handleLogin} className="admin-login-form">
            <div className="form-group">
              <label htmlFor="admin-pwd">Mật khẩu bảo mật</label>
              <div className="input-wrapper">
                <Key className="input-icon" size={18} />
                <input
                  id="admin-pwd"
                  type="password"
                  placeholder="Nhập mật khẩu (Mặc định: admin123)"
                  value={password}
                  onChange={(e) => setPassword(e.target.value)}
                  disabled={loading}
                />
              </div>
              {error && <span className="error-message">{error}</span>}
            </div>

            <div className="admin-login-actions">
              <button type="button" className="admin-back-btn" onClick={onClose} disabled={loading}>
                <ArrowLeft size={16} /> Quay lại trang chủ
              </button>
              <button type="submit" className="admin-submit-btn" disabled={loading}>
                {loading ? <RefreshCw size={16} className="animate-spin" /> : 'Đăng nhập'}
              </button>
            </div>
          </form>
        </div>
      </div>
    );
  }

  // 2. Màn hình Bảng quản trị chính (Dashboard)
  return (
    <div className="admin-dashboard-container animate-fade-in">
      {/* Header Dashboard */}
      <div className="admin-dash-header">
        <div className="header-left">
          <span className="header-subtitle">Hệ thống quản lý điểm số</span>
          <h2>Trang quản trị giáo viên</h2>
        </div>
        <div className="admin-header-actions">
          <button className="admin-back-btn" onClick={onClose}>
            <ArrowLeft size={16} /> Thoát / Đổi vai trò
          </button>
          <button className="admin-logout-btn" onClick={handleLogout}>
            <LogOut size={16} /> Đăng xuất Admin
          </button>
        </div>
      </div>

      {warning && (
        <div className="warning-banner" style={{ marginBottom: '0.5rem', maxWidth: '100%' }}>
          <AlertCircleIcon />
          <span>{warning}</span>
        </div>
      )}

      {/* Thống kê Tổng quan */}
      <div className="admin-stats-grid">
        <div className="stats-card">
          <div className="stats-icon-wrapper blue">
            <FileText size={24} />
          </div>
          <div className="stats-info">
            <span className="stats-label">Lượt nộp bài tập</span>
            <span className="stats-value">{totalSubmissionsCount}</span>
          </div>
        </div>

        <div className="stats-card">
          <div className="stats-icon-wrapper purple">
            <Users size={24} />
          </div>
          <div className="stats-info">
            <span className="stats-label">Học sinh đăng ký</span>
            <span className="stats-value">{uniqueStudentsCount}</span>
          </div>
        </div>

        <div className="stats-card">
          <div className="stats-icon-wrapper green">
            <Award size={24} />
          </div>
          <div className="stats-info">
            <span className="stats-label">Tỉ lệ đúng trung bình</span>
            <span className="stats-value">{averageScore}%</span>
          </div>
        </div>
      </div>

      {/* Điều hướng Tab Admin: Kết quả bài tập / Danh sách học sinh */}
      <div className="tabs-navigation">
        <button
          className={`tab-btn ${adminTab === 'scores' ? 'is-active' : ''}`}
          onClick={() => {
            setAdminTab('scores');
            setSearchTerm('');
          }}
        >
          <FileText size={18} />
          <span>Bảng điểm bài tập</span>
        </button>
        <button
          className={`tab-btn ${adminTab === 'students' ? 'is-active' : ''}`}
          onClick={() => {
            setAdminTab('students');
            setSearchTerm('');
          }}
        >
          <Users size={18} />
          <span>Danh sách học sinh ({uniqueStudentsCount})</span>
        </button>
      </div>

      {/* Bộ lọc dữ liệu */}
      <div className="admin-filters-bar">
        <div className="search-box">
          <Search size={18} className="search-box-icon" />
          <input
            type="text"
            placeholder={adminTab === 'scores' ? "Tìm học sinh, SĐT làm bài..." : "Tìm kiếm tên học sinh, SĐT..."}
            value={searchTerm}
            onChange={(e) => setSearchTerm(e.target.value)}
          />
        </div>

        {adminTab === 'scores' && (
          <div className="filter-select-wrapper">
            <select 
              value={selectedLesson} 
              onChange={(e) => setSelectedLesson(e.target.value)}
              className="filter-select"
            >
              <option value="all">Tất cả bài học</option>
              {uniqueLessons.map((title, idx) => (
                <option key={idx} value={title}>{title}</option>
              ))}
            </select>
          </div>
        )}

        <button className="admin-reset-data-btn" onClick={handleResetData} disabled={loading}>
          <Trash2 size={16} />
          <span>Reset hệ thống</span>
        </button>
      </div>

      {/* Bảng Dữ Liệu theo Tab */}
      <div className="admin-table-wrapper">
        {adminTab === 'scores' ? (
          // TAB 1: BẢNG ĐIỂM
          <table className="admin-table">
            <thead>
              <tr>
                <th>Họ và tên</th>
                <th>Số điện thoại</th>
                <th>Bài học đã nộp</th>
                <th className="text-center">Số câu đúng</th>
                <th className="text-center">Tỉ lệ đạt</th>
                <th>Thời gian nộp</th>
              </tr>
            </thead>
            <tbody>
              {filteredScores.length > 0 ? (
                filteredScores.map((sub, idx) => {
                  const percentage = Math.round((sub.correctCount / sub.totalQuestions) * 100);
                  let scoreClass = "badge-danger";
                  if (percentage >= 80) scoreClass = "badge-success";
                  else if (percentage >= 50) scoreClass = "badge-warning";

                  return (
                    <tr key={idx} className="animate-fade-in" style={{ animationDelay: `${idx * 0.02}s` }}>
                      <td className="font-bold text-white">{sub.name}</td>
                      <td>{sub.phone}</td>
                      <td>{sub.lessonTitle}</td>
                      <td className="text-center font-bold">{sub.correctCount}/{sub.totalQuestions}</td>
                      <td className="text-center">
                        <span className={`badge ${scoreClass}`}>{percentage}%</span>
                      </td>
                      <td className="text-muted text-sm">{formatDateTime(sub.submittedAt)}</td>
                    </tr>
                  );
                })
              ) : (
                <tr>
                  <td colSpan="6" className="table-empty-row">
                    <FileText size={32} style={{ opacity: 0.3, marginBottom: '0.5rem' }} />
                    <p>Chưa có kết quả bài tập nào phù hợp.</p>
                  </td>
                </tr>
              )}
            </tbody>
          </table>
        ) : (
          // TAB 2: DANH SÁCH HỌC SINH
          <table className="admin-table">
            <thead>
              <tr>
                <th>Họ và tên</th>
                <th>Số điện thoại</th>
                <th>Ngày đăng ký học</th>
                <th className="text-center">Số bài tập đã làm</th>
                <th className="text-center">Trạng thái</th>
              </tr>
            </thead>
            <tbody>
              {filteredStudents.length > 0 ? (
                filteredStudents.map((student, idx) => (
                  <tr key={idx} className="animate-fade-in" style={{ animationDelay: `${idx * 0.02}s` }}>
                    <td className="font-bold text-white">{student.name}</td>
                    <td className="font-bold">{student.phone}</td>
                    <td className="text-muted text-sm">{formatDateTime(student.registeredAt)}</td>
                    <td className="text-center font-bold">{student.completedLessonsCount} bài</td>
                    <td className="text-center">
                      <span className={`badge ${student.completedLessonsCount > 0 ? 'badge-success' : 'badge-warning'}`}>
                        {student.completedLessonsCount > 0 ? 'Đang học tập' : 'Vừa đăng ký'}
                      </span>
                    </td>
                  </tr>
                ))
              ) : (
                <tr>
                  <td colSpan="5" className="table-empty-row">
                    <Users size={32} style={{ opacity: 0.3, marginBottom: '0.5rem' }} />
                    <p>Chưa có học sinh nào đăng ký tham gia lớp học.</p>
                  </td>
                </tr>
              )}
            </tbody>
          </table>
        )}
      </div>
    </div>
  );
}

function AlertCircleIcon() {
  return (
    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" style={{ flexShrink: 0 }}>
      <circle cx="12" cy="12" r="10"></circle>
      <line x1="12" y1="8" x2="12" y2="12"></line>
      <line x1="12" y1="16" x2="12.01" y2="16"></line>
    </svg>
  );
}

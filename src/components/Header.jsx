import React from 'react';
import { User, LogOut, LogIn, Award } from 'lucide-react';

export default function Header({ studentInfo, onLogout, onOpenLogin }) {
  return (
    <header className="main-header">
      <div className="header-left">
        <span className="header-subtitle">Bài giảng điện tử</span>
        <h2 className="header-title">Vật lí 12 KNTT</h2>
      </div>

      <div className="header-right">
        {studentInfo ? (
          <div className="student-profile">
            <div className="student-avatar">
              <User size={18} />
            </div>
            <div className="student-info">
              <span className="student-name">{studentInfo.name}</span>
              <span className="student-phone">{studentInfo.phone}</span>
            </div>
            <button 
              className="logout-btn" 
              onClick={onLogout}
              title="Đăng xuất / Thay đổi thông tin"
            >
              <LogOut size={16} />
              <span>Đổi tài khoản</span>
            </button>
          </div>
        ) : (
          <button className="login-btn" onClick={onOpenLogin}>
            <LogIn size={18} />
            <span>Đăng nhập học tập</span>
          </button>
        )}
      </div>
    </header>
  );
}

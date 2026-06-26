import React, { useState } from 'react';
import { User, Phone, CheckCircle, AlertCircle, X } from 'lucide-react';

export default function LoginModal({ isOpen, onClose, onLogin }) {
  const [name, setName] = useState('');
  const [phone, setPhone] = useState('');
  const [errors, setErrors] = useState({});

  if (!isOpen) return null;

  const validate = () => {
    const newErrors = {};
    
    // Kiểm tra tên
    const cleanName = name.trim();
    if (!cleanName) {
      newErrors.name = 'Vui lòng nhập họ và tên của bạn.';
    } else if (cleanName.length < 3) {
      newErrors.name = 'Họ và tên phải có ít nhất 3 ký tự.';
    }

    // Kiểm tra SĐT
    const cleanPhone = phone.trim();
    const phoneRegex = /^(0[3|5|7|8|9])([0-9]{8})$/;
    if (!cleanPhone) {
      newErrors.phone = 'Vui lòng nhập số điện thoại.';
    } else if (!phoneRegex.test(cleanPhone)) {
      newErrors.phone = 'Số điện thoại không hợp lệ (ví dụ: 0912345678, gồm 10 số).';
    }

    setErrors(newErrors);
    return Object.keys(newErrors).length === 0;
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    if (validate()) {
      const studentInfo = {
        name: name.trim(),
        phone: phone.trim()
      };
      // Lưu vào localStorage
      localStorage.setItem('studentInfo', JSON.stringify(studentInfo));
      onLogin(studentInfo);
      onClose();
    }
  };

  return (
    <div className="modal-overlay">
      <div className="modal-card">
        <button className="modal-close-btn" onClick={onClose} aria-label="Đóng">
          <X size={20} />
        </button>
        
        <div className="modal-header">
          <div className="modal-icon-wrapper">
            <User className="modal-header-icon" size={28} />
          </div>
          <h2>Đăng ký thông tin học tập</h2>
          <p>Vui lòng điền họ tên và số điện thoại để hệ thống ghi nhận kết quả làm bài tập của bạn.</p>
        </div>

        <form onSubmit={handleSubmit} className="modal-form">
          <div className="form-group">
            <label htmlFor="name-input">Họ và tên học sinh</label>
            <div className={`input-wrapper ${errors.name ? 'has-error' : ''}`}>
              <User className="input-icon" size={18} />
              <input
                id="name-input"
                type="text"
                placeholder="Ví dụ: Nguyễn Văn A"
                value={name}
                onChange={(e) => setName(e.target.value)}
                autoComplete="name"
              />
            </div>
            {errors.name && (
              <span className="error-message">
                <AlertCircle size={14} /> {errors.name}
              </span>
            )}
          </div>

          <div className="form-group">
            <label htmlFor="phone-input">Số điện thoại</label>
            <div className={`input-wrapper ${errors.phone ? 'has-error' : ''}`}>
              <Phone className="input-icon" size={18} />
              <input
                id="phone-input"
                type="tel"
                placeholder="Ví dụ: 0987654321"
                value={phone}
                onChange={(e) => setPhone(e.target.value)}
                autoComplete="tel"
              />
            </div>
            {errors.phone && (
              <span className="error-message">
                <AlertCircle size={14} /> {errors.phone}
              </span>
            )}
          </div>

          <button type="submit" className="submit-btn">
            <CheckCircle size={18} /> Xác nhận & Bắt đầu làm bài
          </button>
        </form>
      </div>
    </div>
  );
}

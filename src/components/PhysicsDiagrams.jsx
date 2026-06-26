import React, { useState } from 'react';
import { Calendar, Award, Info, Code, CheckCircle, ArrowRight, CornerRightUp } from 'lucide-react';

// 1. MÃ TIKZ CỦA CÁC ĐỒ THỊ (DÙNG ĐỂ HIỂN THỊ KHI CLICK XEM CODE)
const TIKZ_TIMELINE = `\\begin{tikzpicture}[very thick,>=stealth',scale=0.75,transform shape]
% (Tải toàn bộ code Tikz dòng thời gian từ file 1P1K1.tex)
% [350 TCN] Aristotle ...
% [1600] Galilei ...
% [1687] Newton ...
% [1785] Joule ...
% [1831] Faraday ...
% [1900] Planck ...
% [1905] Einstein ...
% [1958] Mạch IC ...
\\end{tikzpicture}`;

const TIKZ_EXPERIMENTAL = `\\begin{tikzpicture}[draw=Mapcolor, very thick,>=stealth']
\\node[rectangle, draw, rounded corners, text width=3.5cm,align = center, minimum height=1.5cm] (a1) at (0,0){1. Xác định vấn đề cần nghiên cứu};
\\node[rectangle, draw, rounded corners, text width=3.5cm,align = center, minimum height=1.5cm] (a2) at (3,-2.5){2. Quan sát, thu thập thông tin};
\\node[rectangle, draw, rounded corners, text width=3.5cm,align = center, minimum height=1.5cm] (a5) at (-3,-2.5){5. Kết luận};
\\node[rectangle, draw, rounded corners, text width=3.5cm,align = center, minimum height=1.5cm] (a3) at (3,-5){3. Đưa ra dự đoán};
\\node[rectangle, draw, rounded corners, text width=3.5cm,align = center, minimum height=1.5cm] (a4) at (-3,-5){4. Thí nghiệm kiểm tra dự đoán};
\\draw[->] (a1.east)to[bend left=45](a2.north);
\\draw[->] (a5.north)to[bend left=45](a1.west);
\\draw[->] (a3.south)to[bend left=45](a4.south);
\\draw[->] (a4.north east)to[bend left=45](a3.north west);
\\draw[->] (a2.south)to (a3.north);
\\draw[->] (a4.north)to (a5.south);
\\end{tikzpicture}`;

const TIKZ_MODEL = `\\begin{tikzpicture}[draw=Mapcolor, very thick,>=stealth']
\\node[rectangle, draw, rounded corners, minimum width=7cm] (a) at (0,0){1. Xác định đối tượng cần mô hình hóa};
\\node[rectangle, draw, rounded corners, minimum width=7cm] (b) at (0,-1.4){2. Xây dựng mô hình (giả thuyết)};
\\node[rectangle, draw, rounded corners, minimum width=7cm] (c) at (0,-2.8){3. Kiểm tra sự phù hợp của mô hình};
\\node[rectangle, draw, rounded corners, minimum width=3cm] (d) at (-2,-4.2){4. Kết luận};
\\node[rectangle, draw, rounded corners, text width=2.5cm, align = center] (e) at (2,-5){Điều chỉnh mô hình nếu cần};
\\draw[->] (a.south)--(b.north);
\\draw[->] (b.south)--(c.north);
\\draw[<-] (d.north)--++(90:0.6);
\\draw[<-] (e.north)--++(90:0.9);
\\draw[->] (e.east)--++(0:0.5)--++(90:3.6)--(b.east);
\\end{tikzpicture}`;


// Component hiển thị mã Tikz
function TikzCodeViewer({ code }) {
  const [show, setShow] = useState(false);
  return (
    <div className="tikz-code-viewer-container">
      <button className="toggle-tikz-code-btn" onClick={() => setShow(!show)}>
        <Code size={14} />
        <span>{show ? 'Ẩn mã Tikz LaTeX' : 'Xem mã Tikz LaTeX gốc'}</span>
      </button>
      {show && (
        <pre className="tikz-code-block animate-fade-in">
          <code>{code}</code>
        </pre>
      )}
    </div>
  );
}

// 2. TIMELINE LỊCH SỬ PHÁT TRIỂN VẬT LÝ
export function TimelineHistory() {
  const timelineData = [
    {
      year: '350 TCN',
      title: 'Aristotle (A-ri-xtốt)',
      desc: 'Dựa vào quan sát trực quan cho rằng vật nặng rơi nhanh hơn vật nhẹ.',
      period: 'Tiền Vật lí',
      periodClass: 'p-prev'
    },
    {
      year: '1600',
      title: 'Galilei (Ga-li-lê)',
      desc: 'Làm thí nghiệm tại tháp nghiêng Pisa chứng minh các vật rơi tự do như nhau.',
      period: 'Vật lí cổ điển',
      periodClass: 'p-classic'
    },
    {
      year: '1687',
      title: 'Isaac Newton',
      desc: 'Công bố các nguyên lí Toán học của Triết học tự nhiên (3 Định luật Newton).',
      period: 'Vật lí cổ điển',
      periodClass: 'p-classic'
    },
    {
      year: '1785',
      title: 'Joule (Jun)',
      desc: 'Tìm ra các định luật và mối liên hệ nhiệt động lực học bảo toàn năng lượng.',
      period: 'Vật lí cổ điển',
      periodClass: 'p-classic'
    },
    {
      year: '1831',
      title: 'Faraday (Pha-ra-đây)',
      desc: 'Khám phá ra hiện tượng cảm ứng điện từ, nền tảng cho máy phát điện hiện đại.',
      period: 'Vật lí cổ điển',
      periodClass: 'p-classic'
    },
    {
      year: '1900',
      title: 'Max Planck (Plăng)',
      desc: 'Xây dựng thuyết lượng tử mở ra chương mới cho Vật lí học.',
      period: 'Vật lí hiện đại',
      periodClass: 'p-modern'
    },
    {
      year: '1905',
      title: 'Albert Einstein',
      desc: 'Xây dựng Thuyết tương đối rộng và hẹp, thay đổi tư duy về không-thời gian.',
      period: 'Vật lí hiện đại',
      periodClass: 'p-modern'
    },
    {
      year: '1958',
      title: 'Mạch tích hợp IC',
      desc: 'Ra đời lí thuyết và thực hành vi mạch IC, đặt nền móng cho thời đại công nghệ số.',
      period: 'Vật lí hiện đại',
      periodClass: 'p-modern'
    }
  ];

  return (
    <div className="custom-diagram-wrapper">
      <div className="diagram-header">
        <Calendar size={18} />
        <span>Sơ đồ tiến trình phát triển của Vật lí học</span>
      </div>
      
      {/* Phân chia thời kỳ */}
      <div className="timeline-periods">
        <span className="period-tag p-prev">Tiền Vật lí (Trước thế kỉ XVII)</span>
        <span className="period-tag p-classic">Vật lí Cổ điển (Thế kỉ XVII - XIX)</span>
        <span className="period-tag p-modern">Vật lí Hiện đại (Thế kỉ XX - Nay)</span>
      </div>

      <div className="interactive-timeline">
        {timelineData.map((item, idx) => (
          <div key={idx} className={`timeline-node ${item.periodClass}`}>
            <div className="node-year">{item.year}</div>
            <div className="node-content">
              <h5>{item.title}</h5>
              <p>{item.desc}</p>
              <span className="node-period-label">{item.period}</span>
            </div>
          </div>
        ))}
      </div>

      <TikzCodeViewer code={TIKZ_TIMELINE} />
    </div>
  );
}

// 3. SƠ ĐỒ PHƯƠNG PHÁP THỰC NGHIỆM
export function FlowchartExperimental() {
  const steps = [
    { num: '1', title: 'Xác định vấn đề', desc: 'Lựa chọn hiện tượng cần nghiên cứu' },
    { num: '2', title: 'Quan sát & Thu thập', desc: 'Thu thập thông tin để tìm quy luật ban đầu' },
    { num: '3', title: 'Đưa ra dự đoán', desc: 'Đưa ra các giả thuyết khoa học bằng suy luận' },
    { num: '4', title: 'Thí nghiệm kiểm chứng', desc: 'Thiết kế thí nghiệm thực tế để đo đạc thông số' },
    { num: '5', title: 'Kết luận', desc: 'Xác nhận, bác bỏ giả thuyết hoặc rút ra quy luật' }
  ];

  return (
    <div className="custom-diagram-wrapper">
      <div className="diagram-header">
        <Info size={18} />
        <span>Sơ đồ chu trình của Phương pháp thực nghiệm</span>
      </div>

      <div className="flowchart-container">
        {steps.map((step, idx) => (
          <React.Fragment key={idx}>
            <div className="flowchart-step">
              <div className="step-num">{step.num}</div>
              <div className="step-info">
                <h5>{step.title}</h5>
                <p>{step.desc}</p>
              </div>
            </div>
            {idx < steps.length - 1 && (
              <div className="flowchart-arrow">
                <ArrowRight size={20} className="arrow-icon-desktop" />
                <span className="arrow-text-mobile">↓</span>
              </div>
            )}
          </React.Fragment>
        ))}
      </div>

      <TikzCodeViewer code={TIKZ_EXPERIMENTAL} />
    </div>
  );
}

// 4. SƠ ĐỒ PHƯƠNG PHÁP MÔ HÌNH
export function FlowchartModel() {
  return (
    <div className="custom-diagram-wrapper">
      <div className="diagram-header">
        <CheckCircle size={18} />
        <span>Sơ đồ các bước trong Phương pháp mô hình</span>
      </div>

      <div className="model-flow-grid">
        <div className="model-step step-1">
          <div className="step-circle">1</div>
          <h5>Xác định đối tượng</h5>
          <p>Xác định vật thể/hiện tượng cần mô hình hóa</p>
        </div>

        <div className="flow-arrow-down">↓</div>

        <div className="model-step step-2">
          <div className="step-circle">2</div>
          <h5>Xây dựng mô hình</h5>
          <p>Đề xuất giả thuyết lí thuyết, mô hình toán hoặc mô hình vật chất</p>
        </div>

        <div className="flow-arrow-down">↓</div>

        <div className="model-step step-3">
          <div className="step-circle">3</div>
          <h5>Kiểm tra sự phù hợp</h5>
          <p>So sánh dự đoán của mô hình với thực nghiệm thực tế</p>
        </div>

        <div className="model-branches">
          {/* Nhánh phù hợp -> Kết luận */}
          <div className="branch-pass">
            <span className="branch-label success">Phù hợp</span>
            <div className="flow-arrow-down">↓</div>
            <div className="model-step step-4 success">
              <div className="step-circle">4</div>
              <h5>Kết luận</h5>
              <p>Mô hình được chấp nhận và đưa vào sử dụng rộng rãi</p>
            </div>
          </div>

          {/* Nhánh không phù hợp -> Quay lại */}
          <div className="branch-fail">
            <span className="branch-label danger">Không phù hợp</span>
            <div className="loop-back-indicator">
              <CornerRightUp size={24} />
              <span>Điều chỉnh mô hình</span>
            </div>
          </div>
        </div>
      </div>

      <TikzCodeViewer code={TIKZ_MODEL} />
    </div>
  );
}

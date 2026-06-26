import { kv } from '@vercel/kv';

export default async function handler(req, res) {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'POST, GET, OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type');

  if (req.method === 'OPTIONS') {
    return res.status(200).end();
  }

  if (req.method !== 'POST') {
    return res.status(405).json({ error: 'Method not allowed' });
  }

  try {
    const { name, phone, lessonTitle, correctCount, totalQuestions } = req.body;

    if (!name || !phone || !lessonTitle) {
      return res.status(400).json({ error: 'Missing required fields' });
    }

    const submission = {
      name: name.trim(),
      phone: phone.trim(),
      lessonTitle,
      correctCount: parseInt(correctCount, 10),
      totalQuestions: parseInt(totalQuestions, 10),
      submittedAt: new Date().toISOString()
    };

    // Nếu không có thông số cấu hình Vercel KV, coi như chạy cục bộ và trả về thành công giả lập
    if (!process.env.KV_REST_API_URL || !process.env.KV_REST_API_TOKEN) {
      return res.status(200).json({ 
        success: true, 
        warning: 'Chưa cấu hình Vercel KV. Dữ liệu chỉ được lưu tạm cục bộ ở trình duyệt.' 
      });
    }

    // Đẩy bản ghi vào danh sách Redis 'submissions'
    await kv.lpush('submissions', JSON.stringify(submission));

    return res.status(200).json({ success: true });
  } catch (error) {
    console.error('Error saving submission:', error);
    return res.status(500).json({ error: 'Internal Server Error', details: error.message });
  }
}

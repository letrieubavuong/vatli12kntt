import { kv } from '@vercel/kv';

export default async function handler(req, res) {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET, OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type');

  if (req.method === 'OPTIONS') {
    return res.status(200).end();
  }

  if (req.method !== 'GET') {
    return res.status(405).json({ error: 'Method not allowed' });
  }

  const { password } = req.query;
  const adminPassword = process.env.ADMIN_PASSWORD || 'admin123';

  if (password !== adminPassword) {
    return res.status(401).json({ error: 'Mật khẩu quản trị không chính xác.' });
  }

  try {
    if (!process.env.KV_REST_API_URL || !process.env.KV_REST_API_TOKEN) {
      return res.status(200).json({ 
        submissions: [], 
        warning: 'Cơ sở dữ liệu Vercel KV chưa được kết nối.' 
      });
    }

    // Lấy toàn bộ danh sách trong Redis key 'submissions'
    const submissions = await kv.lrange('submissions', 0, -1);
    
    // Parse lại chuỗi JSON thành Object
    const parsed = submissions.map(s => {
      if (typeof s === 'string') {
        try {
          return JSON.parse(s);
        } catch (e) {
          return s;
        }
      }
      return s;
    });

    return res.status(200).json({ submissions: parsed });
  } catch (error) {
    console.error('Error fetching submissions:', error);
    return res.status(500).json({ error: 'Internal Server Error', details: error.message });
  }
}

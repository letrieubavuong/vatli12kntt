import { kv } from '@vercel/kv';

export default async function handler(req, res) {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'POST, OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type');

  if (req.method === 'OPTIONS') {
    return res.status(200).end();
  }

  if (req.method !== 'POST') {
    return res.status(405).json({ error: 'Method not allowed' });
  }

  const { password } = req.body;
  const adminPassword = process.env.ADMIN_PASSWORD || 'admin123';

  if (password !== adminPassword) {
    return res.status(401).json({ error: 'Mật khẩu quản trị không chính xác.' });
  }

  try {
    if (!process.env.KV_REST_API_URL || !process.env.KV_REST_API_TOKEN) {
      return res.status(200).json({ 
        success: true, 
        warning: 'Cơ sở dữ liệu Vercel KV chưa được kết nối.' 
      });
    }

    // Xóa key 'submissions' khỏi Redis
    await kv.del('submissions');

    return res.status(200).json({ success: true });
  } catch (error) {
    console.error('Error resetting submissions:', error);
    return res.status(500).json({ error: 'Internal Server Error', details: error.message });
  }
}

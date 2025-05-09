const mysql = require('mysql2/promise');
const dotenv = require('dotenv');

dotenv.config();

const pool = mysql.createPool({
  host: process.env.DB_HOST || 'localhost',
  user: process.env.DB_USER || 'root',
  password: process.env.DB_PASSWORD || 'password',
  database: process.env.DB_NAME || 'musketeers_db',
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0
});

const connectDB = async () => {
  try {
    const connection = await pool.getConnection();
    console.log('MySQL Connected...');
    connection.release();
  } catch (err) {
    console.error('Error connecting to MySQL:', err.message);
    // Exit process with failure
    process.exit(1);
  }
};

module.exports = { pool, connectDB };

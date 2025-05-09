const express = require('express');
const dotenv = require('dotenv');
const cors = require('cors');
const { connectDB } = require('./config/db'); // Updated path

dotenv.config();

connectDB(); // Initialize DB connection

const app = express();

// Middleware
app.use(cors());
app.use(express.json()); // To parse JSON bodies

// Define a simple route
app.get('/', (req, res) => {
  res.send('Musketeers Backend API Running');
});

// Product routes
const productRoutes = require('./routes/products');
app.use('/api/products', productRoutes);

const PORT = process.env.PORT || 8081;

app.listen(PORT, () => console.log(`Server running on port ${PORT}`));

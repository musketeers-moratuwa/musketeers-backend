const express = require('express');
const router = express.Router();
const { pool } = require('../config/db');

// @route   GET api/products
// @desc    Get all products
// @access  Public
router.get('/', async (req, res) => {
  try {
    const [rows] = await pool.query('SELECT * FROM products');
    res.json(rows);
  } catch (err) {
    console.error(err.message);
    res.status(500).send('Server Error');
  }
});

// @route   GET api/products/:id
// @desc    Get product by ID
// @access  Public
router.get('/:id', async (req, res) => {
  try {
    const [rows] = await pool.query('SELECT * FROM products WHERE id = ?', [req.params.id]);
    if (rows.length === 0) {
      return res.status(404).json({ msg: 'Product not found' });
    }
    res.json(rows[0]);
  } catch (err) {
    console.error(err.message);
    res.status(500).send('Server Error');
  }
});

// @route   GET api/products/category/:category
// @desc    Get products by category
// @access  Public
router.get('/category/:category', async (req, res) => {
  try {
    const [rows] = await pool.query('SELECT * FROM products WHERE category = ?', [req.params.category]);
    if (rows.length === 0) {
      return res.status(404).json({ msg: 'No products found in this category' });
    }
    res.json(rows);
  } catch (err) {
    console.error(err.message);
    res.status(500).send('Server Error');
  }
});


// @route   POST api/products
// @desc    Add a new product
// @access  Private (should be protected later)
router.post('/', async (req, res) => {
  const { name, category, price, description, imageUrl } = req.body;

  if (!name || !price) {
    return res.status(400).json({ msg: 'Please include a name and price' });
  }

  try {
    const [result] = await pool.query(
      'INSERT INTO products (name, category, price, description, imageUrl) VALUES (?, ?, ?, ?, ?)',
      [name, category, price, description, imageUrl]
    );
    const [newProduct] = await pool.query('SELECT * FROM products WHERE id = ?', [result.insertId]);
    res.status(201).json(newProduct[0]);
  } catch (err) {
    console.error(err.message);
    res.status(500).send('Server Error');
  }
});

module.exports = router;

const express = require('express');
const cors = require('cors');

const path = require('path');

const app = express();

// Middleware
app.use(cors());
app.use(express.json());

// Serve static files from the 'public' directory (built client)
app.use(express.static(path.join(__dirname, '../public')));

// Health Check Route
app.get('/api/health', (req, res) => {
  res.json({
    status: 'ok',
    message: 'ShopSmart Backend is running',
    timestamp: new Date().toISOString()
  });
});

// Root Route - Serve index.html for any layout or non-api requests
app.get('*', (req, res) => {
  if (req.path.startsWith('/api')) {
    return res.status(404).json({ error: 'API route not found' });
  }
  res.sendFile(path.join(__dirname, '../public/index.html'), (err) => {
    if (err) {
      res.status(200).send('ShopSmart Backend Service (Client not built yet)');
    }
  });
});

module.exports = app;

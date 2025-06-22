const express = require('express');
const path = require('path');
const fs = require('fs');

const router = express.Router();

// Serve CSS files with proper headers
router.get('/styles/:filename', (req, res) => {
  const filename = req.params.filename;
  const filePath = path.join(__dirname, '../assets/styles', filename);
  
  // Check if file exists
  if (!fs.existsSync(filePath)) {
    return res.status(404).json({ message: 'Style file not found' });
  }
  
  // Set proper headers for CSS files
  res.setHeader('Content-Type', 'text/css');
  res.setHeader('Cache-Control', 'public, max-age=86400'); // Cache for 24 hours
  
  // Send the file
  res.sendFile(filePath);
});

// Serve images with proper headers
router.get('/images/:filename', (req, res) => {
  const filename = req.params.filename;
  const filePath = path.join(__dirname, '../assets/images', filename);
  
  // Check if file exists
  if (!fs.existsSync(filePath)) {
    return res.status(404).json({ message: 'Image file not found' });
  }
  
  // Get file extension for content type
  const ext = path.extname(filename).toLowerCase();
  const contentType = {
    '.png': 'image/png',
    '.jpg': 'image/jpeg',
    '.jpeg': 'image/jpeg',
    '.gif': 'image/gif',
    '.svg': 'image/svg+xml',
    '.webp': 'image/webp'
  }[ext] || 'application/octet-stream';
  
  // Set proper headers for images
  res.setHeader('Content-Type', contentType);
  res.setHeader('Cache-Control', 'public, max-age=31536000'); // Cache for 1 year
  
  // Send the file
  res.sendFile(filePath);
});

// Serve fonts with proper headers
router.get('/fonts/:filename', (req, res) => {
  const filename = req.params.filename;
  const filePath = path.join(__dirname, '../assets/fonts', filename);
  
  // Check if file exists
  if (!fs.existsSync(filePath)) {
    return res.status(404).json({ message: 'Font file not found' });
  }
  
  // Get file extension for content type
  const ext = path.extname(filename).toLowerCase();
  const contentType = {
    '.woff': 'font/woff',
    '.woff2': 'font/woff2',
    '.ttf': 'font/ttf',
    '.otf': 'font/otf',
    '.eot': 'application/vnd.ms-fontobject'
  }[ext] || 'application/octet-stream';
  
  // Set proper headers for fonts
  res.setHeader('Content-Type', contentType);
  res.setHeader('Cache-Control', 'public, max-age=31536000'); // Cache for 1 year
  res.setHeader('Access-Control-Allow-Origin', '*'); // Allow cross-origin for fonts
  
  // Send the file
  res.sendFile(filePath);
});

// List available assets (for development)
router.get('/list', (req, res) => {
  const assetsPath = path.join(__dirname, '../assets');
  const assets = {};
  
  try {
    // List styles
    const stylesPath = path.join(assetsPath, 'styles');
    if (fs.existsSync(stylesPath)) {
      assets.styles = fs.readdirSync(stylesPath).filter(file => file.endsWith('.css'));
    }
    
    // List images
    const imagesPath = path.join(assetsPath, 'images');
    if (fs.existsSync(imagesPath)) {
      assets.images = fs.readdirSync(imagesPath).filter(file => 
        /\.(png|jpg|jpeg|gif|svg|webp)$/i.test(file)
      );
    }
    
    // List fonts
    const fontsPath = path.join(assetsPath, 'fonts');
    if (fs.existsSync(fontsPath)) {
      assets.fonts = fs.readdirSync(fontsPath).filter(file => 
        /\.(woff|woff2|ttf|otf|eot)$/i.test(file)
      );
    }
    
    res.json({
      message: 'Available assets',
      assets,
      baseUrl: '/assets'
    });
  } catch (error) {
    res.status(500).json({ message: 'Error listing assets', error: error.message });
  }
});

module.exports = router; 
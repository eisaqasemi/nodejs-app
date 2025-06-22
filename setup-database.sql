-- Project Manager Database Setup Script
-- Run this script in your MySQL client to create the database

-- Create the database
CREATE DATABASE IF NOT EXISTS project_manager;

-- Use the database
USE project_manager;

-- Create users table
CREATE TABLE IF NOT EXISTS users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) UNIQUE NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Create projects table
CREATE TABLE IF NOT EXISTS projects (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  title VARCHAR(100) NOT NULL,
  description TEXT,
  status ENUM('active', 'completed', 'on-hold') DEFAULT 'active',
  priority ENUM('low', 'medium', 'high') DEFAULT 'medium',
  start_date DATE,
  end_date DATE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Insert sample data (optional)
-- INSERT INTO users (username, email, password) VALUES 
-- ('demo_user', 'demo@example.com', '$2a$10$hashed_password_here');

-- INSERT INTO projects (user_id, title, description, status, priority, start_date, end_date) VALUES 
-- (1, 'Sample Project', 'This is a sample project description', 'active', 'medium', '2024-01-01', '2024-12-31');

-- Show tables
SHOW TABLES;

-- Show table structure
DESCRIBE users;
DESCRIBE projects; 
# Project Manager Application

A full-stack web application for managing user projects with authentication, built with Node.js, MySQL, and React.

## Features

- **User Authentication**: Sign up, login, and logout functionality
- **Project Management**: Create, read, update, and delete projects
- **Project Details**: Title, description, status, priority, start/end dates
- **Dashboard**: View all projects with filtering and search capabilities
- **Responsive Design**: Modern UI built with Material-UI
- **REST API**: Backend API for frontend communication
- **Database**: MySQL database for data persistence

## Tech Stack

### Backend
- **Node.js** - Runtime environment
- **Express.js** - Web framework
- **MySQL** - Database
- **bcryptjs** - Password hashing
- **jsonwebtoken** - JWT authentication
- **express-validator** - Input validation
- **cors** - Cross-origin resource sharing

### Frontend
- **React** - Frontend framework
- **React Router** - Client-side routing
- **Material-UI** - UI component library
- **Axios** - HTTP client
- **Context API** - State management

## Prerequisites

Before running this application, make sure you have the following installed:

- **Node.js** (v14 or higher)
- **MySQL** (v8.0 or higher)
- **npm** or **yarn**

## Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd nodejs-app
   ```

2. **Install dependencies**
   ```bash
   # Install backend dependencies
   npm install
   
   # Install frontend dependencies
   cd client
   npm install
   cd ..
   ```

3. **Database Setup**
   
   Create a MySQL database:
   ```sql
   CREATE DATABASE project_manager;
   ```

4. **Environment Configuration**
   
   Update the `config.env` file with your database credentials:
   ```env
   DB_HOST=localhost
   DB_USER=your_mysql_username
   DB_PASSWORD=your_mysql_password
   DB_NAME=project_manager
   DB_PORT=3306
   
   JWT_SECRET=your_jwt_secret_key_here
   PORT=5000
   ```

## Running the Application

### Development Mode

1. **Start the backend server**
   ```bash
   npm run dev
   ```
   The server will start on `http://localhost:5000`

2. **Start the frontend development server**
   ```bash
   cd client
   npm start
   ```
   The React app will start on `http://localhost:3000`

### Production Mode

1. **Build the React app**
   ```bash
   cd client
   npm run build
   cd ..
   ```

2. **Start the production server**
   ```bash
   npm start
   ```

## API Endpoints

### Authentication
- `POST /api/auth/register` - Register a new user
- `POST /api/auth/login` - Login user
- `GET /api/auth/user` - Get current user data

### Projects
- `GET /api/projects` - Get all projects for authenticated user
- `POST /api/projects` - Create a new project
- `GET /api/projects/:id` - Get a specific project
- `PUT /api/projects/:id` - Update a project
- `DELETE /api/projects/:id` - Delete a project

## Project Structure

```
nodejs-app/
├── client/                 # React frontend
│   ├── public/
│   │   ├── components/     # React components
│   │   ├── contexts/       # React contexts
│   │   └── App.js
│   └── package.json
├── config/
│   └── database.js         # Database configuration
├── middleware/
│   └── auth.js            # Authentication middleware
├── routes/
│   ├── auth.js            # Authentication routes
│   └── projects.js        # Project routes
├── server.js              # Main server file
├── package.json
└── config.env             # Environment variables
```

## Usage

1. **Register/Login**: Create an account or login with existing credentials
2. **Dashboard**: View all your projects with filtering and search options
3. **Create Project**: Click the "+" button to create a new project
4. **Edit Project**: Click "Edit" on any project card to modify it
5. **View Details**: Click "View" to see detailed project information
6. **Delete Project**: Click "Delete" to remove a project

## Features in Detail

### Authentication
- Secure password hashing with bcryptjs
- JWT token-based authentication
- Protected routes for authenticated users
- Form validation and error handling

### Project Management
- CRUD operations for projects
- Project status tracking (Active, Completed, On Hold)
- Priority levels (Low, Medium, High)
- Start and end date tracking
- Search and filter functionality

### User Interface
- Modern, responsive design with Material-UI
- Intuitive navigation
- Real-time form validation
- Loading states and error handling
- Mobile-friendly layout

## Security Features

- Password hashing with bcryptjs
- JWT token authentication
- Input validation and sanitization
- CORS configuration
- Protected API endpoints
- SQL injection prevention with parameterized queries

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## License

This project is licensed under the MIT License.

## Support

If you encounter any issues or have questions, please open an issue in the repository. 
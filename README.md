# Musketeers Backend

This is the backend for the Musketeers application, built with Node.js and Express.

## Prerequisites

- Node.js (v18.x or later recommended)
- npm
- MySQL Server

## Setup

1.  **Clone the repository (if applicable) or ensure you are in the `musketeers-backend` directory.**
2.  **Install dependencies:**
    ```bash
    npm install
    ```
3.  **Environment Variables:**
    Create a `.env` file in the root of the `musketeers-backend` directory. Copy the contents of `.env.example` (if it exists) or add the following:
    ```env
    PORT=8081
    DB_HOST=localhost
    DB_USER=your_db_user
    DB_PASSWORD=your_db_password
    DB_NAME=musketeers_db
    JWT_SECRET=yourSuperSecretKeyForJWTGeneration123!@#
    ```
    Replace `your_db_user`, `your_db_password`, and `musketeers_db` with your actual MySQL credentials and desired database name.
    **Important:** Replace `yourSuperSecretKeyForJWTGeneration123!@#` with a strong, unique secret key for signing JWTs.
4.  **Database Setup:**
    Ensure your MySQL server is running. Create the database specified in your `.env` file (e.g., `musketeers_db`).
    ```sql
    CREATE DATABASE musketeers_db;
    ```
    You will also need to create `products` and `users` tables. A script or migration tool can be added later for this. For now, you can use a SQL client to create them:
    ```sql
    USE musketeers_db;

    CREATE TABLE products (
        id INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(255) NOT NULL,
        category VARCHAR(100),
        price DECIMAL(10, 2) NOT NULL,
        description TEXT,
        imageUrl VARCHAR(255),
        createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    );

    CREATE TABLE users (
        id INT AUTO_INCREMENT PRIMARY KEY,
        username VARCHAR(50) NOT NULL UNIQUE,
        email VARCHAR(100) NOT NULL UNIQUE,
        password_hash VARCHAR(255) NOT NULL,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    );
    ```

## Running the Application

-   **Development Mode (with auto-reload using nodemon):**
    ```bash
    npm run dev
    ```
-   **Production Mode:**
    ```bash
    npm start
    ```

The API will be available at `http://localhost:8081` (or the port specified in your `.env` file).

## API Endpoints

### Products

-   `GET /api/products` - Get all products
-   `GET /api/products/:id` - Get product by ID
-   `GET /api/products/category/:category` - Get products by category
-   `POST /api/products` - Add a new product (Protected - Placeholder)

### Authentication

-   `POST /api/auth/register` - Register a new user
    -   Body: `{ "username": "testuser", "email": "test@example.com", "password": "password123" }`
-   `POST /api/auth/login` - Login an existing user
    -   Body: `{ "username": "testuser_or_email@example.com", "password": "password123" }`

## Dev Container

This project includes a Dev Container setup for a consistent development environment using Docker.

1.  Ensure you have Docker Desktop installed and running.
2.  Ensure you have the "Dev Containers" extension installed in VS Code.
3.  Open the `musketeers-frontend` folder (or the root `muskateer` folder if you want to include both frontend and backend in the same Dev Container scope, though the current setup is for backend-only) in VS Code.
4.  When prompted, click "Reopen in Container". If not prompted, open the command palette (Ctrl+Shift+P or Cmd+Shift+P) and select "Dev Containers: Reopen in Container".

The Dev Container will build and start, providing a Node.js environment and a MySQL service. The backend application will be accessible from your host machine.

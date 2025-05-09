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
    ```
    Replace `your_db_user`, `your_db_password`, and `musketeers_db` with your actual MySQL credentials and desired database name.
4.  **Database Setup:**
    Ensure your MySQL server is running. Create the database specified in your `.env` file (e.g., `musketeers_db`).
    ```sql
    CREATE DATABASE musketeers_db;
    ```
    You will also need to create a `products` table. A script or migration tool can be added later for this. For now, you can use a SQL client to create it:
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

(To be defined)

-   `POST /api/products` - Add a new product
-   ... other product endpoints

## Dev Container

This project includes a Dev Container setup for a consistent development environment using Docker.

1.  Ensure you have Docker Desktop installed and running.
2.  Ensure you have the "Dev Containers" extension installed in VS Code.
3.  Open the `musketeers-frontend` folder (or the root `muskateer` folder if you want to include both frontend and backend in the same Dev Container scope, though the current setup is for backend-only) in VS Code.
4.  When prompted, click "Reopen in Container". If not prompted, open the command palette (Ctrl+Shift+P or Cmd+Shift+P) and select "Dev Containers: Reopen in Container".

The Dev Container will build and start, providing a Node.js environment and a MySQL service. The backend application will be accessible from your host machine.

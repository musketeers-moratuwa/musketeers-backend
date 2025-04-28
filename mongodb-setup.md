# MongoDB Setup Guide

## Installation

### Ubuntu
```bash
# Import MongoDB public GPG key
sudo apt-get install gnupg curl

# Add MongoDB repository
curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | \
   sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg \
   --dearmor

# Create list file for MongoDB
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | \
   sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list

# Update package list
sudo apt-get update

# Install MongoDB
sudo apt-get install -y mongodb-org

# Start MongoDB
sudo systemctl start mongod

# Enable MongoDB to start on boot
sudo systemctl enable mongod

# Verify installation
mongosh --eval 'db.runCommand({ connectionStatus: 1 })'
```

## Database Setup

1. Open MongoDB shell:
```bash
mongosh
```

2. Create database and collections:
```javascript
// Create and use database
use jewelrystore

// Create collections
db.createCollection('products')
db.createCollection('users')
db.createCollection('carts')

// Create indexes
db.products.createIndex({ category: 1 })
db.users.createIndex({ username: 1 }, { unique: true })
db.users.createIndex({ email: 1 }, { unique: true })
```

3. Insert sample data:
```javascript
// Insert sample product
db.products.insertOne({
  name: "Diamond Ring",
  description: "1 carat diamond ring",
  price: NumberDecimal("999.99"),
  imageUrl: "https://example.com/ring.jpg",
  category: "rings",
  stockQuantity: 10
})

// Insert sample user
db.users.insertOne({
  username: "admin",
  password: "$2a$10$yourhashpassword", // Remember to hash passwords
  email: "admin@example.com",
  role: "ROLE_ADMIN",
  enabled: true
})
```

## Verify Setup

Test connection from Spring Boot application by running:
```bash
mvn spring-boot:run
```

The application should start without MongoDB-related errors.

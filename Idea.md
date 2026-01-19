### Phase 1: Project Scaffolding & Backend Setup
- Initialization: Set up the Node.js/Express environment and initialize the Git repository.
Database Design: Define Mongoose schemas for User, Product, and Order.
- Cloudinary Integration: Connect the Cloudinary SDK for cloud-based image hosting of product photos.
- Folder Structure: Separate the repository into backend, frontend, and admin folders.

### Phase 2: Admin Dashboard - Product Logic
- Inventory API: Create endpoints for adding, listing, and deleting products.
- Image Handling: Implement Multer to handle multi-image uploads from the admin panel to Cloudinary.
- Admin UI: Build a React-based dashboard where the admin can manage the catalog (price, size, stock, category).

### Phase 3: Secure Authentication System
- JWT Security: Implement JSON Web Tokens and password hashing (bcrypt) for user sessions.
- Middleware: Create authUser for customers and adminAuth to lock down the dashboard.
- Social Login: Integrate Firebase Google Auth to allow users to sign up using their Google accounts.

### Phase 4: Frontend Engine & Global State
- Context API: Use React Context to manage a global ShopContext (product list, cart total, auth status).
- Dynamic Routing: Set up react-router-dom for the Home, Collection, and Product pages.
- Search System: Build a global search bar with filter logic (Category, Price, Size).

### Phase 5: Shopping Cart & User Flow
- Cart Logic: Develop "Add to Cart" functions that track specific item variations (e.g., Size M vs. Size L).
- Database Sync: Ensure the user's cart is saved to the MongoDB database so it persists across different devices.
- UI Components: Build the cart drawer/page and the order summary section.

### Phase 6: Order Management & Checkout
- Address Flow: Build the delivery information form (Name, Address, Phone).
- Order API: Create backend routes to store "Placed Orders" and link them to user IDs.
- User Dashboard: Create a "My Orders" page where users see order status and date.

### Phase 7: Payment Gateway (Razorpay)
- Merchant Setup: Configure Razorpay API keys in the .env file.
- Transaction Flow: implement backend order creation and frontend checkout modal.
- Security Verification: Use HMAC-SHA256 hashing to verify payment signatures before finalizing the order in the database.

### Phase 8: Final QA & Production Deployment
- Real-time Notifications: Add React-Toastify for pop-up alerts (Success/Error messages).
- Admin Controls: Finalize the admin's ability to change order status (Placed → Shipped → Delivered).
- Cloud Hosting: Deploy the backend to Render and host the frontend/admin on static hosting.

# 📦 Changelog

All notable changes to this project will be documented here.  
This project follows [Semantic Versioning](https://semver.org/).

---

## [1.0.0] - 2025-08-02 - Pending Release

🎉 **Initial Release: Pahan Edu Web v1.0.0**

### 🚀 Overview

This marks the first stable version of the **Pahan Edu Web** application. Developed using JSP, Servlets, and Maven, the system provides a complete billing solution for the Pahan Edu Bookshop with modular architecture, a clean dark UI, and full JUnit test coverage for service layers.

---

### ✅ Major Features

- **User Authentication**
    - Secure session-based login/logout
    - `LoginServlet`, `LogoutServlet`, and user validation via `UserService`

- **Customer Module**
    - Full CRUD: add, view, update, and delete customers
    - Business logic separated via `CustomerService` and DAO
    - JUnit-tested service and DAO layers

- **Item Management**
    - Register, update, delete, and list items
    - Dark-themed UI with styled JSP forms
    - `ItemService` and `ItemDAO` tested with JUnit

- **Billing System**
    - Dynamic bill creation using dropdown item selectors
    - Bill calculation and total storage with `BillService`
    - Supports itemized bills through `BillItemService`

- **Bill Items**
    - Add/update/delete individual bill items
    - Query bill items by `billId`
    - Tested with real DB using JUnit

- **Help Page**
    - `help.jsp` page for user guidance on core modules
    - Linked via navigation from dashboard

- **Dashboard**
    - Central landing page with links to all major sections
    - Font Awesome integration and responsive layout

---

### 🧪 Testing

- ✅ All core services covered with JUnit tests:
    - `UserServiceTest`
    - `CustomerServiceTest`
    - `ItemServiceTest`
    - `BillServiceTest`
    - `BillItemServiceTest`
    - `DBConnectionTest`

- Tests run on real DB environment with test/ for isolation

---

### 🛡️ Security

- Sensitive JSPs placed under `webapp`
- No direct JSP access allowed without authentication

---

### 🎨 UI & UX

- Clear button styling, form layout, and validation feedback
---

### 📁 Project Structure

- Follows clean layered Maven design:  
  `model`, `dao`, `service`, `servlet`, `webapp/`

- SQL scripts under `/sql/`
---

### 🔀 Release Summary

- All features merged from `test/junit` into `dev`
- Manual QA performed on local Tomcat server
- Version tag: `v1.0.0` applied after passing all test cases

---
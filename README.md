# Movie
## 📌 Overview

Movie App is a Swift-based iOS application developed using MVVM architecture and Domain-Driven Design (DDD) principles. The app provides a structured and scalable approach to handling movie-related data, ensuring separation of concerns and maintainability.

## 🚀 Features
- 🎞 Fetch and display a list of movies.
- 📄 View detailed movie information.
- 🔍 Search and filter movies.
- ⚡ Optimized with `async/await` for seamless API calls.
- 🏗 Modular architecture following **MVVM** and **DDD**.

## 📂 Project Structure

### **1️⃣ Domain Layer (Business Rules)**
Located in `Domain/`
- `Entities/` - Defines core data models.
- `Repository/` - Defines repository protocols.
- `UseCases/` - Contains application-specific business logic.

### **2️⃣ Data Layer (Data Sources)**
Located in `Data/`
- `RepositoriesImpl/` - Implements repository protocols.
- `UseCaseImpl/` - Implements use cases.
- `Network/` - Handles API communication.
- `Persistence/` - Manages local storage.

### **3️⃣ Presentation Layer (UI & User Interaction)**
Located in `Presentation/`
- `View/` - Contains UI components.
- `ViewModel/` - Manages UI-related logic.

---

## 📦 Dependencies
- `UIKit` - User Interface framework.
- `Swift Concurrency (async/await)` - Used for async API calls.
- `XCTest` - Unit testing framework.
  
---

## 📞 Contact & Contributions

- Author: Mahmoud Abd ElAziz
- Email: mahmoudhagar12@gmail.com
- LinkedIn: https://www.linkedin.com/in/mahmoud-abd-elaziz-707a1316a/

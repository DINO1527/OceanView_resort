🏨 Ocean View Resort - Room Reservation System
📖 Overview
Ocean View Resort is a premium getaway located in Galle, serving hundreds of local and international tourists. This project provides a computerized, web-based platform to automate room bookings, guest management, and billing processes.

Built using a Pure Java EE (Servlets & JSP) architecture, this application ensures that resort staff can securely manage operations without the need for heavy frameworks, focusing on core web service principles.

✨ Features

🔑 User Authentication

Secure Staff Login: Authentication using username and password.

Session Management: Secure session handling to prevent unauthorized access.

Logout Security: Clears cache and destroys sessions to prevent back-button access.

👥 Guest Management

Guest Registration: Add new guests with unique IDs, names, addresses, and contact details.

Search & View: Quickly find guest records and their stay history.

Profile Updates: Edit or delete guest information as needed.

🛏️ Room & Reservation Management

Booking System: Select room types and manage check-in/check-out dates.

Real-time Availability: View and track room status.

Automatic Calculation: System automatically calculates the number of nights stayed.

🧾 Billing System

Invoice Generation: Auto-calculate total price based on room type and duration.

Detailed Bills: Link guests to their specific reservation and final costs.

Print-Ready: Generate clean billing records for guests.

⚙️ Technology Stack

Frontend: JSP, HTML5, CSS3, Bootstrap 5 (or Tailwind CSS)

Backend: Java EE (Servlets) - Developed strictly without frameworks like Spring.

Database: MySQL / MariaDB (using JDBC)

Server: Apache Tomcat

Language: Java (JDK 11 or higher)

IDE: IntelliJ IDEA

🚀 Installation & Setup
Clone the Repository

Bash
git clone https://github.com/Atheef-A/OceanView_resort.git

Import into IDE

Open IntelliJ IDEA.

Import as a Java Enterprise / Maven project.

Database Setup

Create a MySQL database (e.g., ocean_view_db).

Run the provided SQL scripts to create tables: guest, reservation, bill, and users.

Configure Connection

Update DatabaseConnection.java with your MySQL username and password.

Deploy on Tomcat

Add the project to your Tomcat Server configuration.

Run/Debug the project.

Access the System

Open: http://localhost:8080/ocean-view-resort

🏗️ Architecture (N-Tier)
The system follows a strict Layered Architecture to ensure clean code:

Presentation Layer: JSP pages for the UI.

Controller Layer: Servlets handling HTTP requests.

Service Layer: Business logic (Price calculation, validation).

Data Access Layer (DAO): Direct JDBC operations for database interaction.

Entity Layer: Domain objects (Guest, Reservation, Bill).

🏆 Benefits

Digital Transformation: Replaces manual register entries with a digital database.

Accuracy: Reduces human error in billing and stay duration calculations.

Speed: Quick retrieval of guest history and room status.

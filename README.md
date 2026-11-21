# 🎓 Online Examination System

## 📌 Project Overview

The **Online Examination System** is a web-based application developed to conduct examinations online. It provides separate functionalities for administrators and students to manage examinations, questions, users and results.

The system allows students to register, log in, participate in examinations and view their results. Administrators can manage questions, examination topics, users, feedback and reports.

The project is developed using Java, JSP and frontend web technologies.

## 🎯 Project Objectives

- To develop a web-based online examination application.
- To provide an online platform for conducting examinations.
- To simplify examination and question management.
- To allow students to participate in examinations and view results.
- To provide administrators with tools to manage users and examination activities.

## ✨ Features

### 👨‍💼 Admin Module
- Admin login.
- Add and manage examination questions.
- Manage examination topics.
- View and manage registered users.
- View examination results.
- Generate and manage reports.
- View student feedback.

### 👨‍🎓 Student Module
- Student registration and login.
- Password recovery functionality.
- Change password.
- Access examination topics.
- Attempt online examinations.
- View examination results.
- Submit feedback.

## 🛠️ Technologies Used

| Technology | Purpose |
|---|---|
| Java | Backend programming |
| JSP (JavaServer Pages) | Dynamic web pages |
| HTML | Webpage structure |
| CSS | Webpage styling |
| JavaScript | Frontend functionality |
| MySQL | Database management |
| JDBC | Database connectivity |
| Apache Tomcat | Web application deployment |
| Eclipse IDE | Project development |

## 📂 Project Structure

```text
Online-Examination-System/
│
├── .settings/
│
├── src/
│   └── com/
│       └── util/
│           └── db/
│               ├── DataAccess.java
│               ├── SendMail.java
│               └── demo.java
│
├── WebContent/
│   │
│   ├── admin/
│   │   ├── addquestion.jsp
│   │   ├── admin.jsp
│   │   ├── feedbacks.jsp
│   │   ├── questionlist.jsp
│   │   ├── results.jsp
│   │   ├── topics.jsp
│   │   └── userList.jsp
│   │
│   ├── user/
│   │   ├── exam.jsp
│   │   ├── results.jsp
│   │   ├── start.jsp
│   │   └── user.jsp
│   │
│   ├── WEB-INF/
│   │   ├── lib/
│   │   └── web.xml
│   │
│   ├── css/
│   ├── js/
│   ├── images/
│   ├── img/
│   ├── lib/
│   │
│   ├── index.jsp
│   ├── login.jsp
│   ├── signup.jsp
│   ├── logout.jsp
│   ├── about.jsp
│   └── contact.jsp
│
├── .classpath
├── .project
└── .gitignore
```

## ⚙️ Requirements

To run this project, you need:

- Java Development Kit (JDK).
- Eclipse IDE for Enterprise Java and Web Developers.
- Apache Tomcat Server.
- MySQL Database.
- MySQL Connector/J.

## 🚀 How to Run the Project

1. Install JDK, Eclipse IDE and Apache Tomcat.
2. Install MySQL Server and MySQL Workbench.
3. Clone or download this GitHub repository.
4. Open Eclipse IDE.
5. Import the project as an existing Eclipse project.
6. Configure the Apache Tomcat server in Eclipse.
7. Create the required MySQL database and tables.
8. Configure database connection settings.
9. Configure email settings if email functionality is required.
10. Run the project on the Tomcat server.

## 🗄️ Database Configuration

The project uses MySQL for database connectivity through JDBC.

Database name:

```text
ExamDB
```

Configure the following environment variables according to your local MySQL setup:

```text
DB_URL=jdbc:mysql://localhost:3306/ExamDB
DB_USER=your_database_username
DB_PASSWORD=your_database_password
```

Make sure the required database tables are created before running the application.

## 📧 Email Configuration

The project includes email functionality using SMTP.

Configure the following environment variables:

```text
SMTP_USER=your_email_address
SMTP_PASSWORD=your_email_app_password
```

Do not store actual database or email passwords directly in source code or upload them to GitHub.

## 🔮 Future Enhancements

- Online payment integration for examination registration.
- Timer-based examinations.
- Automatic result evaluation.
- Random question generation.
- Question bank management.
- Detailed student performance analytics.
- Improved user interface and responsive design.

## 🎓 Academic Project

This project was developed as part of the **Master of Computer Applications (MCA)** academic coursework to understand Java web application development, JSP, JDBC, database connectivity and frontend technologies.

## 👨‍💻 Developer

**Developed by:** Rushiraj Bhosale

**Project Name:** Online Examination System

**Technologies:** Java, JSP, HTML, CSS, JavaScript and MySQL.

---

⭐ If you find this project useful, consider giving this repository a star!

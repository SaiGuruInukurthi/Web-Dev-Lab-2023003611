# Web Development Lab Assignment - Documentation & Study Notes

This document contains the functional code, structural explanations, and execution instructions for all three web development lab questions. This serves as your reference guide.

---

## Question 1: Bookstore Data Application (XML/JSON/HTML)

**Task:** Design a bookstore data application using XML and represent the same data in JSON with HTML display.

### Explanation
We structure a bookstore catalog containing book details (ID, Title, Author, Price). 
1. **XML:** Uses a tree-like tag structure (`<catalog>` containing `<item>`).
2. **JSON:** Uses key-value pairs and arrays, which is natively understood by JavaScript.
3. **HTML/JS:** We embed the JSON data locally in the script and use a `forEach` loop to dynamically inject HTML DOM elements (`innerHTML`) into the `catalog-container` div.

### Code
**bookstore.xml**
```xml
<?xml version='1.0' encoding="UTF-8"?>
<catalog>
    <item>
        <bookId>101</bookId>
        <title>The Pragmatic Programmer</title>
        <author>David Thomas</author>
        <price>750</price>
    </item>
</catalog>
```

**bookstore.json**
```json
{
    "catalog": [
        {
            "bookId": 101,
            "title": "The Pragmatic Programmer",
            "author": "David Thomas",
            "price": 750
        }
    ]
}
```

**index.html**
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Book Catalog</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 2rem; }
        .book-item { padding: 10px; border: 1px solid #ddd; margin-bottom: 10px; border-radius: 5px; }
    </style>
</head>
<body>
    <h2>Available Books</h2>
    <div id="catalog-container"></div>
    <script>
        const storeData = {
            catalog: [
                { bookId: 101, title: "The Pragmatic Programmer", author: "David Thomas", price: 750 }
            ]
        };
        let htmlContent = "";
        storeData.catalog.forEach(item => {
            htmlContent += `<div class="book-item">
                <h3>${item.title}</h3>
                <p>Written by: ${item.author}</p>
                <p>Cost: INR ${item.price}</p>
            </div>`;
        });
        document.getElementById("catalog-container").innerHTML = htmlContent;
    </script>
</body>
</html>
```

### How to Run
Simply double-click the `index.html` file to open it in any web browser (Chrome, Edge). No local server is required.

---

## Question 2: Student Registration System (Servlets, JSP, JDBC)

**Task:** Develop a student registration system using Servlets, JSP, Tomcat, JDBC, and SQL queries.

### Explanation
This is a full-stack Java web application. 
1. **Frontend (JSP):** Provides the HTML Form. Action is set to point to `RegisterServlet`.
2. **Backend (Servlet):** Automatically triggers `doPost()` when the form is submitted. It reads the parameters, loads the MySQL JDBC driver, and runs an `INSERT INTO` SQL query.
3. **Database (MySQL):** Holds the `enrollments` table inside the `UniversityDB` database.

### Code
**setup.sql** (Database Schema)
```sql
CREATE DATABASE IF NOT EXISTS UniversityDB;
USE UniversityDB;

CREATE TABLE IF NOT EXISTS enrollments (
    enroll_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100),
    contact_email VARCHAR(100),
    program_name VARCHAR(100)
);
```

**index.jsp** (The UI Form)
```jsp
<!DOCTYPE html>
<html>
<head>
    <title>Student Enrollment</title>
    <style>body { font-family: Tahoma, sans-serif; margin: 30px; }</style>
</head>
<body>
    <h2>Enrollment Form</h2>
    <form action="RegisterServlet" method="POST">
        <label>Full Name:</label><br>
        <input type="text" name="fullName" required><br><br>
        <label>Email:</label><br>
        <input type="email" name="contactEmail" required><br><br>
        <label>Program:</label><br>
        <input type="text" name="programName" required><br><br>
        <input type="submit" value="Submit Application">
    </form>
</body>
</html>
```

**RegisterServlet.java** (The Backend Controller)
```java
import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fullName = request.getParameter("fullName");
        String contactEmail = request.getParameter("contactEmail");
        String programName = request.getParameter("programName");
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/UniversityDB", "root", "");
            PreparedStatement pstmt = conn.prepareStatement("INSERT INTO enrollments (full_name, contact_email, program_name) VALUES (?, ?, ?)");
            pstmt.setString(1, fullName);
            pstmt.setString(2, contactEmail);
            pstmt.setString(3, programName);
            pstmt.executeUpdate();
            
            out.println("<html><body><h3 style='color:green;'>Enrollment Successful for " + fullName + "</h3></body></html>");
        } catch (Exception e) {
            out.println("<html><body><h3 style='color:red;'>Error Processing Request: " + e.getMessage() + "</h3></body></html>");
        }
    }
}
```

### How to Run
1. Ensure XAMPP is open and **MySQL + Tomcat** are Started.
2. In phpMyAdmin, run the `setup.sql` script to set up the DB.
3. Ensure the project is placed in your Tomcat webapps folder with this structure:
   `C:\xampp\tomcat\webapps\StudentApp\`
   `├── index.jsp`
   `└── WEB-INF/web.xml`, `classes/RegisterServlet.class`, `lib/mysql-connector-java.jar`
4. Open the browser and visit `http://localhost:8080/StudentApp`.

---

## Question 3: Job Application Form (AngularJS & ReactJS)

**Task:** Create a job application form using AngularJS features and implement the same using ReactJS components.

### Explanation
Both frameworks solve the same problem: taking user input and immediately rendering it back to the screen without reloading the page natively natively.
1. **AngularJS:** Uses the `ng-model` directive. When you type in the input box, it automatically updates `$scope.candidate` via two-way data binding. The DOM instantly updates anywhere `{{ candidate.variable }}` is placed.
2. **ReactJS:** Uses a functional component with the `useState` hook. The `onChange` handler fires every time you type a letter, triggering a state update (`setCandidateData`), prompting React to intelligently re-render only the modified DOM nodes.

### Code
**angular-form.html**
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Careers Application</title>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.min.js"></script>
    <style>body { font-family: 'Segoe UI', sans-serif; padding: 20px; }</style>
</head>
<body ng-app="careerApp" ng-controller="FormCtrl">
    <h2>Apply for a Role</h2>
    <fieldset style="width: 300px;">
        <legend>Application Details</legend>
        <p>Applicant: <input type="text" ng-model="candidate.fullName"></p>
        <p>Email ID: <input type="email" ng-model="candidate.emailId"></p>
        <p>Applying For: <input type="text" ng-model="candidate.jobRole"></p>
    </fieldset>

    <div style="margin-top: 20px; background: #f9f9f9; padding: 10px; width: 300px;">
        <h4>Live Output:</h4>
        <strong>Name:</strong> {{ candidate.fullName }} <br>
        <strong>Email:</strong> {{ candidate.emailId }} <br>
        <strong>Role:</strong> {{ candidate.jobRole }}
    </div>

    <script>
        angular.module('careerApp', [])
        .controller('FormCtrl', function($scope) {
            $scope.candidate = {};
        });
    </script>
</body>
</html>
```

**JobForm.jsx** (React Variant)
```javascript
import React, { useState } from "react";

export default function CareerForm() {
    const [candidateData, setCandidateData] = useState({
        fullName: "",
        emailId: "",
        jobRole: ""
    });

    const handleChange = (e) => {
        setCandidateData({ ...candidateData, [e.target.name]: e.target.value });
    };

    return (
        <div style={{ fontFamily: "sans-serif", padding: "20px" }}>
            <h2>React Careers Form</h2>
            <div style={{ marginBottom: "15px" }}>
                <input type="text" name="fullName" placeholder="Full Name" onChange={handleChange} /><br/><br/>
                <input type="email" name="emailId" placeholder="Email Address" onChange={handleChange} /><br/><br/>
                <input type="text" name="jobRole" placeholder="Desired Role" onChange={handleChange} />
            </div>

            <div style={{ padding: "10px", border: "1px solid #333", display: "inline-block" }}>
                <strong>Application Summary:</strong>
                <p>Name: {candidateData.fullName}</p>
                <p>Email: {candidateData.emailId}</p>
                <p>Role: {candidateData.jobRole}</p>
            </div>
        </div>
    );
}
```

### How to Run
*   **Angular:** Simply double-click `angular-form.html` to open it in any browser (it grabs the Angular framework from an online script link, so you just need internet access).
*   **React:** 
    1. Run `npx create-react-app job-app` in the terminal to initialize a default React environment.
    2. Place `JobForm.jsx` into the `src/` folder.
    3. In `App.js`, write `import CareerForm from './JobForm';` and drop `<CareerForm />` into the render code.
    4. Run `npm start` in the terminal to view it locally.
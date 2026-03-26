# JSP MySQL Database Connectivity Setup Guide

## Project Overview
This project demonstrates a complete JSP application for student registration that connects to MySQL database using XAMPP.

---

## Original Files

### 1. **index.jsp**
- **Purpose**: Registration form page
- **Original Location**: Documents folder
- **Function**: Displays HTML form for user to enter First Name and Last Name

### 2. **reg.jsp**
- **Purpose**: Process registration form submission
- **Original Location**: Documents folder
- **Function**: Insert submitted data into MySQL database
- **Original Issue**: Used string concatenation in SQL (SQL injection vulnerability)

### 3. **view.jsp**
- **Purpose**: Display all registered records
- **Original Location**: Documents folder
- **Function**: Retrieve and display all data from MySQL table in HTML table format

### 4. **read.jsp**
- **Purpose**: Test parameter reading
- **Original Location**: Documents folder
- **Function**: Simple page to read and display form parameters (not used in final application)

### 5. **mysql-connector.jar**
- **Purpose**: MySQL JDBC Driver
- **Original Location**: Documents folder
- **Function**: Enables Java/JSP to connect to MySQL database

---

## Modifications Made

### Database Setup
- **Database Created**: `csea613`
- **Table Created**: `csea`
- **Columns**:
  - `firstname` (varchar(80))
  - `lastname` (varchar(80))

### File Modifications

#### **index.jsp** (MODIFIED)
- Added link to "View All Records" 
- Improved centering and spacing
- Connection string: `jdbc:mysql://localhost:3306/csea613`

```jsp
<a href='view.jsp'>View All Records</a>
```

#### **reg.jsp** (HEAVILY MODIFIED)
- **CRITICAL FIX**: Replaced string concatenation with **PreparedStatement** to prevent SQL injection
- Improved error handling
- Added navigation links back to form and view page
- Updated database connection to `csea613`

**Original (UNSAFE)**:
```jsp
st.executeUpdate("insert into csea(firstname,lastname)values('" + fname + "','" + lname + "')");
```

**Modified (SECURE)**:
```jsp
String query = "insert into csea(firstname, lastname) values(?, ?)";
PreparedStatement pst = con.prepareStatement(query);
pst.setString(1, fname);
pst.setString(2, lname);
pst.executeUpdate();
```

#### **view.jsp** (MODIFIED)
- Updated database connection to `csea613`
- Improved error handling
- Added proper resource cleanup (close statements and connection)
- Better error display

#### **mysql-connector.jar** (DEPLOYED)
- Copied from Documents folder to `C:\xampp\tomcat\lib\`
- Required for JSP to connect to MySQL

---

## Deployment Location

All JSP files deployed to:
```
C:\xampp\tomcat\webapps\ROOT\csea\
```

Directory structure:
```
C:\xampp\tomcat\webapps\ROOT\csea\
├── index.jsp
├── reg.jsp
└── view.jsp
```

---

## XAMPP Setup Steps

### Step 1: Start XAMPP Services

1. **Open XAMPP Control Panel**
   - Navigate to: `C:\xampp\xampp-control-panel.exe`
   - Or search "XAMPP Control Panel" in Windows

2. **Start Apache**
   - Look for "Apache" module
   - Click **"Start"** button
   - Status should change to running (green)

3. **Start MySQL**
   - Look for "MySQL" module
   - Click **"Start"** button
   - Status should change to running (green)
   - Default port: 3306

4. **Start Tomcat**
   - Look for "Tomcat" module
   - Click **"Start"** button
   - Status should change to running (green)
   - Default port: 8005, 8080, 8009

### Step 2: Verify Services

All three services should show:
- ✅ Apache (Port: 80, 443)
- ✅ MySQL (Port: 3306)
- ✅ Tomcat (Port: 8005, 8080, 8009)

### Step 3: Access phpMyAdmin (Optional - for database verification)

1. In XAMPP Control Panel, click **"Admin"** button next to Apache
2. Or navigate to: `http://localhost/phpmyadmin`
3. Verify database `csea613` and table `csea` exist
4. Check that any registered records are in the table

---

## Testing the Application

### Step 1: First Page Load
1. Open browser and navigate to:
   ```
   http://localhost:8080/csea/index.jsp
   ```
2. You should see a registration form with:
   - First Name input field
   - Last Name input field
   - Submit button
   - View All Records link

### Step 2: Register a Student
1. Enter First Name: `test`
2. Enter Last Name: `user`
3. Click **Submit**
4. You should see: `"Registration Successful! test user"`
5. Links will appear:
   - "Go to Register Again" (back to index.jsp)
   - "View All Data" (to view.jsp)

### Step 3: View All Records
1. Click **"View All Data"** or navigate to:
   ```
   http://localhost:8080/csea/view.jsp
   ```
2. You should see an HTML table with:
   - Column headers: `firstname`, `lastname`
   - Your registered records

### Step 4: Verify in Database (Optional)
1. Open phpMyAdmin: `http://localhost/phpmyadmin`
2. Navigate to: `csea613` → `csea` table
3. You should see your entered data in the table

---

## Key Improvements from Original Code

| Aspect | Original | Modified |
|--------|----------|----------|
| **SQL Injection Risk** | ❌ String concatenation | ✅ PreparedStatement |
| **Database** | Undefined/Multiple | ✅ csea613 (consistent) |
| **Error Handling** | Basic try-catch | ✅ Improved with messages |
| **Resource Cleanup** | Missing | ✅ Proper close() calls |
| **User Navigation** | Limited | ✅ Multiple navigation links |
| **MySQL Driver** | Not deployed | ✅ In tomcat/lib/ |

---

## Troubleshooting

### Error: "JSP file not found"
- Ensure files are in: `C:\xampp\tomcat\webapps\ROOT\csea\`
- Restart Tomcat service

### Error: "com.mysql.jdbc.Driver"
- Ensure `mysql-connector.jar` is in: `C:\xampp\tomcat\lib\`
- Restart Tomcat service

### Error: "Connection refused"
- Ensure MySQL service is running in XAMPP Control Panel
- Check port 3306 is available

### Error: "Table doesn't exist"
- Verify database and table were created
- Check in phpMyAdmin: `http://localhost/phpmyadmin`

---

## Database Connection Details

```
Driver Class: com.mysql.jdbc.Driver
Connection URL: jdbc:mysql://localhost:3306/csea613
Username: root
Password: (empty)
Database: csea613
Table: csea
```

---

## Summary

✅ Database created and configured  
✅ JSP files deployed to Tomcat  
✅ MySQL driver installed  
✅ SQL injection vulnerability fixed  
✅ Application tested and working  

The application is now ready for production use!

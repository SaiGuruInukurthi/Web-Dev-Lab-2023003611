# Lab Exam 2 - JSP + MySQL (H1B Visa)

This folder contains a complete, minimal JSP app for:
- MySQL connection demonstration
- Table: `H1B_Visa`
- Insert data from JSP form into database `professional_db`
- View stored records

## Folder Structure

- `H1BApp/`
- `H1BApp/input.jsp`
- `H1BApp/insert.jsp`
- `H1BApp/view.jsp`
- `H1BApp/WEB-INF/lib/README.txt`
- `sql/setup_professional_db.sql`
- `deploy.cmd`

## 1. What you must do in XAMPP

1. Open XAMPP Control Panel.
2. Start `MySQL`.
3. Start `Apache` (only needed if you want phpMyAdmin UI).

## 2. Create database and table

### Option A: phpMyAdmin

1. Open `http://localhost/phpmyadmin`.
2. Go to SQL tab.
3. Run the SQL from `sql/setup_professional_db.sql`.

### Option B: VS Code terminal (cmd)

Run this from inside `Lab-exam-2`:

```bat
"C:\xampp\mysql\bin\mysql.exe" -u root < sql\setup_professional_db.sql
```

If your MySQL has a password:

```bat
"C:\xampp\mysql\bin\mysql.exe" -u root -p < sql\setup_professional_db.sql
```

## 3. Add MySQL JDBC driver

1. Download MySQL Connector/J jar.
2. Put the jar file into:

`H1BApp/WEB-INF/lib/`

Example:

`H1BApp/WEB-INF/lib/mysql-connector-j-8.4.0.jar`

## 4. Set DB password in JSP (if needed)

Current code assumes XAMPP default blank password (`""`).

If your `root` has a password, update both files:
- `H1BApp/insert.jsp`
- `H1BApp/view.jsp`

Change:

```java
String dbPassword = "";
```

to your password.

## 5. Deploy to Tomcat

Your machine has Tomcat at `C:\xampp\tomcat`, so default deploy is:

```bat
deploy.cmd
```

If Tomcat is elsewhere, pass Tomcat home path:

```bat
deploy.cmd "D:\apps\apache-tomcat-10.1.39"
```

This copies `H1BApp` into Tomcat `webapps`.

## 6. Start Tomcat

```bat
C:\xampp\tomcat\bin\startup.bat
```

You can also start Tomcat from XAMPP Control Panel if Tomcat module is available there.

## 7. Run the application

Open:

`http://localhost:8080/H1BApp/input.jsp`

Flow:
- Input form -> `insert.jsp` -> MySQL insert
- View records -> `view.jsp`

## 8. Common issues

1. `ClassNotFoundException: com.mysql.cj.jdbc.Driver`
- JDBC jar is missing from `WEB-INF/lib`.

2. `Access denied for user 'root'@'localhost'`
- Wrong password in JSP.

3. Connection refused
- XAMPP MySQL not running.

4. 404 on JSP URL
- Tomcat not running or app not deployed to `webapps/H1BApp`.

## 9. Notes for exam explanation

- Database: `professional_db`
- Table: `H1B_Visa(passport_number, name, mobile_number, country)`
- PreparedStatement is used to prevent SQL injection.
- Primary key: `passport_number`.

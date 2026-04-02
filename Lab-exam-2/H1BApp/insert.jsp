<%@ page import="java.sql.*" %>
<%!
private String esc(String value) {
    if (value == null) {
        return "";
    }
    return value
            .replace("&", "&amp;")
            .replace("<", "&lt;")
            .replace(">", "&gt;")
            .replace("\"", "&quot;")
            .replace("'", "&#39;");
}
%>
<%
request.setCharacterEncoding("UTF-8");

String passport = request.getParameter("passport");
String name = request.getParameter("name");
String mobile = request.getParameter("mobile");
String country = request.getParameter("country");

if (passport == null || passport.trim().isEmpty() ||
    name == null || name.trim().isEmpty() ||
    mobile == null || mobile.trim().isEmpty() ||
    country == null || country.trim().isEmpty()) {
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insertion Status</title>
</head>
<body>
    <h3>All fields are required.</h3>
    <a href="input.jsp">Go Back</a>
</body>
</html>
<%
    return;
}

Connection con = null;
PreparedStatement ps = null;

String dbUrl = "jdbc:mysql://localhost:3306/professional_db";
String dbUser = "root";
String dbPassword = "";

String message;
boolean success = false;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");

    con = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

    String query = "INSERT INTO H1B_Visa (passport_number, name, mobile_number, country) VALUES (?, ?, ?, ?)";
    ps = con.prepareStatement(query);
    ps.setString(1, passport.trim());
    ps.setString(2, name.trim());
    ps.setString(3, mobile.trim());
    ps.setString(4, country.trim());

    int rows = ps.executeUpdate();

    if (rows > 0) {
        success = true;
        message = "Data inserted successfully.";
    } else {
        message = "Insertion failed.";
    }
} catch (SQLIntegrityConstraintViolationException e) {
    message = "Passport number already exists. Please use a unique passport number.";
} catch (Exception e) {
    message = "Error while inserting data: " + e.getMessage();
} finally {
    if (ps != null) {
        try {
            ps.close();
        } catch (SQLException ignored) {
        }
    }
    if (con != null) {
        try {
            con.close();
        } catch (SQLException ignored) {
        }
    }
}
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insertion Status</title>
</head>
<body align="center">
    <h2>H1B Visa Registration</h2>
    <h3><%= esc(message) %></h3>
    <a href="input.jsp">Add Another Record</a>
    <br><br>
    <a href="view.jsp">View Saved Records</a>
</body>
</html>

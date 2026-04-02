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
Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

String dbUrl = "jdbc:mysql://localhost:3306/professional_db";
String dbUser = "root";
String dbPassword = "";
String error = null;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
    ps = con.prepareStatement(
        "SELECT passport_number, name, mobile_number, country FROM H1B_Visa ORDER BY name"
    );
    rs = ps.executeQuery();
} catch (Exception e) {
    error = e.getMessage();
}
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>H1B Visa Records</title>
</head>
<body align="center">
    <h2>Saved H1B Visa Records</h2>
    <a href="input.jsp">Back to Form</a>
    <br><br>

    <% if (error != null) { %>
        <h3>Unable to load records: <%= esc(error) %></h3>
    <% } else { %>
        <table cellpadding="8">
            <tr>
                <th>Passport Number</th>
                <th>Name</th>
                <th>Mobile Number</th>
                <th>Country</th>
            </tr>
            <%
            boolean hasRows = false;
            while (rs.next()) {
                hasRows = true;
            %>
            <tr>
                <td><%= esc(rs.getString("passport_number")) %></td>
                <td><%= esc(rs.getString("name")) %></td>
                <td><%= esc(rs.getString("mobile_number")) %></td>
                <td><%= esc(rs.getString("country")) %></td>
            </tr>
            <% } %>
        </table>

        <% if (!hasRows) { %>
            <p>No records found yet.</p>
        <% } %>
    <% } %>

    <%
    if (rs != null) {
        try {
            rs.close();
        } catch (SQLException ignored) {
        }
    }
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
    %>
</body>
</html>

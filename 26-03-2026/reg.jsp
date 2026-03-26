<%@ page import ="java.sql.*" %>
<%
    String fname = request.getParameter("first_name");    
    String lname = request.getParameter("last_name");
   
    Class.forName("com.mysql.jdbc.Driver");
  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/csea613", "root", "");
    Statement st = con.createStatement();
    //ResultSet rs;
   st.executeUpdate("insert into csea(firstname,lastname)values('" + fname + "','" + lname + "')");
   
      out.print("Registration Successfull!"+"<a href='index.jsp'>Go to gister again</a>"+"<a href='view.jsp'>To dsiplay data</a>");
    
%>
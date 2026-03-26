<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>
<html>
<body>
</br>
</br>
<h1 align='center' style="color:red">Table data</h1>

<table align='center' cellpadding='10' border='1'>

<%
try
{


Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/csea613", "root", "");




Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from csea");
ResultSetMetaData rsmd = rs.getMetaData();

for(int i=1 ; i<=rsmd.getColumnCount() ; i++)
{
out.print("<th>"+rsmd.getColumnName(i)+"</th>");
}

while(rs.next())
{

out.print("<tr>");

for(int i=1 ; i<=rsmd.getColumnCount() ; i++)
{
out.print("<td>"+rs.getString(i)+"</td>");
}

out.print("</tr>");
}

}
catch(Exception e)
{
out.print(e);
}
    
%>
</table>
<center>
</br>
<%
 out.print("<a href='index.jsp'>Go to gister again</a>"); %>
</center>
</body>
</html>
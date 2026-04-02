<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>H1B Visa Registration</title>
</head>
<body align="center">
    <h2>H1B Visa Registration</h2>

    <form action="insert.jsp" method="post">
        Passport Number: <input id="passport" type="text" name="passport" maxlength="20" required>
        <br><br>

        Name: <input id="name" type="text" name="name" maxlength="100" required>
        <br><br>

        Mobile Number: <input id="mobile" type="text" name="mobile" maxlength="15" required>
        <br><br>

        Country: <input id="country" type="text" name="country" maxlength="50" required>
        <br><br>

        <input type="submit" value="Submit">
        <a href="view.jsp">View Saved Records</a>
    </form>

    <p>Database: professional_db, Table: H1B_Visa</p>
</body>
</html>

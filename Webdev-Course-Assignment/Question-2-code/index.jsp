<!DOCTYPE html>
<html>
<head>
    <title>Student Enrollment</title>
    <style>
        body { font-family: Tahoma, sans-serif; margin: 30px; }
        .form-group { margin-bottom: 15px; }
    </style>
</head>
<body>
    <h2>Enrollment Form</h2>
    <form action="RegisterServlet" method="POST">
        <div class="form-group">
            <label>Full Name:</label><br>
            <input type="text" name="fullName" required>
        </div>
        <div class="form-group">
            <label>Email Address:</label><br>
            <input type="email" name="contactEmail" required>
        </div>
        <div class="form-group">
            <label>Program / Course:</label><br>
            <input type="text" name="programName" required>
        </div>
        <input type="submit" value="Submit Application">
    </form>
</body>
</html>

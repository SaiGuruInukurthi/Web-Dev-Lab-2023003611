import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DepartmentServlet1")
public class ValidServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form data
        String departmentName = request.getParameter("departmentName");
        String contactEmail = request.getParameter("contactEmail");
        String contactMobile = request.getParameter("contactMobile");

        // Server-side validation
        if (departmentName == null || departmentName.trim().isEmpty() ||
            contactEmail == null || contactEmail.trim().isEmpty() ||
            contactMobile == null || contactMobile.trim().isEmpty() ||
            !contactMobile.matches("\\+?[0-9]{10,15}") ||
            !contactEmail.matches("[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}")) {
            
            response.getWriter().write("Validation failed because of incorrect syntax.");
            return;
        }

        // Database connection parameters
        String jdbcUrl = "jdbc:mysql://localhost:3306/campus_travel_planner";
        String username = "root";
        String password = "root1";

        try {
            // Load JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            // Connect to the database
            try (Connection connection = DriverManager.getConnection(jdbcUrl, username, password)) {

                // Check if department already exists
                String checkSql = "SELECT * FROM Departments WHERE department_name=?";
                try (PreparedStatement checkStatement = connection.prepareStatement(checkSql)) {
                    checkStatement.setString(1, departmentName);
                    ResultSet resultSet = checkStatement.executeQuery();
                    if (resultSet.next()) {
                        response.getWriter().write("Information already exists in the database.");
                        return;
                    }
                }

                // SQL query to insert department information into the database
                String sql = "INSERT INTO Departments (department_name, contact_email, contact_mobile) VALUES (?, ?, ?)";

                // Create a prepared statement
                try (PreparedStatement statement = connection.prepareStatement(sql)) {
                    statement.setString(1, departmentName);
                    statement.setString(2, contactEmail);
                    statement.setString(3, contactMobile);

                    // Execute the query
                    int rowsInserted = statement.executeUpdate();
                    if (rowsInserted > 0) {
                        // Department information inserted successfully
                        response.getWriter().write("Department information added correctly into the database.");
                    } else {
                        response.getWriter().write("Failed to add department information to the database.");
                    }
                }
            }

        } catch (ClassNotFoundException | SQLException e) {
            // Handle database errors appropriately
            response.getWriter().write("Error: " + e.getMessage()); // Redirect to an error page
        }
    }
}






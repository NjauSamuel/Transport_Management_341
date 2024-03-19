

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DepartmentServlet1")
public class DepartmentServlet1 extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form data
        String departmentName = request.getParameter("departmentName");
        String contactEmail = request.getParameter("contactEmail");
        String contactMobile = request.getParameter("contactMobile");

        // Database connection parameters
        String jdbcUrl = "jdbc:mysql://localhost:3306/campus_travel_planner";
        String username = "root";
        String password = "root1";

        try {
            // Load JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            // Connect to the database
            Connection connection = DriverManager.getConnection(jdbcUrl, username, password);

            // SQL query to insert department information into the database
            String sql = "INSERT INTO departments (department_name, contact_email, contact_mobile) VALUES (?, ?, ?)";

            // Create a prepared statement
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, departmentName);
            statement.setString(2, contactEmail);
            statement.setString(3, contactMobile);

            // Execute the query
            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
                // Department information inserted successfully
                response.getWriter().write("Department information added successfully"); 
            }else{
                response.getWriter().write("Department information failed to be added");
            }

            // Close the database connection
            statement.close();
            connection.close();
        } catch (ClassNotFoundException | SQLException e) {
            // Handle database errors appropriately
            response.getWriter().write("Error: " + e.getMessage()); // Redirect to an error page
        }
    }
}

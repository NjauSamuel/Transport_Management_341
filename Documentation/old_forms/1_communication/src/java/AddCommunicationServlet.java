/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

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

@WebServlet("/AddCommunicationServlet")
public class AddCommunicationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form data
        int fromDepartmentId = Integer.parseInt(request.getParameter("from_department_id"));
        int toDepartmentId = Integer.parseInt(request.getParameter("to_department_id"));
        String communicationContent = request.getParameter("communication_content");

        // Database connection parameters
        String url = "jdbc:mysql://localhost:3306/campus_travel_planner";
        String username = "root";
        String password = "root1";

        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Connect to the database
            Connection conn = DriverManager.getConnection(url, username, password);

            // Prepare SQL statement to insert data into Communication table
            String sql = "INSERT INTO Communication (from_department_id, to_department_id, communication_content) VALUES (?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1, fromDepartmentId);
            statement.setInt(2, toDepartmentId);
            statement.setString(3, communicationContent);

            // Execute SQL statement
            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
                response.getWriter().write("Communication record added successfully.");
            } else {
                response.getWriter().write("Failed to add communication record.");
            }

            // Close database connection
            conn.close();
        } catch (ClassNotFoundException | SQLException e) {
            response.getWriter().write("Error: " + e.getMessage());
        }
    }
}

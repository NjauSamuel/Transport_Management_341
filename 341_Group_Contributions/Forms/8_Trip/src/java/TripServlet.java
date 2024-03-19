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

@WebServlet("/TripServlet")
public class TripServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form data
        String visitLocation = request.getParameter("visit_location");
        int budget = Integer.parseInt(request.getParameter("budget"));
        String purpose = request.getParameter("purpose");
        String unitInvolved = request.getParameter("unit_involved");
        String visitDate = request.getParameter("visit_date");
        int overnightStay = Integer.parseInt(request.getParameter("overnight_stay"));
        int departmentId = Integer.parseInt(request.getParameter("department_id"));

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
            String sql = "INSERT INTO trips (visit_location, budget, purpose, unit_involved, visit_date, overnight_stay, department_id) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, visitLocation);
            statement.setInt(2, budget);
            statement.setString(3, purpose);
            statement.setString(4, unitInvolved);
            statement.setString(5, visitDate);
            statement.setInt(6, overnightStay);
            statement.setInt(7, departmentId);

            // Execute SQL statement
            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
                response.getWriter().write("Trip record added successfully.");
            } else {
                response.getWriter().write("Failed to add Trip record.");
            }

            // Close database connection
            conn.close();
        } catch (ClassNotFoundException | SQLException e) {
            response.getWriter().write("Error: " + e.getMessage());
        }
    }
}

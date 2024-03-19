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

@WebServlet("/AddFinalTripListServlet")
public class AddFinalTripListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Database connection parameters
        String url = "jdbc:mysql://localhost:3306/campus_travel_planner";
        String username = "root";
        String password = "root1";

        // Retrieve form parameters
        int tripId = Integer.parseInt(request.getParameter("trip_id"));
        String registrarApprovalDate = request.getParameter("registrar_aa_approval_date");
        String dvcApprovalDate = request.getParameter("dvc_apd_approval_date");
        String transportManagerDate = request.getParameter("transport_manager_notification_date");

        try{
            // Load MySQL JDBC driver
            Class.forName("com.mysql.jdbc.Driver");
            // Establish connection
           Connection conn = DriverManager.getConnection(url, username, password);
            // Prepare SQL statement
            String sql = "INSERT INTO finaltripslist (trip_id, registrar_aa_approval_date, dvc_apd_approval_date, transport_manager_notification_date) VALUES (?, ?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1, tripId);
            statement.setString(2, registrarApprovalDate);
            statement.setString(3, dvcApprovalDate);
            statement.setString(4, transportManagerDate);
            // Execute SQL statement
            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
                response.getWriter().write("New record inserted successfully");
            } else {
                response.getWriter().write("Failed to add Final Trip List record.");
            }
            
            // Close database connection
            conn.close();
        } catch (ClassNotFoundException | SQLException e){
            response.getWriter().write("Error: " + e.getMessage());
        }
    }
}

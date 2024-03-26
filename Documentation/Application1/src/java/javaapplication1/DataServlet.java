/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package javaapplication1;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DataServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Database connection details
        String url = "jdbc:mysql://localhost:3306/campus_travel_planner?useSSL=false";
        String username = "root";
        String password = "root1";
        
        // Store results in a list of arrays
        ArrayList<String[]> data = new ArrayList<>();
        
        
        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DataServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        try (Connection conn = DriverManager.getConnection(url, username, password)) {
            // Create SQL statement
            String sql = "SELECT pt.provisional_trip_id, pt.dvc_aa_approval_date, t.visit_location, t.purpose, ft.registrar_aa_approval_date, ft.dvc_apd_approval_date "
                    + "FROM provisionaltrips pt "
                    + "INNER JOIN trips AS t ON t.trip_id = pt.trip_id "
                    + "LEFT JOIN finaltripsList ft ON pt.trip_id = ft.trip_id";
            Statement stmt = conn.createStatement();

            // Execute SQL query
            ResultSet rs = stmt.executeQuery(sql);
            
            // Close database connection
            conn.close();
            

            // Retrieve data from result set
            while (rs.next()) {
                String[] row = {
                    rs.getString("provisional_trip_id"),
                    rs.getString("dvc_aa_approval_date"),
                    rs.getString("visit_location"),
                    rs.getString("purpose"),
                    rs.getString("registrar_aa_approval_date"),
                    rs.getString("dvc_apd_approval_date")
                };
                data.add(row);
            }
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }

        
        request.setAttribute("data", data);
        RequestDispatcher rd = request.getRequestDispatcher("displayData.jsp");
        rd.forward(request, response);
    }
}

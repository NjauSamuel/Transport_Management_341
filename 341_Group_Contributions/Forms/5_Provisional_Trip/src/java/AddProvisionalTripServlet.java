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

@WebServlet("/add_provisional_trip")
public class AddProvisionalTripServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form data
        int tripId = Integer.parseInt(request.getParameter("trip_id"));
        String dvcAaApprovalDate = request.getParameter("dvc_aa_approval_date");
        

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
            String sql = "INSERT INTO provisionaltrips (trip_id, dvc_aa_approval_date) VALUES (?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1, tripId);
            statement.setString(2, dvcAaApprovalDate);

            // Execute SQL statement
            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
                response.getWriter().write("Transport record added successfully.");
            } else {
                response.getWriter().write("Failed to add Transport record.");
            }

            // Close database connection
            conn.close();
        } catch (ClassNotFoundException | SQLException e) {
            response.getWriter().write("Error: " + e.getMessage());
        }
    }
}


package ApprovalManenoz;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.sql.PreparedStatement;



public class DataServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

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

            // Connect to the database
            try (Connection conn = DriverManager.getConnection(url, username, password)) {
                // Create SQL statement with a PreparedStatement
                String sql = "SELECT pt.provisional_trip_id, pt.dvc_aa_approval_date, t.visit_location, t.purpose, ft.registrar_aa_approval_date, ft.dvc_apd_approval_date "
                        + "FROM provisionaltrips pt "
                        + "INNER JOIN trips AS t ON t.trip_id = pt.trip_id "
                        + "LEFT JOIN finaltripsList ft ON pt.trip_id = ft.trip_id";
                PreparedStatement pstmt = conn.prepareStatement(sql);

                // Execute SQL query
                ResultSet rs = pstmt.executeQuery();

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
            }

        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error: " + e.getMessage());
            response.getWriter().write("Error: " + e.getMessage());
        }

        // Determine the data type of the data array
        String dataType = "";
        if (!data.isEmpty() && data.get(0) != null) {
            dataType = data.get(0).getClass().getName();
        }

        // Pass data to JSP
        request.setAttribute("data", data);
        request.setAttribute("dataType", dataType);
        // Check if data is available before forwarding
        if (data.isEmpty()) {
            request.setAttribute("errorMessage", "No data available");
        }

        RequestDispatcher rd = request.getRequestDispatcher("DisplayData.jsp");
        rd.forward(request, response);
    }
}
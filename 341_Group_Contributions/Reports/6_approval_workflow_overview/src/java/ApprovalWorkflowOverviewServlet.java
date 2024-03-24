import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "DatabaseServlet", urlPatterns = {"/DatabaseServlet"})
public class ApprovalWorkflowOverviewServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            // Database connection details
            String url = "jdbc:mysql://localhost:3306/campus_travel_planner";
            String username = "root";
            String password = "root1";

            // Establish database connection
            try (Connection conn = DriverManager.getConnection(url, username, password)) {
                // Create SQL statement
                String sql = "SELECT pt.provisional_trip_id, pt.dvc_aa_approval_date, t.visit_location, t.purpose, ft.registrar_aa_approval_date, ft.dvc_apd_approval_date "
                        + "FROM provisionaltrips pt "
                        + "INNER JOIN trips AS t ON t.trip_id = pt.trip_id "
                        + "LEFT JOIN finaltripsList ft ON pt.trip_id = ft.trip_id";
                Statement stmt = conn.createStatement();

                // Execute SQL query
                ResultSet rs = stmt.executeQuery(sql);

                // Store results in a list of arrays
                ArrayList<String[]> data = new ArrayList<>();
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
                
                // Print data to console
                System.out.println("Data from database:");
                for (String[] row : data) {
                    for (String value : row) {
                        System.out.print(value + "\t");
                    }
                    System.out.println();
                }

                // Pass data to JSP
                request.setAttribute("data", data);
                request.getRequestDispatcher("/6_approval_workflow_overview.jsp").forward(request, response);
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}

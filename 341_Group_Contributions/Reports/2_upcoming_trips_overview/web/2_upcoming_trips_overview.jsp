<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, java.lang.*, javax.servlet.*" %>

<html>
   <head>
      <title>Upcoming Trips Overview</title>
   </head>
   <body>
      <h2>Upcoming Trips Overview</h2>
      <table border="1">
         <thead>
            <tr>
               <th>Visit Location</th>
               <th>Visit Date</th>
               <th>Purpose</th>
               <th>Department Name</th>
               <th>Approval Status</th>
            </tr>
         </thead>
         <tbody>
        <%
        // Database connection details
        String url = "jdbc:mysql://localhost:3306/campus_travel_planner?useSSL=false&allowPublicKeyRetrieval=true";
        String username = "root";
        String password = "root1";
        
        try {
            // Loading JDBC driver
            Class.forName("com.mysql.jdbc.Driver");
            
            // Connecting to the database
            try (Connection conn = DriverManager.getConnection(url, username, password)) {
                
                // Querying upcoming trips
                String query = "SELECT t.visit_location, t.visit_date, t.purpose, d.department_name, " +
                               "CASE WHEN ft.registrar_aa_approval_date IS NOT NULL " +
                               "     AND ft.dvc_apd_approval_date IS NOT NULL THEN 'Approved' " +
                               "ELSE 'Pending' END AS approval_status " +
                               "FROM Trips t " +
                               "INNER JOIN Departments d ON t.department_id = d.department_id " +
                               "LEFT JOIN FinalTripsList ft ON t.trip_id = ft.trip_id " +
                               "WHERE t.visit_date >= CURDATE()";
                PreparedStatement pstmt = conn.prepareStatement(query);
                
                // Execute SQL query
                ResultSet rs = pstmt.executeQuery();
                
                // Retrieving data from result set
                while (rs.next()) {
        %>
                    <tr>
                        <td><%=rs.getString("visit_location") %></td>
                        <td><%=rs.getString("visit_date") %></td>
                        <td><%=rs.getString("purpose") %></td>
                        <td><%=rs.getString("department_name") %></td>
                        <td><%=rs.getString("approval_status") %></td>
                    </tr>
        <%
                }
            } catch (SQLException e) {
                out.println("Error: " + e.getMessage());
            }
        } catch (ClassNotFoundException e) {
            out.println("Error: " + e.getMessage());
        }
        %>
         </tbody>
      </table>
   </body>
</html>






<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, java.lang.*, javax.servlet.*" %>

<html>
   <head>
      <title>Data Table</title>
   </head>
   <body>
      <h2>Data from Database</h2>
      <table border="1">
         <thead>
            <tr>
               <th>Provisional Trip ID</th>
               <th>DVC AA Approval Date</th>
               <th>Visit Location</th>
               <th>Purpose</th>
               <th>Registrar AA Approval Date</th>
               <th>DVC APD Approval Date</th>
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
                // Create SQL statement with a PreparedStatement
                String sql = "SELECT pt.provisional_trip_id, pt.dvc_aa_approval_date, t.visit_location, t.purpose, ft.registrar_aa_approval_date, ft.dvc_apd_approval_date "
                        + "FROM provisionaltrips pt "
                        + "INNER JOIN trips AS t ON t.trip_id = pt.trip_id "
                        + "LEFT JOIN finaltripsList ft ON pt.trip_id = ft.trip_id";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                
                // Execute SQL query
                ResultSet rs = pstmt.executeQuery();
                
                // Retrieving data from result set
                while (rs.next()) {
        %>
                    <tr>
                        <td><%=rs.getString("provisional_trip_id") %></td>
                        <td><%=rs.getString("dvc_aa_approval_date") %></td>
                        <td><%=rs.getString("visit_location") %></td>
                        <td><%=rs.getString("purpose") %></td>
                        <td><%=rs.getString("registrar_aa_approval_date") %></td>
                        <td><%=rs.getString("dvc_apd_approval_date") %></td>                 
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

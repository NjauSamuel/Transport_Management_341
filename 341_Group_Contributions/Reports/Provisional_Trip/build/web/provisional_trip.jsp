<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, java.lang.*, javax.servlet.*" %>

<html>
   <head>
      <title>Provisional Trips Report</title>
   </head>
   <body>
      <h2>Provisional Trips Report</h2>
      <table border="1">
         <thead>
            <tr>
               <th>Provisional Trip ID</th>
               <th>Trip ID</th>
               <th>DVC AA Approval Date</th>
            </tr>
         </thead>
         <tbody>
        <%
        // Database connection details
        String url = "jdbc:mysql://localhost:3306/campus_travel_planner?useSSL=false&allowPublicKeyRetrieval=true";
        String username = "root";
        String password = "Valval.2020";
        
        try {
            // Loading JDBC driver
            Class.forName("com.mysql.jdbc.Driver");
            
            // Connecting to the database
            try (Connection conn = DriverManager.getConnection(url, username, password)) {
                // Create SQL statement with a PreparedStatement
                String sql = "SELECT pt.provisional_trip_id, pt.trip_id, pt.dvc_aa_approval_date "
                        + "FROM provisionaltrips pt";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                
                // Execute SQL query
                ResultSet rs = pstmt.executeQuery();
                
                // Retrieving data from result set
                while (rs.next()) {
        %>
                    <tr>
                        <td><%=rs.getString("provisional_trip_id") %></td>
                        <td><%=rs.getString("trip_id") %></td>
                        <td><%=rs.getString("dvc_aa_approval_date") %></td>            
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


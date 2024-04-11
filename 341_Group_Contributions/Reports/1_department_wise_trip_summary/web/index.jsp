<%-- 
    Document   : report
    Created on : 8 Apr 2024, 10:40:30
    Author     : acer
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, java.lang.*, javax.servlet.*" %>

<html>
   <head>
      <title>Department Trip Summary</title>
          <style>
     body {
    font-family: Arial, sans-serif;
    color: #000;
    background-color: #f4f4f4
     }

h2 {
    color: #000;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

table, th, td {
    border: 1px solid #ddd;
}

th {
    background-color: #f4f4f4;
    text-align: left;
    padding: 8px;
}

td {
    padding: 8px;
}

tr:nth-child(all) {
    background-color: #f4f4f4;
}

tr:hover {
    background-color: #00b51a;
}

td:nth-child(2),
td:nth-child(3),
td:nth-child(4) {
    text-align: center;
}
   
    </style>
   </head>
   <body>
      <h2>Trip Summary</h2>
      <table border="1">
         <thead>
            <tr>
                <th>Department Name</th>
               <th>Total Trips</th>
               <th>Total Budget allocated </th>
               <th>Average Budget per trip</th>
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
                String sql = "SELECT d.department_name, " +
                           "COUNT(t.trip_id) AS total_trips, " +
                           "SUM(t.budget) AS total_budget, " +
                           "AVG(t.budget) AS average_budget " +
                           "FROM Departments d " +
                           "LEFT JOIN Trips t ON d.department_id = t.department_id " +
                           "GROUP BY d.department_id";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                
                // Execute SQL query
                ResultSet rs = pstmt.executeQuery();
                
                // Retrieving data from result set
                while (rs.next()) {
        %>
                    <tr>
                         <td><%=rs.getString("department_name") %></td>
                        <td><%=rs.getString("total_trips") %></td>
                        <td><%=rs.getString("total_budget") %></td>
                        <td><%=rs.getString("average_budget") %></td>   
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

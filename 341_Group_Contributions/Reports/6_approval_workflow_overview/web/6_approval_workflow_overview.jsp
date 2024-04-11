<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, java.lang.*, javax.servlet.*" %>

<html>
   <head>
      <title>Data Table</title>
      <!-- Bootstrap CSS -->
      <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
      
   </head>
   <body>
       <section class="py-4 bg-light">
            <div class="container px-5 py-3">
                <div class="row gx-5 justify-content-center text-center mb-4">
                    <div class="col-lg-8 col-xl-6">
                        <h2 class="fw-bolder">Approval Workflow Overview</h2>
                    </div>
                </div>
                
               <div class="table-responsive row">
                  <table class="table table-bordered table-striped">
                      <colgroup>
                          <col style="width: 10%;">
                          <col style="width: 15%;">
                          <col style="width: 20%;">
                          <col style="width: 25%;">
                          <col style="width: 15%;">
                          <col style="width: 15%;">
                      </colgroup>
                     <thead class="bg-primary bg-gradient text-white">
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
               </div>
            </div>
       </section>
      <!-- Bootstrap JS -->
      <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
      <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
   </body>
</html>

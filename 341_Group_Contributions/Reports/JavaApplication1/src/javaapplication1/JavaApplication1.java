package javaapplication1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class JavaApplication1 {

    public static void main(String[] args) {
        // Database connection details
        String url = "jdbc:mysql://localhost:3306/campus_travel_planner?useSSL=false";
        String username = "root";
        String password = "root1";

        // Store results in a list of arrays
        ArrayList<String[]> data = new ArrayList<>();

        try (Connection conn = DriverManager.getConnection(url, username, password)) {
            // Create SQL statement
            String sql = "SELECT pt.provisional_trip_id, pt.dvc_aa_approval_date, t.visit_location, t.purpose, ft.registrar_aa_approval_date, ft.dvc_apd_approval_date "
                    + "FROM provisionaltrips pt "
                    + "INNER JOIN trips AS t ON t.trip_id = pt.trip_id "
                    + "LEFT JOIN finaltripsList ft ON pt.trip_id = ft.trip_id";
            Statement stmt = conn.createStatement();

            // Execute SQL query
            ResultSet rs = stmt.executeQuery(sql);

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

        // Print data to console
        System.out.println("Data from database:");
        for (String[] row : data) {
            for (String value : row) {
                System.out.print(value + "\t");
            }
            System.out.println();
        }
    }
}

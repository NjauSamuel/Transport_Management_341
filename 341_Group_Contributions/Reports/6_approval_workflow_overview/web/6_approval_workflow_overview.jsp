<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // Store data in an array
    String[][] data = {
        {"1", "2024-02-28", "Conference in New York", "Professional Development", "2024-03-01", "2024-03-02"},
        {"2", "2024-03-01", "Field trip to Yellowstone", "Educational", "2024-03-02", "2024-03-03"},
        {"3", "2024-03-02", "Research visit to MIT", "Research Collaboration", "2024-03-03", "2024-03-04"},
        {"4", "2024-03-03", "Workshop in Chicago", "Training", "2024-03-04", "2024-03-05"},
        {"5", "2024-03-04", "Seminar at Stanford", "Academic Presentation", "null", "null"},
        {"6", "2024-03-21", "Research visit to MIT", "Research Collaboration", "2024-03-03", "2024-03-04"}
    };
%>

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
            <% for (String[] row : data) { %>
                <tr>
                    <% for (String value : row) { %>
                        <td><%= value %></td>
                    <% } %>
                </tr>
            <% } %>
        </tbody>
    </table>
</body>
</html>

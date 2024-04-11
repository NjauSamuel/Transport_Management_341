<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>

<html>
<head>
    <title>Display Data</title>
</head>
<body>
    <a href="DataServlet">Report</a>
    
    <% String dataType = (String) request.getAttribute("dataType");
    if (dataType != null && !dataType.isEmpty()) { %>
        <p>Data type of the 'data' array: <%= dataType %></p>
    <% } else { %>
        <p>No data type available</p>
    <% } %>
    
    <% 
        ArrayList<String[]> dataFromRequest = (ArrayList<String[]>) request.getAttribute("data");
        if (dataFromRequest != null && !dataFromRequest.isEmpty()) {
            out.println("<p>Data from Database:</p>");
            for (String[] row : dataFromRequest) {
                for (String value : row) {
                    out.println(value + "\t");
                }
                out.println("<br>");
            }
        } else {
            out.println("<p>No data available</p>");
        } 
    %>

    
    <h2>Data from Database</h2>
    <%-- Check if an error message is available --%>
    <% String errorMessage = (String) request.getAttribute("errorMessage");
    if (errorMessage != null) { %>
        <p style="color: red;"><%= errorMessage %></p>
    <% } else { %>
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
                <% ArrayList<String[]> data = (ArrayList<String[]>) request.getAttribute("data");
                if (data != null) {
                    for (String[] row : data) { %>
                        <tr>
                            <% for (String value : row) { %>
                                <td><%= value %></td>
                            <% } %>
                        </tr>
                    <% }
                } else { %>
                    <tr>
                        <td colspan="6">No data available</td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    <% } %>
</body>
</html>

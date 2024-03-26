<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Data Display</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h2>Data from Database</h2>
    <table>
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
                ArrayList<String[]> data = (ArrayList<String[]>) request.getAttribute("data");
                for (String[] row : data) {
            %>
            <tr>
                <td><%= row[0] %></td>
                <td><%= row[1] %></td>
                <td><%= row[2] %></td>
                <td><%= row[3] %></td>
                <td><%= row[4] %></td>
                <td><%= row[5] %></td>
            </tr>
            <% } %>
        </tbody>
    </table>
</body>
</html>

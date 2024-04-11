<%-- 
    Document   : index
    Created on : 12 Mar 2024, 14:12:15
    Author     : acer
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Communication Record</title>
    <style>
        body{
            font-family: Arial,sans-serif;
            margin: 0;
            padding: 0;
            background-color: black;
        }
        h2{
            color: #fff;
        }
        form{
            color: white;
            background-color: black;
            padding: 20px;
            width: 300px;
            margin: 50px auto;
        }
        label{
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
        }
        input[type="number"],
        textarea {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h2>Add Communication Record</h2>
    <form action="AddCommunicationServlet" method="POST">
        <label for="from_department_id">From Department ID:</label>
        <input type="number" id="from_department_id" name="from_department_id"  required /><br />
        <label for="to_department_id">To Department ID:</label>
        <input type="number" id="to_department_id" name="to_department_id" required /><br />
        <label for="communication_content">Communication Content:</label><br />
        <textarea id="communication_content" name="communication_content" rows="4" cols="50" required></textarea><br />
        <input type="submit" value="Add Communication Record" />
    </form>
</body>
</html>

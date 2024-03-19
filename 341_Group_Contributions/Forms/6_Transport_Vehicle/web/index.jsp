<%-- 
    Document   : index
    Created on : 13 Mar 2024, 11:07:16
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Transport Vehicle Page</title>
    </head>
    <body>
        <form action="TransportServlet" method="POST">
            <label for="vehicle_type">Vehicle Type:</label>
            <input type="text" id="vehicle_type" name="vehicle_type" required /><br />
            <label for="capacity">Capacity:</label>
            <input type="number" id="capacity" name="capacity" required /><br />
            <input type="submit" value="Add Transport Vehicle" />
        </form>
    </body>
</html>

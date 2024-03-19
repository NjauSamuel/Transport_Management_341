<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trip Vehicle Page</title>
    </head>
    <body>
        <form action="TripVehicleServlet" method="POST">
            <label for="trip_id">Trip ID:</label>
            <input type="number" id="trip_id" name="trip_id" required /><br />
            <label for="vehicle_id">Vehicle ID:</label>
            <input type="number" id="vehicle_id" name="vehicle_id" required /><br />
            <input type="submit" value="Add Trip Vehicle" />
        </form>
    </body>
</html>

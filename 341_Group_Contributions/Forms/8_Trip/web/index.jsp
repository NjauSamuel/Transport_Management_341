<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trips Page</title>
    </head>
    <body>
        <form action="TripServlet" method="POST">
            <label for="visit_location">Visit Location:</label>
            <input type="text"
               id="visit_location"
               name="visit_location"
               required /><br />
            <label for="budget">Budget:</label>
            <input 
                type="number" 
                id="budget" 
                name="budget" 
                step="0.01" 
                required /><br />
            <label for="purpose">Purpose:</label>
            <input 
                type="text" 
                id="purpose" 
                name="purpose" 
                required /><br />
            <label for="unit_involved">Unit Involved:</label>
            <input 
                type="text" 
                id="unit_involved" 
                name="unit_involved" 
                required /><br />
            <label for="visit_date">Visit Date:</label>
            <input 
                type="text" 
                id="visit_date" 
                name="visit_date" 
                required /><br />
            <label for="overnight_stay">Overnight Stay:</label>
            <input 
                type="text" 
                id="overnight_stay" 
                name="overnight_stay" /><br />
            <label for="department_id">Department ID:</label>
            <input
               type="number"
               id="department_id"
               name="department_id"
               required /><br />
            <input type="submit" value="Add Trip" />
        </form>
    </body>
</html>

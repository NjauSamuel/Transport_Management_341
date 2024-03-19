<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
   <head>
      <meta charset="UTF-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <title>Provisional Trips Approval</title>
   </head>
   <body>
      <h1>Provisional Trips Approval</h1>
      
        <form action="add_provisional_trip" method="POST">
            <label for="trip_id">Trip ID:</label>
            <input type="number" id="trip_id" name="trip_id" required /><br />
            <label for="dvc_aa_approval_date">DVC AA Approval Date:</label>
            <input
               type="date"
               id="dvc_aa_approval_date"
               name="dvc_aa_approval_date"
               required /><br />
            <input type="submit" value="Add Provisional Trip" />
        </form>
   </body>
</html>
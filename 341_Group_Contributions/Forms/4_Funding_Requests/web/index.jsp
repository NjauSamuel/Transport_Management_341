<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Funding Request</title>
    </head>
    <body>
        <form action="FundingRequestServlet" method="POST">
            <label for="trip_id">Trip ID:</label>
            <input 
                type="number" 
                id="trip_id" 
                name="trip_id" 
                required /><br />
            <label for="request_date">Request Date:</label>
            <input 
                type="date" 
                id="request_date" 
                name="request_date" 
                required /><br />
            <label for="amount_requested">Amount Requested:</label>
            <input
               type="number"
               id="amount_requested"
               name="amount_requested"
               step="0.01"
               required /><br />
            <input type="submit" value="Add Funding Request" />
        </form>
    </body>
</html>

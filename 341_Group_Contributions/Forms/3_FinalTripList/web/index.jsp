<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Final Trip List</title>
    </head>
    <body>
        <form action="AddFinalTripListServlet" method="POST">
            <label for="trip_id">Trip ID:</label>
            <input type="number" id="trip_id" name="trip_id" required /><br />
            <label for="registrar_aa_approval_date">Registrar AA Approval Date:</label>
            <input
               type="date"
               id="registrar_aa_approval_date"
               name="registrar_aa_approval_date"
               required /><br />
            <label for="dvc_apd_approval_date">DVC APD Approval Date:</label>
            <input
               type="date"
               id="dvc_apd_approval_date"
               name="dvc_apd_approval_date"
               required /><br />
            <label for="transport_manager_notification_date"
               >Transport Manager Notification Date:</label
            >
            <input
               type="date"
               id="transport_manager_notification_date"
               name="transport_manager_notification_date"
               required /><br />
            <input type="submit" value="Add Final Trip List Record" />
        </form>
    </body>
</html>

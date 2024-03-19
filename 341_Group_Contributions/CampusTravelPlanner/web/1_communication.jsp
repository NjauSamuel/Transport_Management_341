<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Communication Record</title>
</head>
<body>
    <h2>Add Communication Record</h2>
    <form action="AddCommunicationServlet" method="POST">
        <label for="from_department_id">From Department ID:</label>
        <input type="number" id="from_department_id" name="from_department_id" required /><br />
        <label for="to_department_id">To Department ID:</label>
        <input type="number" id="to_department_id" name="to_department_id" required /><br />
        <label for="communication_content">Communication Content:</label><br />
        <textarea id="communication_content" name="communication_content" rows="4" cols="50" required></textarea><br />
        <input type="submit" value="Add Communication Record" />
    </form>
</body>
</html>
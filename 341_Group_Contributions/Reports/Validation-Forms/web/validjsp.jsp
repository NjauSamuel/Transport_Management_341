<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Department Information</title>
    <script>
        function validateForm() {
            var departmentName = document.getElementById("departmentName").value;
            var contactEmail = document.getElementById("contactEmail").value;
            var contactMobile = document.getElementById("contactMobile").value;

            // Basic validation
            if (departmentName.trim() === "") {
                alert("Please enter department name.");
                return false;
            }
            if (contactEmail.trim() === "") {
                alert("Please enter contact email.");
                return false;
            }
            if (contactMobile.trim() === "") {
                alert("Please enter contact mobile.");
                return false;
            }
            if (!/^\+?[0-9]{10,15}$/.test(contactMobile)) {
                alert("Please enter a valid phone number (between 10 and 15 digits).");
                return false;
            }

            return true;
        }
    </script>
</head>
<body>
    <h1>Department Information</h1>
    <form action="DepartmentServlet1" method="post" onsubmit="return validateForm()">
        <label for="departmentName">Department Name:</label><br />
        <input
            type="text"
            id="departmentName"
            name="departmentName" /><br /><br />

        <label for="contactEmail">Contact Email:</label><br />
        <input
            type="email"
            id="contactEmail"
            name="contactEmail" /><br /><br />

        <label for="contactMobile">Contact Mobile:</label><br />
        <input
            type="text"
            id="contactMobile"
            name="contactMobile"
            pattern="[0-9]{10,15}"
            title="Enter a valid phone number" /><br /><br />

        <input type="submit" value="Submit" />
    </form>
</body>
</html>



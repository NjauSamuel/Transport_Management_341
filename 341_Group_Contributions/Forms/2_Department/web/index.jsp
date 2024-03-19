<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >
    <head>
         <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Department Information</title>
    </head>
    <body>
        <h1>Department Information</h1>
      <form action="DepartmentServlet1" method="post">
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

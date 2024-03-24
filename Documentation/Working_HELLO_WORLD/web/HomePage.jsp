<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= request.getAttribute("AppName") %></title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <p>Today well deploy: <b> <%= request.getAttribute("AppName") %> </b> </p>
    </body>
</html>

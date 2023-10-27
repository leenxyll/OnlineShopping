<%-- 
    Document   : ShowConfirmation
    Created on : Oct 25, 2023, 10:57:35 PM
    Author     : kotchanika
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1><center>Your Order is confirmed!</h1>
        <h1><center>The total amount is $<%= request.getParameter("totalPrice") %></h1>
    </body>
</html>

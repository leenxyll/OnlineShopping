<%-- 
    Document   : index
    Created on : Oct 24, 2023, 12:01:49 AM
    Author     : kotchanika
--%>

<%@page import="Model.ProductsTable"%>
<%@page import="java.util.List"%>
<%@page import="Model.Products"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
    </head>
    <body>
        <h1><center>DVD Catalog</h1>
        <form name="main" method="POST" action="AddToShoppingCart">
            <center>
            <table border="1">
                <thead>
                    <tr>
                        <th>DVD Names</th>
                        <th>Rate</th>
                        <th>Year</th>
                        <th>Price</th>
                        <th>Quantity</th>
                    </tr>
                </thead>
                <% 
                    Products prod = new Products();
                    List<Products> productsList = ProductsTable.findAll();
                    for(Products product: productsList){
                        prod.setId(product.getId());
                        prod.setMovie(product.getMovie());
                        prod.setRating(product.getRating());
                        prod.setYearcreate(product.getYearcreate());
                        prod.setPrice(product.getPrice());
                %>
                <tbody>
                    <tr>
                        <td>
                            <input type="checkbox" name="dvd" value=<%= prod.getId() %> />
                            <%= prod.getMovie() %>
                        </td>
                        <td><%= prod.getRating() %></td>
                        <td><%= prod.getYearcreate() %></td>
                        <td><%= prod.getPrice() %></td>
                        <td><input type="number" name="qty_<%= prod.getId() %>"></td>
                    </tr>
                </tbody>
                <% 
                    } 
                %>
            </table>
            <h1><input type="submit" value="Add To Cart" name="submit" /></h1>
        </form>
    </body>
</html>

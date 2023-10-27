<%-- 
    Document   : AddToShoppingCaart
    Created on : Oct 25, 2023, 3:11:44 PM
    Author     : kotchanika
--%>

<%@page import="java.util.ArrayList"%>
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
        <h1><center>Shopping Cart</h1>
        <form name="main" method="POST" action="ShowConfirmation">
            <center>
            <table border="1">
                <thead>
                    <tr>
                        <th>DVD Names</th>
                        <th>Rate</th>
                        <th>Year</th>
                        <th>Price/Unit</th>
                        <th>Quantity</th>
                        <th>Price</th>
                    </tr>
                </thead>
                <% 
                    Products prod = new Products();
                    List<Products> selected = (List<Products>)getServletContext().getAttribute("selected");
                    int totalPrice = 0;
                    for(Products product: selected){
                        prod.setId(product.getId());
                        prod.setMovie(product.getMovie());
                        prod.setRating(product.getRating());
                        prod.setYearcreate(product.getYearcreate());
                        prod.setPrice(product.getPrice());
                        int qty = Integer.parseInt(request.getParameter("qty_"+prod.getId()));
                        int pricePerProduct = prod.getPrice() * qty;
                        totalPrice += pricePerProduct;
                %>
                <tbody>
                    <tr>
                        <input type="hidden" name="product" value="<%= prod.getId() %>" />
                        <input type="hidden" name="qty_<%= prod.getId() %>" value="<%= qty %>">
                        <td><%= prod.getMovie() %></td>
                        <td><%= prod.getRating() %></td>
                        <td><%= prod.getYearcreate() %></td>
                        <td><%= prod.getPrice() %></td>
                        <td><%= qty %></td>
                        <td><%= pricePerProduct %></td>
                    </tr>
                </tbody>
                <% 
                    } 
                %>
                 <tbody>
                    <tr>
                        <td colspan = "5"><center> Total </td>
                        <td><%= totalPrice %></td>
                        <input type="hidden" name="totalPrice" value="<%= totalPrice %>" />
                    </tr>
                </tbody>
            </table>
            <h1><input type="submit" value="Check out" name="checkout"/></h1>
        </form>
    </body>
</html>

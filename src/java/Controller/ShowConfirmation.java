/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Products;
import Model.ProductsTable;
import Model.Shoppingcart;
import Model.ShoppingcartPK;
import Model.ShoppingcartTable;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author kotchanika
 */
public class ShowConfirmation extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String[] productList = request.getParameterValues("product");
        synchronized(getServletContext()) {
            List<Shoppingcart> cartList = ShoppingcartTable.findAll();
            int cartId;
            if (cartList.isEmpty()) {
                cartId = 1;
            }else {
                Shoppingcart finalCart = cartList.get(cartList.size() - 1);
                cartId = finalCart.getShoppingcartPK().getCartId()+1;
            }
            for (String product : productList) {
                Products prod = ProductsTable.findById(Integer.parseInt(product));
                int qty = Integer.parseInt(request.getParameter("qty_"+prod.getId()));
                Shoppingcart cart = new Shoppingcart();
                ShoppingcartPK cartPK = new ShoppingcartPK(cartId, prod.getId());
                cart.setShoppingcartPK(cartPK);
                System.out.println(cartPK.getCartId() + "   " + cartPK.getMovieId() + " "+ qty + prod);
                cart.setQuantity(qty);
                cart.setProducts(prod);
                ShoppingcartTable.insertShoppingcart(cart);        
            }
        }
        HttpSession session = request.getSession();
        if (request.getParameter("checkout") != null) {
            request.getRequestDispatcher("ShowConfirmation.jsp").forward(request, response);
            session.invalidate();
        }
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

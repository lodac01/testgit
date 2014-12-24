/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servlet;

import Model.BankAccount;
import Project.Model.Util;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author earthzy
 */
public class search extends HttpServlet {

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
        int id = 0;
        String para = request.getParameter("id");
        String message = null;
        if (para == null) {
            getServletContext().getRequestDispatcher("/search.jsp").forward(request, response);
        } else if (Util.isNumber(para)) {
            try {
                id = Integer.parseInt(request.getParameter("id"));
                BankAccount c = BankAccount.findById(id);
                if (c != null) {
                    request.setAttribute("customer", c);
                    getServletContext().getRequestDispatcher("/ShowCustomer.jsp").forward(request, response);
                    return;
                } else {
                    message = "Customer id  '" + id + "' does not exist !!!";                    
                }
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(search.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            try {
                List<BankAccount> customers = BankAccount.findByName(para);
                if (customers != null) {
                    request.setAttribute("customers", customers);
                    getServletContext().getRequestDispatcher("/ListCustomer.jsp").forward(request, response);
                    return;
                } else {
                    message = "Customer name  '" + para + "' does not exist !!!";               
                }
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(search.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        request.setAttribute("message", message);
        getServletContext().getRequestDispatcher("/search.jsp").forward(request, response);
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

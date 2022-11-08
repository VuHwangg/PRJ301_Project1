/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.authen;

import dal.AccountDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;

public class LoginController extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/view/authen/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        AccountDBContext db = new AccountDBContext();
        Account account = db.getAccount(username, password);
        if(account == null)
        {
            request.getSession().setAttribute("account", null);
            response.getWriter().println("login failed!");
        }
        else
        {
            request.getSession().setAttribute("account", account);
            response.getWriter().println("login successful!");
        }
    }

}

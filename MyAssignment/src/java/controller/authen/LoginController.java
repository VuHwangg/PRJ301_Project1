/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.authen;

import dal.AccountDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;
import model.Role;

public class LoginController extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String access = request.getParameter("access");
        if (access != null) {
            int access_num = Integer.parseInt(access);
            request.setAttribute("access", access_num);
        }
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
            response.sendRedirect("login?access=1");
        }
        else
        {
            // Lay ra role cua account
            Role role = account.getRoles().get(0);
            if (role == null) {
                request.getSession().setAttribute("account", null);
                response.sendRedirect("login?access=2");
            }
            else {
                request.getSession().setAttribute("account", account);
                if (role.getRid() == 1) {
                    request.getRequestDispatcher("/view/lecturer/home.jsp").forward(request, response);
                } else {
                    request.getRequestDispatcher("/view/student/homeStu.jsp").forward(request, response);
                }
            }
        }
    }

}

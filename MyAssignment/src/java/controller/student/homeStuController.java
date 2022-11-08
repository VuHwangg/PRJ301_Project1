/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.student;

import controller.authen.BaseRoleController;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;

public class homeStuController extends BaseRoleController {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response, Account account) 
            throws ServletException, IOException {
        request.setAttribute("account", account);
        request.getRequestDispatcher("../view/student/homeStu.jsp").forward(request, response);
    }

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response, Account account) 
            throws ServletException, IOException{
        processRequest(request, response, account);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response, Account account) 
            throws ServletException, IOException{
        processRequest(request, response, account);
    }

}

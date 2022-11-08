/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.lecturer;

import controller.authen.BaseRoleController;
import dal.SessionDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;
import model.Session;

public class CheckAttController extends BaseRoleController {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response, Account account) 
            throws ServletException, IOException {
        int sesid = Integer.parseInt(request.getParameter("id"));
        SessionDBContext sesDB = new SessionDBContext();
        // Lay ra thong tin cua 1 session dua theo id cua session do
        Session ses = sesDB.get(sesid);
        request.setAttribute("ses", ses);
        request.getRequestDispatcher("../view/lecturer/checkatt.jsp").forward(request, response);
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

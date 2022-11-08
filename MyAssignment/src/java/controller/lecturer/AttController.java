/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.lecturer;

import dal.SessionDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Attandance;
import model.Session;
import model.Student;
import util.DateTimeHelper;

public class AttController extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        int sesid = Integer.parseInt(request.getParameter("id"));
        SessionDBContext sesDB = new SessionDBContext();
        // Lay ra thong tin cua 1 session dua theo id cua session do
        Session ses = sesDB.get(sesid);
        request.setAttribute("ses", ses);
        // Neu ses.getDate() la Qua khu (truoc do > 2 ngay)
        if (DateTimeHelper.getDaystoCurrent(ses.getDate()) >= 2){
            request.getRequestDispatcher("../view/lecturer/checkatt.jsp").forward(request, response);
        }// Neu ses.getDate() la Tuong lai (bat dau tu ngay mai)
        else if(DateTimeHelper.getDaystoCurrent(ses.getDate()) < 0){
            response.sendRedirect("timetable?lid="+ses.getLecturer().getId());
        }
        else {
            request.getRequestDispatcher("../view/lecturer/takeatt.jsp").forward(request, response);
        }
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        Session ses = new Session();
        ses.setId(Integer.parseInt(request.getParameter("sesid")));
        String[] stdids = request.getParameterValues("stdid");
        for (String stdid : stdids) {
            Attandance a =new Attandance();
            Student s = new Student();
            a.setStudent(s);
            a.setDescription(request.getParameter("description"+stdid));
            a.setPresent(request.getParameter("present"+stdid).equals("present"));
            s.setId(Integer.parseInt(stdid));
            ses.getAttandances().add(a);
        }
        SessionDBContext db = new SessionDBContext();
        db.update(ses);
        response.sendRedirect("takeatt?id="+ses.getId());
    }

}

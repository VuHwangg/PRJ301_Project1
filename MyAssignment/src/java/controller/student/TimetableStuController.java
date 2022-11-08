/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.student;

import controller.authen.BaseRoleController;
import dal.SessionDBContext;
import dal.StudentDBContext;
import dal.TimeSlotDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Date;
import model.Account;
import model.Session;
import model.Student;
import model.TimeSlot;
import util.DateTimeHelper;

public class TimetableStuController extends BaseRoleController {
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response, Account account) 
            throws ServletException, IOException {
        int stdid = account.getAid();
        String raw_from = request.getParameter("from");
        String raw_to = request.getParameter("to");
        java.sql.Date from = null;
        java.sql.Date to = null;
        
        // Return "date from" and "date to"
        if(raw_from ==null || raw_from.length() ==0 || raw_to == null || raw_to.length() == 0)
        {
            // Khoi tao 1 object date ma k chuyen tham so se mac dinh tao ra
            // 1 date lay thoi gian hien tai luc khoi tao
            Date today = new Date();
            int todayOfWeek = DateTimeHelper.getDayofWeek(today);
            Date e_from = DateTimeHelper.addDays(today, 2 - todayOfWeek);
            Date e_to = DateTimeHelper.addDays(today, 8-todayOfWeek);
            from = DateTimeHelper.toDateSql(e_from);
            to = DateTimeHelper.toDateSql(e_to);
        }
        else
        {
            // Convert from String type to SQL Date type
            from = java.sql.Date.valueOf(raw_from);
            to = java.sql.Date.valueOf(raw_to);
        }

        // Arraylist of Column table
        request.setAttribute("from", from);
        request.setAttribute("to", to);
        // Arraylist of days "from -> to"
        request.setAttribute("dates", DateTimeHelper.getDateList(from, to));
        
        // Arraylist of Rows table
        TimeSlotDBContext slotDB = new TimeSlotDBContext();
        ArrayList<TimeSlot> slots = slotDB.list();
        request.setAttribute("slots", slots);

        SessionDBContext sesDB = new SessionDBContext();
        ArrayList<Session> sessions = sesDB.getStudentTimetable(stdid, from, to);
        request.setAttribute("sessions", sessions);

        StudentDBContext sDB = new StudentDBContext();
        Student student = sDB.get(stdid);
        request.setAttribute("student", student);
        
        request.getRequestDispatcher("../view/student/timetableStu.jsp").forward(request, response);
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

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Student;

public class StudentDBContext extends DBContext<Student> {

    @Override
    public void insert(Student model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Student model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Student model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Student get(int id) {
        try {
            String sql = "SELECT stdid, stdname, stdcode FROM Student WHERE stdid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if(rs.next())
            {
                Student l = new Student();
                l.setId(rs.getInt("stdid"));
                l.setName(rs.getString("stdname"));
                l.setCode(rs.getString("stdcode"));
                return l;
            }
        } catch (SQLException ex) {
            Logger.getLogger(LecturerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public ArrayList<Student> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}

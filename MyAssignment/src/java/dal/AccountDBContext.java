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
import model.Account;
import model.Feature;
import model.Role;

public class AccountDBContext extends DBContext<Account> {

    public Account getAccount(String username, String password) {
        try {
            String sql = "SELECT a.username,a.displayname, a.aid, a.fullname\n"
                    + "	,r.rid,r.rname\n"
                    + "	,f.fid,f.fname,f.url\n"
                    + "	FROM Account a \n"
                    + "	LEFT JOIN Role_Account ra ON a.username = ra.username\n"
                    + "	LEFT JOIN [Role] r ON r.rid = ra.rid\n"
                    + "	LEFT JOIN Role_Feature rf ON rf.rid = r.rid\n"
                    + "	LEFT JOIN Feature f ON f.fid = rf.fid\n"
                    + "WHERE a.username =? AND a.[password] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            ResultSet rs = stm.executeQuery();
            Account account = null;
            Role currentRole = new Role();
            currentRole.setRid(-1);
            while (rs.next()) {
                if (account == null) {
                    account = new Account();
                    account.setUsername(rs.getString("username"));
                    account.setDisplayName(rs.getString("displayname"));
                    account.setAid(rs.getInt("aid"));
                    account.setFullname(rs.getString("fullname"));
                }
                int rid = rs.getInt("rid");
                if (rid != 0) {
                    if (rid != currentRole.getRid()) {
                        currentRole = new Role();
                        currentRole.setRid(rs.getInt("rid"));
                        currentRole.setRname(rs.getString("rname"));
                        account.getRoles().add(currentRole);
                    }
                }

                int fid = rs.getInt("fid");
                if (fid != 0) {
                    Feature f = new Feature();
                    f.setFid(rs.getInt("fid"));
                    f.setFname(rs.getString("fname"));
                    f.setUrl(rs.getString("url"));
                    currentRole.getFeatures().add(f);
                }
            }
            return account;
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public void insert(Account model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Account model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Account model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Account get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Account> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}

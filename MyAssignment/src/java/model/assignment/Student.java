/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.assignment;

import java.util.ArrayList;

public class Student {
    private int id;
    private String name;
    private String code;

    
    private ArrayList<Group> groups = new ArrayList<>();
    private ArrayList<Attandance> attandances = new ArrayList<>();

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public ArrayList<Group> getGroups() {
        return groups;
    }

    public void setGroups(ArrayList<Group> groups) {
        this.groups = groups;
    }

    public ArrayList<Attandance> getAttandances() {
        return attandances;
    }

    public void setAttandances(ArrayList<Attandance> attandances) {
        this.attandances = attandances;
    }
    
    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Oops;

/**
 *
 * @author Karthick Raja
 */
public class Person {
    protected String name;
    protected int age;
    protected String roll;

    public Person(String name, int age,String roll) {
        this.name = name;
        this.age = age;
        this.roll= roll;
    }
    public String getname(){return name;}
    public int getage(){return age;}
    public String getRollnumber(){return roll;}
    
}

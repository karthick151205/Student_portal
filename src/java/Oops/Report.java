/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Oops;

/**
 *
 * @author Karthick Raja
 */
public abstract class Report extends Person{
    
    public Report(String name, int age,String roll) {
        super(name,age,roll);
    }
    public abstract void calculateResult();
    public abstract void displayResult();
    
    
}

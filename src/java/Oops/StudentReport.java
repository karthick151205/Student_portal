/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Oops;

/**
 *
 * @author Karthick Raja
 */
public class StudentReport extends Report{

    private int totalmark;
    private String result;
    private String grade;
    private double percentage;
    private final int[] marks;
    private final String[] subjects = {
        "Tamil", "English", "Mathematics", "Physics", "Chemistry", "Computer Science"
    };

    public StudentReport(String name,int age,String roll,int[] marks) {
        super(name, age,roll);
        this.marks = marks;
    }

    // Calculate total marks
    public int calculate() {
        totalmark = 0;
        for (int mark : marks) {
            totalmark += mark;
        }
        return totalmark;
    }

    // Calculate percentage and grade
    public void calculate(int totalmark) {
        this.percentage = ((double) totalmark / 600) * 100;
        if (percentage >= 90) this.grade = "A";
        else if (percentage >= 80) this.grade = "B";
        else if (percentage >= 70) this.grade = "C";
        else if (percentage >= 60) this.grade = "D";
        else if (percentage >= 50) this.grade = "E";
        else this.grade = "F";
    }

    // Determine pass/fail result
    public void calculate(String type) {
        for (int mark : marks) {
            if (mark < 35) {
                this.result = "Fail";
                return;
            }
        }
        result = "Pass";
    }

    @Override
    public void calculateResult() {
        int total = calculate();
        calculate("result");
        calculate(total);
    }

    /**
     *
     */
    @Override
    public void displayResult() {
    }
     public int getTotalMark() { return totalmark; }
    public double getPercentage() { return percentage; }
    public String getGrade() { return grade; }
    public String getResult() { return result; }
}


   
                
           
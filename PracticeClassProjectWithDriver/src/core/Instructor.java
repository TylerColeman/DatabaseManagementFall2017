
package core;
/**
 *
 * @author ramona.wuthrich
 */
public class Instructor {
    private int ID;
    private String name;
    private String dept;
    private double salary;
    
    public Instructor(){
        ID = 0;
        name = "";
        dept = "";
        salary = 0;
    }
    
    public Instructor(int i, String n, String d, double s){
        ID = i;
        name = n;
        dept = d;
        salary = s;
    }
    public int getID(){
        return ID;
    }
    public String getName(){
        return name;
    }
    public String getDept(){
        return dept;
    }
    public double getSalary(){
        return salary;
    } 
}

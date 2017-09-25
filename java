/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;
import java.sql.*;
        
/**
 *
 * @author BO103LabStudent
 */
public class InstructorDAO {
    public static void main(String[] args) {
        try {
            // get a connection
            String dbURL = "jdbc:mysql://10.0.60.55:3306/tbcoleman";
            String user = "tbcoleman";
            String pass = "heckerman32";
            Connection myConn = DriverManager.getConnection(dbURL, user, pass);
            // create statements
            Statement myStmt = myConn.createStatement();
            // execute a query
            ResultSet myRs = myStmt.executeQuery("select * from instructor");
            // process results
            while(myRs.next()){
                System.out.println("Last name: " + myRs.getString("name"));
            }
        }
        catch (Exception exc) {
            System.out.print("Problem " + exc);
        }
    }
}

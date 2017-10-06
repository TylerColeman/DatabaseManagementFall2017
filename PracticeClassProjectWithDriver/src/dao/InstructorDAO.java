package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import core.Instructor;
import javax.swing.JOptionPane;

/**
 *
 * @author ramona.wuthrich
 */
public class InstructorDAO {

    private Connection myConn;

    public InstructorDAO() throws Exception {
        String dbURL = "jdbc:mysql://10.0.60.55/tbcoleman";
        String user = "tbcoleman";
        String pass = "heckerman32";
        myConn = DriverManager.getConnection(dbURL, user, pass);
        System.out.println("DB connection successful");
    }

    public List<Instructor> getAllInstructors() throws Exception {
        List<Instructor> list = new ArrayList<>();
        Statement myStmt = null;
        ResultSet myRs = null;
        try {
            myStmt = myConn.createStatement();
            myRs = myStmt.executeQuery("select * from instructor");
            while (myRs.next()) {
                Instructor tempInstructor = convertRowToInstructor(myRs);
                list.add(tempInstructor);
            }
            return list;
        } finally {
            close(myStmt, myRs);
        }
    }

    public void addInstructor(int i, String n, String d, double s) throws Exception {
        PreparedStatement myStmt = null;

        try {
            myStmt = myConn.prepareStatement("insert into instructor"
                    + " values (?, ?, ?, ?)");
            // set params
            myStmt.setInt(1, i);
            myStmt.setString(2, n);
            myStmt.setString(3, d);
            myStmt.setDouble(4, s);
            // execute SQL
            myStmt.executeUpdate();
        } finally {
            close(myStmt, null);
        }
    }

    private static void close(Connection myConn, Statement myStmt, ResultSet myRs)
            throws SQLException {
        if (myRs != null) {
            myRs.close();
        }
        if (myStmt != null) {
        }
        if (myConn != null) {
            myConn.close();
        }
    }

    private void close(Statement myStmt, ResultSet myRs) throws SQLException {
        close(null, myStmt, myRs);
    }

    private Instructor convertRowToInstructor(ResultSet myRs) throws SQLException {
        int id = myRs.getInt("ID");
        String name = myRs.getString("name");
        String dept = myRs.getString("dept_name");
        double salary = myRs.getDouble("salary");
        Instructor tempInstructor = new Instructor(id, name, dept, salary);
        return tempInstructor;
    }
}

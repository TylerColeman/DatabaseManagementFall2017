package gui;

import java.util.List;
import core.Instructor;
import javax.swing.table.AbstractTableModel;

/**
 *
 * @author ramona.wuthrich
 */
public class InstructorTableModel extends AbstractTableModel {

    private static final int ID_COL = 0;
    private static final int NAME_COL = 1;
    private static final int DEPT_COL = 2;
    private static final int SALARY_COL = 3;
    private String[] columnNames = {"ID", "Name", "Dept", "Salary"};
    private List<Instructor> instructors;

    public InstructorTableModel(List<Instructor> theInstructors) {
        instructors = theInstructors;
    }

    public int getColumnCount() {
        return columnNames.length;
    }

    public int getRowCount() {
        return instructors.size();
    }

    public String getColumnName(int col) {
        return columnNames[col];
    }

    public Object getValueAt(int row, int col) {
        Instructor tempInstructor = instructors.get(row);
        switch (col) {
            case ID_COL:
                return tempInstructor.getID();
            case NAME_COL:
                return tempInstructor.getName();
            case DEPT_COL:
                return tempInstructor.getDept();
            case SALARY_COL:
                return tempInstructor.getSalary();
            default:
                return tempInstructor.getID();
        }
    }

    public Class getColumnClass(int c) {
        return getValueAt(0, c).getClass();
    }
}

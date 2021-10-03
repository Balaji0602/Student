package com.balaji.school;

import java.sql.*;
import java.util.*;

public class StudentUtil {

	public static void createStudent(Student student) throws Exception {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		try {
			connection = DatabaseUtil.getDatabaseConnection();
			String query = "INSERT INTO STUDENT VALUES(?,?,?,?)";
			String Query1 = "SELECT IFNULL(MAX(roll_number),0) + 1 AS AUTO_ROLL_NO FROM STUDENT";
			PreparedStatement preparedStatement1 = connection.prepareStatement(Query1);
			ResultSet resultset = preparedStatement1.executeQuery();
			int autorollnumber = 1;
			if (resultset.next()) {
				autorollnumber = resultset.getInt("AUTO_ROLL_NO");
			}
			preparedStatement = connection.prepareStatement(query);

			preparedStatement.setInt(1, autorollnumber);
			preparedStatement.setString(2, student.getName());
			preparedStatement.setString(3, student.getStandard());
			preparedStatement.setString(4, student.getSection());
			preparedStatement.execute();
			preparedStatement.close();
			connection.close();
		} catch (Exception ex) {
			ex.printStackTrace();
			throw ex;
		} finally{
			if(connection != null){
				
			}
		}
	}

	public static void updateStudent(Student student) throws Exception {
		try {
			Connection connection = DatabaseUtil.getDatabaseConnection();
			String query = "UPDATE STUDENT SET NAME = ?,STANDARD = ?, SECTION = ? WHERE ROLL_NUMBER = ?";
			PreparedStatement preparedstatement = connection.prepareStatement(query);
			preparedstatement.setString(1, student.getName());
			preparedstatement.setString(2, student.getStandard());
			preparedstatement.setString(3, student.getSection());
			preparedstatement.setInt(4, student.getRollNumber());

			preparedstatement.execute();
			preparedstatement.close();
			connection.close();
		} catch (Exception ex) {
			ex.printStackTrace();
			throw ex;
		}
	}

	public static List<Student> viewStudents() throws Exception {
		try {
			Connection connection = DatabaseUtil.getDatabaseConnection();
			String query = "SELECT * FROM STUDENT";
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			ResultSet resultset = preparedStatement.executeQuery();

			List<Student> students = new ArrayList<>();
			while (resultset.next()) {
				int rollNumber = resultset.getInt("ROLL_NUMBER");
				String name = resultset.getString("NAME");
				String standard = resultset.getString("STANDARD");
				String section = resultset.getString("SECTION");

				Student student = new Student();
				student.setRollNumber(rollNumber);
				student.setName(name);
				student.setStandard(standard);
				student.setSection(section);
				students.add(student);
			}
			resultset.close();
			preparedStatement.close();
			connection.close();
			return students;
		} catch (Exception ex) {
			ex.printStackTrace();
			throw ex;
		}
	}

	public static void deleteStudent(int rollNumber) throws Exception {
		try {
			Connection connection = DatabaseUtil.getDatabaseConnection();
			String query = "DELETE FROM STUDENT WHERE ROLL_NUMBER = ?";
			PreparedStatement preparedStatement = connection.prepareStatement(query);

			preparedStatement.setInt(1, rollNumber);
			preparedStatement.execute();
			preparedStatement.close();
			connection.close();
		} catch (Exception ex) {
			ex.printStackTrace();
			throw ex;
		}
	}
}

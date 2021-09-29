package com.school.p1;

import java.sql.*;
import java.util.*;

public class SchoolRecord {
	
	public static void insertRecord(Records student) throws Exception {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/balaji", "root",
					"balaji@007");
			String query = "INSERT INTO STUDENT VALUES(?,?,?,?)";
			String Query1 = "SELECT IFNULL(MAX(roll_number),0) + 1 AS AUTO_ROLL_NO FROM STUDENT";
			PreparedStatement preparedstatement1 = connection.prepareStatement(Query1);
			ResultSet resultset = preparedstatement1.executeQuery();
			int autorollnumber = 1;
			if (resultset.next()) {
				autorollnumber = resultset.getInt("AUTO_ROLL_NO");
			}
			PreparedStatement preparedstatement = connection.prepareStatement(query);
			
			
			preparedstatement.setInt(1, autorollnumber);
			preparedstatement.setString(2, student.getName());
			preparedstatement.setString(3, student.getStandard());
			preparedstatement.setString(4, student.getSection());
			preparedstatement.execute();
			preparedstatement.close();
			connection.close();
		} catch (Exception ex) {
			ex.printStackTrace();
			throw ex;
		}
	}

	 public static void editRecord(Records student) throws Exception{
	 try{
	 Class.forName("com.mysql.cj.jdbc.Driver") ;
	 Connection connection =
	 DriverManager.getConnection("jdbc:mysql://localhost:3306/balaji", "root",
	 "balaji@007");
	 String query = "UPDATE STUDENT SET NAME = ?,STANDARD = ?, SECTION = ? WHERE ROLL_NUMBER = ?";
	 PreparedStatement preparedstatement = connection.prepareStatement(query);
	 preparedstatement.setString(1, student.getName());
	 preparedstatement.setString(2, student.getStandard());
	 preparedstatement.setString(3, student.getSection());
	 preparedstatement.setInt(4, student.getRollNumber());
	 
	 preparedstatement.execute();
	 preparedstatement.close();
	 connection.close();
	 }catch (Exception ex){
	 ex.printStackTrace();
	 throw ex;
	 }
	 }
	public static Records getRecord(int rollNumber) throws Exception {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/balaji", "root",
					"balaji@007");
			String query = " SELECT ROLL_NUMBER, NAME, STANDARD, SECTION FROM STUDENT WHERE ROLL_NUMBER = ?";
			PreparedStatement preparedstatement = connection.prepareStatement(query);
			preparedstatement.setInt(1, rollNumber);
			ResultSet resultSet = preparedstatement.executeQuery();

			Records records = new Records();
			records.setRollNumber(rollNumber);
			while (resultSet.next()) {
				String name = resultSet.getString("NAME");
				records.setName(name);
				String standard = resultSet.getString("STANDARD");
				records.setStandard(standard);
				String section = resultSet.getString("SECTION");
				records.setSection(section);
			}
			resultSet.close();
			preparedstatement.close();
			connection.close();
			return records;
		} catch (Exception ex) {
			ex.printStackTrace();
			throw ex;
		}
	}

	public static List<Records> ViewRecords() throws Exception {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/balaji","root",
					"balaji@007");
			String query = "SELECT * FROM STUDENT";
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			ResultSet resultset = preparedStatement.executeQuery();
			
			List<Records> students = new ArrayList<>();
			while (resultset.next()) {
				int rollNumber = resultset.getInt("ROLL_NUMBER");
				String name = resultset.getString("NAME");
				String standard = resultset.getString("STANDARD");
				String section = resultset.getString("SECTION");

				Records student = new Records();
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
	
	public static void DeleteRecord(int rollNumber) throws Exception{
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/balaji","root","balaji@007");
			String query = "DELETE FROM STUDENT WHERE ROLL_NUMBER = ?";
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			
			preparedStatement.setInt(1, rollNumber);
			preparedStatement.execute();
			preparedStatement.close();
			connection.close();
		}catch (Exception ex){
			ex.printStackTrace();
			throw ex;
		}
	}
}

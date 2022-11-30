package com.web.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

public class Student_model {
	
private DataSource dataSource;


	public Student_model(DataSource theDataSource){
		dataSource = theDataSource;
	}
	
	
	public Student dbUtil(int id) throws Exception{
		
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet myRs = null;			

		try{
			conn = dataSource.getConnection();
			String sql = "SELECT * FROM student WHERE id =  + ?";
	
			pst= conn.prepareStatement(sql);
			pst.setInt(1, id);
			myRs = pst.executeQuery();
			myRs.next();
			
			Student student = new Student(id ,myRs.getString("first_name"), myRs.getString("last_name"), myRs.getString("email"));
			return student;
	
		/*}catch(Exception e){
			System.out.println("Couldn't close connection: " + e.getMessage());
			e.printStackTrace();*/
			
		}finally {
			close(conn, pst, myRs);
		}
	}
	
	
	
	public void UpdateStudent(Student student) throws Exception{
		Connection conn = null;
		PreparedStatement pst = null;
		try {
			conn=dataSource.getConnection();
			String sql = "UPDATE student SET first_name =?, last_name=?, email =? WHERE id =?";
			
			pst = conn.prepareStatement(sql);
			
			pst.setString(1, student.getFirstName());
			pst.setString(2, student.getLastName());
			pst.setString(3, student.geteMail());
			pst.setInt(4, student.getId());
			
			pst.executeUpdate();	
						
		}catch(Exception e) {
			e.printStackTrace();
		}
		close(conn, pst , null);
	}

	public void addStudent(Student student) throws Exception{
		Connection conn = null;
		PreparedStatement pst = null;
				
		try {
			conn = dataSource.getConnection();
						
			String sql = "INSERT INTO student "
					+ "(first_name, last_name, email) "
					+ "VALUES(?, ? ,?)";
			
			pst = conn.prepareStatement(sql);
			//pst.setString(1, firstname);
			//pst.setString(2, lastname);
			//pst.setString(3, email);
			pst.setString(1, student.getFirstName());
			pst.setString(2, student.getLastName());
			pst.setString(3, student.geteMail());
			
		 	//if((item != null) && (item.trim().length() > 0) && (!todo.contains(item))){
		 		
		 		//todo.add(item.trim());
		 		
			//}
		 	
			pst.executeUpdate();

		}catch(Exception e) {
			e.printStackTrace();		

		}finally{
			//conn.close();
			//pst.close();
			close(conn, pst, null);			
		}		
	}
	

	public List<Student> getStudents() throws Exception{
	
		//setAttributed에 담을 배열을 선언함
		List<Student> students = new ArrayList<Student>();
		Connection conn = null;
		Statement mySt = null;
		ResultSet myRs = null;
		
		
		try{
			//데이터 베이스와 연결 되어 있는 동안에
			conn = dataSource.getConnection();
			String sql = "SELECT * FROM student";
			mySt= conn.createStatement();
			myRs = mySt.executeQuery(sql);
				
			while(myRs.next()) {
				//기본 생성자 선언 해서 사용하기
				/*
				Student student = new Student();
				student.setId(myRs.getInt("id"));
				student.setFirstName(myRs.getString("first_name"));
				student.setLastName(myRs.getString("last_name"));
				student.seteMail(myRs.getString("email"));
				students.add(student);
				*/
				
				//constructor using fields
				Student student = new Student(
						myRs.getInt("id"), 
						myRs.getString("first_name"), 
						myRs.getString("last_name"), 
						myRs.getString("email"));
				students.add(student);
				
				}
				return students;
	
		}finally{
				//myRs.close();
				//mySt.close();
				//conn.close();
			close(conn, mySt, myRs);
		}	
	}
	
	protected void close(Connection conn, Statement mySt, ResultSet myRs) throws Exception{
		try {		
			if(myRs != null)
				myRs.close();
			if(mySt != null)
				mySt.close();
			if(conn != null)
				conn.close();
			
		}catch(Exception e){
			System.out.println("Couldn't close connection: " + e.getMessage());
			e.printStackTrace();
		}
	}
	
}


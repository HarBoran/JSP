package com.web.jdbc;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 * Servlet implementation class student_servlet
 */
@WebServlet("/student_servlet")	
public class Student_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private Student_model student_model;
	
	//어떤 데이터 베이스와 연결할 것인가?
	@Resource(name="jdbc/web_student_tracker")
	private DataSource dataSource;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		student_model = new Student_model(dataSource);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	try {	
		String checkPage = request.getParameter("command");
	
		if (checkPage == null) {
			checkPage = "LIST";
		}
		
		switch(checkPage) {
		case "LIST":
			listStudents(request, response);
			break;
		case "ADD":
			addStudents(request, response);
			break;
		case "LOAD":
			loadStudents(request, response);
			break;
		case "Update":
			UpdateStudents(request, response);	
			break;
		default:
			listStudents(request, response);
		}
	}catch(Exception e) {
		throw new ServletException(e);
		}
	
	}
	
	protected void loadStudents(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int id = Integer.valueOf(request.getParameter("id"));
	
		try {

			Student tempstudent = student_model.dbUtil(id);

			request.setAttribute("student_list", tempstudent);
			
	
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		RequestDispatcher dispatcher =
				request.getRequestDispatcher("/update-student-form.jsp");
		  
			dispatcher.forward(request, response);
	}
	
	
	protected void UpdateStudents(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id = Integer.valueOf(request.getParameter("id"));
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String email= request.getParameter("eMail");
		
		Student student = new Student(id, firstName, lastName, email);
		
		try {
	
			student_model.UpdateStudent(student);

		}catch(Exception e) {
			e.printStackTrace();
		}
		response.sendRedirect(request.getContextPath()+"/student_servlet?command=LIST");
	}



	
	protected void addStudents(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//서블릿에 직접 출력해 테스트 해보기 위해 사용함
		//PrintWriter out = response.getWriter();
		//response.setContentType("text/plain");
			
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String email= request.getParameter("eMail");
				
		Student student = new Student(firstName, lastName, email);
		
		
		
		try {
			//out.print(firstName + lastName + email);
							
			//student_model.addStudent(firstName,lastName, email);
			student_model.addStudent(student);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		response.sendRedirect(request.getContextPath()+"/student_servlet?command=LIST");
	}

	protected void listStudents(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		//서블릿에 직접 출력해 테스트 해보기 위해 사용함
		//PrintWriter out = response.getWriter();
		//response.setContentType("text/plain");
		
		
		try {
			List<Student> students = student_model.getStudents();
			//out.print(students);
			request.setAttribute("student_list", students);

		}catch(Exception e) {
			e.printStackTrace();
		}

		RequestDispatcher dispatcher =
			request.getRequestDispatcher("/view_students_three.jsp");
	  
		dispatcher.forward(request, response);
	}
	
}
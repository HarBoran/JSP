package com.web.jdbc;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 * Servlet implementation class TestServlet
 */
@WebServlet("/TestServlet")
public class TestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Resource(name="jdbc/web_student_tracker")
	private DataSource dataSource;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter out = response .getWriter();
		response.setContentType("text/plain");
		
		Connection conn = null;
		Statement mySt = null;
		ResultSet myRs = null;
		
		try{
			conn = dataSource.getConnection();
			String sql = "SELECT * FROM student";
			mySt= conn.createStatement();
			myRs = mySt.executeQuery(sql);
					
			while(myRs.next()) {
				String showId = myRs.getString("id");
				String showFirstName = myRs.getString("first_name");
				String showLastName = myRs.getString("last_name");
				String showEmail = myRs.getString("email");
				out.println(showId +" "+ showFirstName +" "+ showLastName +" "+ showEmail);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}

package com.mvc.demo;

import java.util.List;
import java.util.ArrayList;

public class StudentDataUtil {
	
	public static List<Student> getStudents() {

	List<Student> students = new ArrayList<>();
	
	students.add(new Student("John","Doe","John@gamil.com"));
	students.add(new Student("MaxWell","Johnson","Maxwell@gmail.com"));
	students.add(new Student("Marry","Public","Marry@gmail.com"));

	return students;
	}		
}
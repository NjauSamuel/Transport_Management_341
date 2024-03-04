package net.javaguides.mvc.controller;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import net.javaguides.mvc.service.EmployeeService;

@WebServlet(name = "EmployeeServlet", urlPatterns = "/employees")

public class EmployeeServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private EmployeeService employeeService = null;

	public void init() {
		employeeService = new EmployeeService();
	}

	private void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("employees", employeeService.getEmployees());
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/employees.jsp");
		dispatcher.forward(request, response);
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}
}

package com.ondongne.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ondongne.action.Action;
import com.ondongne.action.UserSigninAction;
import com.ondongne.dto.ActionForward;

@WebServlet("*.users")
public class UsersFrontController extends HttpServlet
{
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
			request.setCharacterEncoding("UTF-8");
			String requestURI = request.getRequestURI();
			String contextPath = request.getContextPath();
			String command = requestURI.substring(contextPath.length());
			ActionForward forward = null;
			Action action = null;
			
			// 로그인 눌렀을때
			if(command.equals("/signin.users")) {
				action = new UserSigninAction();
				try {
					forward=action.execute(request, response);	
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
			
			// 회원가입 눌렀을때
			else if(command.equals("/signup.users")) {
				
			}
			
			if (forward != null) {		
				if (forward.isRedirect()) {		
					response.sendRedirect(forward.getPath());	
				} else {
					RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());	
					dispatcher.forward(request, response);
				}
				
			}
			
		}
	
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doProcess(request,response);
		} 
		
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doProcess(request,response);
		}
		
	
}

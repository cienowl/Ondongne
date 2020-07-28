package com.ondongne.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ondongne.action.Action;
import com.ondongne.dto.ActionForward;

@WebServlet("*.sell")
public class SellFrontController extends HttpServlet {
	
	public void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		request.setCharacterEncoding("UTF-8");
		
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		
		ActionForward forward = null;
		Action action = null;
		
//		navbar 에서 처음 들어오면 sell.jsp 페이지 보여줌 redirect
		if (command.equals("/view.sell")) {
//			TODO: DB에서 내용 가져와서 들고 가기
			forward = new ActionForward();
			forward.setPath("/sell.jsp");
		}

//		TODO: 글 등록 버튼 누르면 sellpostform.jsp 로 이동
		else if (command.equals("/postform.sell")) {
			forward = new ActionForward();
			forward.setPath("/sellPostForm.jsp");
		}
		
//		TODO: sellpostform.jsp 에서 submit 하면 action으로 가서 DB 저장
//		else if (command.equals("/submit.sell")))
		
		
		if (forward != null) {		//forward 내 값이 있으면
			if (forward.isRedirect()) {		//forward의 isRedirect() 값이 true 면
				response.sendRedirect(forward.getPath());	//forward객체에 새로 setting 된 경로로 이동, sendRedirect는 get, post 방식이 아니기때문에 @WebServlet 항목으로 결정
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());	//기존 path로 이동
				dispatcher.forward(request, response);
			}
			
		}
		
	}
	
	
	
	
	//action method 가 get 인 경우 doProcess 실행
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	}  	
	
	//action method 가 post 인 경우 doProcess 실행
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	}   

}

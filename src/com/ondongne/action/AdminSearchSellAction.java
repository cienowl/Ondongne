package com.ondongne.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ondongne.dto.ActionForward;
import com.ondongne.dto.DataTransferSell;
import com.ondongne.service.AdminService;

public class AdminSearchSellAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		ActionForward forward = null;
		
		if(session.getAttribute("adminId") != null) {
			
			String searchWord = (String) request.getParameter("search");
			AdminService adminService = new AdminService();
			
			// 검색한 sell 게시물 불러오기
			List<DataTransferSell> searchSellList = adminService.getSearchSell(searchWord);
			request.setAttribute("sellList", searchSellList);
			
			forward = new ActionForward();
			forward.setPath("admin_sell.jsp");
		}else {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("index.admin");
		}
		return forward;
	}

}

package com.ondongne.service;

import java.util.List;

import com.ondongne.dao.DataAccessCircle;
import com.ondongne.dao.DataAccessCircleJoin;
import com.ondongne.dto.DataTransferCircle;
import com.ondongne.dto.DataTransferCircleJoin;

public class CircleJoinService {
	
	// 참여버튼 눌렀을 때 참여게시물 "등록"
	public boolean joinCircle(DataTransferCircleJoin circleBean) throws Exception{
		
		boolean isWriteSuccess = false;
		
		DataAccessCircleJoin circleDao = DataAccessCircleJoin.getinstance();
		int insertCount = circleDao.joinCircleInsert(circleBean);
		
		// 게시물 입력값이 제대로 입력된경우
		if(insertCount>0) {
			isWriteSuccess = true;
		}
		return isWriteSuccess;
	}
	
}

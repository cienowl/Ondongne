package com.ondongne.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.ondongne.dto.DataTransferCircle;
import com.ondongne.dto.DataTransferCircleJoin;

public class DataAccessCircleJoin {
	
	private static DataAccessCircleJoin instance;
	public static DataAccessCircleJoin getInstance() {
		if (instance == null) {
			synchronized(DataAccessCircleJoin.class) {
				instance = new DataAccessCircleJoin();
			}
		}
		return instance;
	}
	
	static SqlSessionFactory sqlFactory;
	public static SqlSessionFactory getConnection() {
		Reader reader;
		
		try {
			reader = Resources.getResourceAsReader("com/ondongne/dbconnect/mybatis-config.xml");
			sqlFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return sqlFactory;
	}
	
	// 소모임 참여버튼을 눌렀을 때 insert
	public int joinCircleInsert(DataTransferCircleJoin dto) {
		sqlFactory = getConnection();
		SqlSession sqlsession = sqlFactory.openSession();
		
		int insertCount = sqlsession.insert("joinCircleInsert", dto);
		sqlsession.commit();
		sqlsession.close();
		
		return insertCount;
	}
	
	// 모든 참여게시물 출력 select
	public List<DataTransferCircle> selectJoinCircleAll(){
		sqlFactory = getConnection();
		SqlSession sqlsession = sqlFactory.openSession();
		
		List<DataTransferCircle> joinCircleList = sqlsession.selectList("getJoinCircleAll");
		
		return joinCircleList;
	}
	
	// 소모임 참여버튼 눌렀을 때 이미 참여한 게시물인지 check
	public int joinCircleCheck(DataTransferCircleJoin dto) {
		sqlFactory = getConnection();
		SqlSession sqlsession = sqlFactory.openSession();
		
		int joinCount = sqlsession.selectOne("getJoinCircleAll",dto);
		sqlsession.commit();
		sqlsession.close();
		
		return joinCount;
	}
	
	// 참여자가 소모임 참여 취소버튼을 눌렀을 때
	public int cancelJoinCircle(DataTransferCircleJoin dto) {
		sqlFactory = getConnection();
		SqlSession sqlsession = sqlFactory.openSession();
		
		int cancelCount = sqlsession.delete("cancelJoinCircle",dto);
		sqlsession.commit();
		sqlsession.close();
		
		return cancelCount;
	}
	
	// 참여버튼 눌렀을 때 현재까지 참여한 인원 
	public int joinCountMem(int join_postid) {
		sqlFactory = getConnection();
		SqlSession sqlsession = sqlFactory.openSession();
		
		int joinCount = sqlsession.selectOne("getJoinCount",join_postid);
		
		return joinCount;
	}
	
}

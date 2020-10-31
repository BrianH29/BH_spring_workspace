package com.kh.spring.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.board.model.vo.Board;
import com.kh.spring.common.model.vo.PageInfo;

//스프링에서 관리할 수 있게 bean으로 등록하기 
@Repository
public class BoardDao {

	public int selectListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("boardMapper.selectListCount"); 
	}
	
	public ArrayList<Board> selectList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit(); 
		
		RowBounds rowBounds = new RowBounds(offset,limit); 
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectList",null,rowBounds); 
	}
}

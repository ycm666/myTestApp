package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import vo.VisitVo;

public class VisitDao {
	
	
	SqlSession sqlSession;
	
	// setter injection
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	//���� �����ȸ
	public List<VisitVo> selectList() {

		List<VisitVo> list = null;
				
		//2.�۾�����(��û)
		list = sqlSession.selectList("visit_list");		
		
		return list;
	}

	//���� ����
	public int insert(VisitVo vo) {
		// TODO Auto-generated method stub
		int res = 0;
		
		//2.�۾�����
		res = sqlSession.insert("visit_insert", vo);
		
		return res;
	}

	public int delete(int idx) {
		// TODO Auto-generated method stub
		int res = 0;

		//2.�۾�����
		res = sqlSession.delete("visit_delete", idx);
		
		return res;
	}
	
	
	public int update(VisitVo vo) {
		// TODO Auto-generated method stub
		int res = 0;

		//2.�۾�����
		res = sqlSession.update("visit_update", vo);
		
		return res;
	}

	
	
	public VisitVo selectOne(int idx) {

		VisitVo vo = null;
		
		//2.�۾�����(��û)
		vo = sqlSession.selectOne("visit_one",idx);		
		
		return vo;
	}

	public List<VisitVo> selectList(VisitVo vo) {
		// TODO Auto-generated method stub
		List<VisitVo> list = null;
		
		//2.�۾�����(��û)
		list = sqlSession.selectList("visit_list_condition",vo);		

		return list;
	}
	
}

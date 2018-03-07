package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.MemberVo;

public class MemberDao {

	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	//회원목록조회
	public List<MemberVo> selectList() {

		List<MemberVo> list = null;
		
				
		list = sqlSession.selectList("member.member_list");
		
		return list;
	}

	public MemberVo selectOne(String id) {

		MemberVo vo = null;
		//                                                
				
		vo = sqlSession.selectOne("member.member_one_id",id);
		
		return vo;
	}
	
	public MemberVo selectOne(int idx) {

		MemberVo vo = null;
		
		vo = sqlSession.selectOne("member.member_one_idx",idx);
		
		return vo;
	}

	public int delete(int  idx) {
		// TODO Auto-generated method stub
		int res = 0;
				
		res = sqlSession.delete("member.member_delete",idx);
		
		
		return res;
	}

	public int insert(MemberVo vo) {
		// TODO Auto-generated method stub
		int res = 0;
				
		res = sqlSession.insert("member.member_insert",vo);
		
		return res;
	}
	
	public int update(MemberVo vo) {
		// TODO Auto-generated method stub
		int res = 0;
				
		res = sqlSession.update("member.member_update",vo);
		
		return res;
	}
	
	
}

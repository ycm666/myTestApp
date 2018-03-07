package com.increpas.vs;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import common.MyConstant;
import dao.MemberDao;
import vo.MemberVo;

@Controller
public class MemberController {

	MemberDao member_dao;

	public void setMember_dao(MemberDao member_dao) {
		this.member_dao = member_dao;
	}
	
	@RequestMapping("/member/list.do")
	public String member_list(Model model) {
		List list = member_dao.selectList();
		model.addAttribute("list",list);
		return MyConstant.Member.VEIW_PATH + "member_list";
	}
	
	@RequestMapping("/member/insert_form.do")
	public String insert_form() {
		
		return MyConstant.Member.VEIW_PATH + "member_insert_form";
	}
	
	@RequestMapping("/member/login_form.do")
	public String login_form() {
		
		return MyConstant.Member.VEIW_PATH + "member_login_form";
	}
	
	@RequestMapping("/member/login.do")
	public String login(
			           String id,
			           String pwd,
			           String url,
			           Model model,
			           HttpServletRequest request) {
		
		MemberVo user = member_dao.selectOne(id);
		//아이디 틀린경우
		if(user==null) {
			//response.sendRedirect("login_form.do?reason=id_fail");
			model.addAttribute("reason", "id_fail");
			return "redirect:login_form.do";
			//return;
		}
		
		//비밀번호가 틀린경우
		if(user.getPwd().equals(pwd)==false) {
			/*response.sendRedirect("login_form.do?reason=pwd_fail");
			return;*/
			model.addAttribute("reason", "pwd_fail");
			return "redirect:login_form.do";
		}
		
		//로그인정보를 세션에 저장
		HttpSession session = request.getSession();
		session.setAttribute("user", user);
		
		//System.out.println("url:" + url);
		//메인페이지 역할의 페이지 이동
		if( !url.isEmpty())
			return "redirect:" + url;
			//response.sendRedirect(url);
		else
		    //response.sendRedirect("../board/list.do");
			return "redirect:../board/list.do";

	}
	
	
}

package com.increpas.vs;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.VisitDao;
import mycommon.MyCommon;
import vo.VisitVo;

@Controller
public class VisitController {

	@Autowired
	HttpServletRequest request;
	
	VisitDao visit_dao;

	//setter injection
	public void setVisit_dao(VisitDao visit_dao) {
		this.visit_dao = visit_dao;
	}
	
	
	//���� ��Ϻ���
	@RequestMapping("/visit/list.do")
	public String list(Model model,String search,String search_text) {
		
		//�˻����� VO����
		VisitVo  vo = new VisitVo();
		if(search!=null) {
			if(search.equals("name_content")) {
				vo.setName(search_text);
				vo.setContent(search_text);
			}else if(search.equals("name")) {
				vo.setName(search_text);
			}else if(search.equals("content")) {
				vo.setContent(search_text);
			}
		}
		
		//���ϸ�� ��������
		List<VisitVo> list = visit_dao.selectList(vo);
		
		//model���� request binding
		model.addAttribute("list",list);
				
		return MyCommon.Visit.VIEW_PATH + "visit_list";
	}
	
	//�۾��� ������
	@RequestMapping("/visit/insert_form.do")
	public String insert_form() {
		return MyCommon.Visit.VIEW_PATH + "visit_insert_form";
	}
	
	//�۾���
	@RequestMapping("/visit/insert.do")
	public String insert(VisitVo vo) {
		
		//ip���ϱ�
		String ip = request.getRemoteAddr();
		
		//content������ \n => <br>
		String content = vo.getContent().replaceAll("\n", "<br>");
		vo.setContent(content);
		vo.setIp(ip);
		
		//DB Insert
		int res = visit_dao.insert(vo);
		
        // �̵���ų ������ : 
		// redirect:list.do => response.sendRedirect("list.do")		
		return "redirect:list.do";
	}
	
	//��й�ȣüũ�ϱ� : check_pwd.do?idx=12&c_pwd=1234
	@RequestMapping("/visit/check_pwd.do")
	@ResponseBody  // return���� ��λ������ ���� 
                   // �ٷ� ��ûŬ���̾�Ʈ���� �����ض�
	public String check_pwd(int idx,String c_pwd) {
		
		//idx�� �ش�Ǵ� vo
		VisitVo vo = visit_dao.selectOne(idx);
		
		String result = "diff";
		if(vo.getPwd().equals(c_pwd))//����?
			result = "same";
		
		return result;
	}
	
	
	@RequestMapping("/visit/delete.do")
	public String delete(int idx) {
		
		int res = visit_dao.delete(idx);
		
		return "redirect:list.do";
	}
	
	
	@RequestMapping("/visit/modify_form.do")
	public String modify_form(Model model, int idx) {
		
		VisitVo vo = visit_dao.selectOne(idx);
		String content = vo.getContent().replaceAll("<br>", "\n");
		vo.setContent(content);
		
		model.addAttribute("vo",vo);
				
		return  MyCommon.Visit.VIEW_PATH +"visit_modify_form";
	}
	
	@RequestMapping("/visit/modify.do")
	public String modify(VisitVo vo,HttpServletRequest request) {
		
		//\n => <br>����
		String content = vo.getContent().replaceAll("\n", "<br>");
		vo.setContent(content);
		String ip = request.getRemoteAddr();
		vo.setIp(ip);
		
		int res = visit_dao.update(vo);
		
		return "redirect:list.do";
	}
	
	
	
	
	
	
	
	
}

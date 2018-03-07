package com.increpas.vs;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import vo.PersonVo;

@Controller
public class JsonMakerController {

	
	@RequestMapping("/test/vo_to_json.do")
	@ResponseBody
	public PersonVo vo_to_json() {
		
		PersonVo p = new PersonVo("�ϱ浿", 30, "����� ���α�");
		
		return p;
	}
	
	
	@RequestMapping("/test/map_to_json.do")
	@ResponseBody
	public Map map_to_json() {
		
		Map map = new HashMap();
		
		map.put("name", "�ڱ浿");
		map.put("age", 20);
		
		Map telMap = new HashMap();
		telMap.put("home_tel", "02-123-4567");
		telMap.put("office_tel", "02-423-4567");
		telMap.put("cell_tel", "010-123-4567");
		
		map.put("tel", telMap);
		
		return map;
	}
	
	@RequestMapping("/test/list_to_json.do")
	@ResponseBody
	public List list_to_json() {
		
		List<PersonVo> list = new ArrayList<PersonVo>();
		
		list.add(new PersonVo("�浿1", 20, "���� ���α�"));
		list.add(new PersonVo("�浿2", 21, "���� ������"));
		list.add(new PersonVo("�浿3", 22, "���� ������"));
		list.add(new PersonVo("�浿4", 23, "���� ���ϱ�"));
		list.add(new PersonVo("�浿5", 24, "���� ������"));
				
		return list;
	}
	
	
}

package com.bobjo.admin.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.bobjo.admin.db.AdminDAO;
import com.bobjo.basicform.action.Action;
import com.bobjo.basicform.action.ActionForward;
import com.bobjo.member.db.MemberDTO;

public class LoadMemberTableAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println(" M : LoadMemberTableAction_execute 호출 ");
		
		
		AdminDAO dao = new AdminDAO();
		
		
		List<MemberDTO> memberList = dao.viewMember();
		
		JSONArray jsarr = new JSONArray();
		JSONObject obj;
		
		for (MemberDTO dto : memberList) {
			obj = new JSONObject();
			
			obj.put("m_id", dto.getM_id());
			obj.put("pw", dto.getPw());
			obj.put("m_name", dto.getM_name());
			obj.put("phone", dto.getPhone());
			obj.put("nickname", dto.getNickname());
			obj.put("email", dto.getEmail());
			obj.put("point", dto.getPoint());
			obj.put("ceo_num", dto.getCeo_num());
			obj.put("alcohol_level", dto.getAlcohol_level());
			
			jsarr.add(obj);
		}
		
		String json = jsarr.toString();

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);
		
		return null;
	}

}

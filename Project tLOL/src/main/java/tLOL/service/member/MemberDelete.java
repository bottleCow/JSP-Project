package tLOL.service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tLOL.dao.MemberDao;
import tLOL.service.CommandProcess;

public class MemberDelete implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
	    if (session == null || session.getAttribute("member_num") == null ) {
	    	return "../sessionChk";
	    }
	 
		String member_id = (String)session.getAttribute("member_id");
		
		MemberDao md = MemberDao.getInstance();
		if (member_id != null) {
			int result = md.delete(member_id);
			if (result > 0) session.invalidate();
			request.setAttribute("result", result);
		}
		return "memberDelete";
	}
}

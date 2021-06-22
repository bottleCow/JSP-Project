package tLOL.service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import tLOL.dao.MemberDao;
import tLOL.service.CommandProcess;

public class MemberOutAction implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {	
		int result = 0;	
		if(request.getParameterValues("chk_member_id") == null) {
			request.setAttribute("result", result);
			return "memberOut";
		}
		
		String[] member_id = request.getParameterValues("chk_member_id");
		MemberDao md = MemberDao.getInstance();
		for(String m : member_id) {
			if (md.chkMember(m).equals("n")) {
				md.delete(m);
				result += 1;
			}
		}
		request.setAttribute("result", result);
		return "memberOut";
	}
}

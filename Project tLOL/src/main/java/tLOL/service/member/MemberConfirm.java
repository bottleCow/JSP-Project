package tLOL.service.member;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tLOL.dao.MemberDao;
import tLOL.model.Member;
import tLOL.service.CommandProcess;
public class MemberConfirm implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String member_id = request.getParameter("member_id");
		
		MemberDao md = MemberDao.getInstance();
		Member member  = md.select(member_id);
		
		String msg  = "";
		if (member == null) msg = "사용 가능한 아이디입니다";
		else msg = "이미 사용중인 아이디입니다";
		
		request.setAttribute("msg", msg);
		
		return "memberConfirm";
	}
}
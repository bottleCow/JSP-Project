package tLOL.service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tLOL.dao.MemberDao;
import tLOL.model.Member;
import tLOL.service.CommandProcess;

public class MemberUpdateForm implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
				HttpSession session = request.getSession();
				String member_id = (String)session.getAttribute("member_id");
				MemberDao md = MemberDao.getInstance();
				// updateForm이 아닌곳에서도 session check하기 
				if (member_id != null) {
				Member member = md.select(member_id);
				request.setAttribute("member", member);
				}
		return "memberUpdateForm"; //updateForm.jsp에 member값 전달
	}
}

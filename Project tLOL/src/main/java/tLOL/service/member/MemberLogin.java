package tLOL.service.member;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tLOL.dao.MemberDao;
import tLOL.model.Member;
import tLOL.service.CommandProcess;
public class MemberLogin implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String referer = request.getParameter("referer"); // 이전 페이지
		String member_id = request.getParameter("member_id");
		String member_pw = request.getParameter("member_pw");
		
		MemberDao md = MemberDao.getInstance();
		Member member = md.select(member_id);
		
		int result = 0;
		// member 테이블 del컬럼 값이 y일때도 포함하기, y=yes n=no
		if (member == null || member.getMember_del().equals("y")) {
			result = -1;
		}
		else {
			if (member.getMember_pw().equals(member_pw)) {
				HttpSession session = request.getSession();
				session.setAttribute("member_id", member_id);
				session.setAttribute("member_num", member.getMember_num());
				session.setAttribute("member_nickname", member.getMember_nickname());
				session.setAttribute("member_admin", member.getMember_admin());
				
				if(member.getMember_admin() == 0) {
					result = 1;
				} else if(member.getMember_admin() == 1 ) {
					result = 2;
				}
			}
		}
		
		request.setAttribute("result", result);
		request.setAttribute("referer",referer);
		
		return "login";
	}

}

package tLOL.service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tLOL.service.CommandProcess;

public class MemberLogOut implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		session.invalidate();
		String referer = request.getHeader( "REFERER"); // 이전 페이지
		referer = referer.replaceAll("Boards/myComment.do.*", "main.jsp"); // 내 댓글 보기에서 로그아웃하면 메인으로
		referer = referer.replaceAll("Boards/myArticle.do.*", "main.jsp"); // 내 글 보기에서 로그아웃하면 메인으로
		request.setAttribute("referer", referer);
		return "logout";
	}

}

package tLOL.service.member;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tLOL.service.CommandProcess;
public class MemberLoginForm implements CommandProcess{
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String referer = request.getHeader("REFERER"); // 이전 페이지
		referer = referer.replace("Member/join.do", "main.jsp"); // 만약 회원 가입화면에서 넘어온 경우메인화면으로 보내준다
		
		request.setAttribute("referer", referer);
		
		return "loginForm";
	}
}
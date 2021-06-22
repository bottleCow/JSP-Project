package tLOL.service.member;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tLOL.service.CommandProcess;
public class MemberJoinForm implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		return "joinForm";
	}
}
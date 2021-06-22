package tLOL.service.comment;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tLOL.dao.CommentDao;
import tLOL.service.CommandProcess;

public class CommentRecom implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		if (session == null || session.getAttribute("member_num") == null ) {
	    	return "../sessionChk";
	    }

		int board_num = Integer.parseInt(request.getParameter("board_num"));
		int article_num = Integer.parseInt(request.getParameter("article_num"));
		int comment_num = Integer.parseInt(request.getParameter("comment_num"));
		String pageNum = request.getParameter("pageNum");
		int member_num = (int) session.getAttribute("member_num");
		
		CommentDao cd = CommentDao.getInstance();
		int result = cd.addRecom(board_num, article_num, comment_num, member_num);
		
		request.setAttribute("result", result);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("board_num", board_num);
		request.setAttribute("article_num", article_num);
		return "commentRecomResult";
	}
}

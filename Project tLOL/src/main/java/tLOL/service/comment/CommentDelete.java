package tLOL.service.comment;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tLOL.dao.CommentDao;
import tLOL.service.CommandProcess;

public class CommentDelete implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int comment_num = Integer.parseInt(request.getParameter("comment_num"));
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		int article_num = Integer.parseInt(request.getParameter("article_num"));
		String pageNum = request.getParameter("pageNum");
		
		CommentDao cd = CommentDao.getInstance();
		int result = cd.delete(comment_num);
		
		request.setAttribute("result", result);
		request.setAttribute("comment_num", comment_num);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("board_num", board_num);
		request.setAttribute("article_num", article_num);
		
		return "commentResult";
	}

}

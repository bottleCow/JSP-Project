package tLOL.service.article;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tLOL.dao.ArticleDao;
import tLOL.service.CommandProcess;

public class ArticleUpdate implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
	    if (session == null || session.getAttribute("member_num") == null ) {
	    	return "../sessionChk";
	    }
	    
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		int article_num = Integer.parseInt(request.getParameter("article_num"));
		String pageNum = request.getParameter("pageNum");
		
		String article_title = request.getParameter("article_title");
		String article_content = request.getParameter("article_content");
		
		ArticleDao ad = ArticleDao.getInstance();
		int result = ad.update(article_num, board_num, article_title, article_content);
		
		request.setAttribute("result", result);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("board_num", board_num);
		request.setAttribute("article_num", article_num);
		
		return "articleUpdate";
		
	}

}

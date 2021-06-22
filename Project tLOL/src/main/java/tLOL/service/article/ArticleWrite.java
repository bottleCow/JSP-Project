package tLOL.service.article;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tLOL.dao.ArticleDao;
import tLOL.model.Article;
import tLOL.service.CommandProcess;

public class ArticleWrite implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
	    if (session == null || session.getAttribute("member_num") == null ) {
	    	return "../sessionChk";
	    }
		// getParameter로 writeForm.jsp에서 정보를 받는다
		// mybatis 구현하고 -> content, boardAction 참고
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		String pageNum = request.getParameter("pageNum");
		
		
		String article_title = request.getParameter("article_title");
		String article_content = request.getParameter("article_content");
		int member_num = Integer.parseInt(request.getParameter("member_num"));
		
		Article article = new Article();
		article.setBoard_num(board_num);
		article.setArticle_title(article_title);
		article.setArticle_content(article_content);
		article.setMember_num(member_num);

		ArticleDao ad = ArticleDao.getInstance();
		int result = ad.insert(article);
		
		request.setAttribute("result", result);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("board_num", board_num);
		
		return "articleWrite";
	}

}

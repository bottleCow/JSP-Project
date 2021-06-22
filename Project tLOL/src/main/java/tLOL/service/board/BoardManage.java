package tLOL.service.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tLOL.dao.ArticleDao;
import tLOL.dao.BoardDao;
import tLOL.model.Article;
import tLOL.service.CommandProcess;

public class BoardManage implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		if (session == null || session.getAttribute("member_id") == null) {
	    	return "../sessionChk";
	    }
	    if ((int)session.getAttribute("member_admin") == 0)
	    	return "../sessionChk";
		
		final int ROW_PER_PAGE = 10;
		final int PAGE_PER_BLOCK = 10;
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null || pageNum.equals(""))
			pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);		
		ArticleDao ad = ArticleDao.getInstance();
		int total = ad.getManageTotal();	
		int startRow = (currentPage - 1) * ROW_PER_PAGE + 1;
		int endRow = startRow + ROW_PER_PAGE - 1;
		int number = total - startRow + 1;
		int totalPage = (int) Math.ceil((double) total / ROW_PER_PAGE);
		int startPage = currentPage - (currentPage - 1) % PAGE_PER_BLOCK;
		int endPage = startPage + PAGE_PER_BLOCK - 1;
		if (endPage > totalPage)
			endPage = totalPage;		
		List<Article> list = ad.manageList(startRow, endRow);	
		request.setAttribute("list", list);
		request.setAttribute("PAGE_PER_BLOCK", PAGE_PER_BLOCK);
		request.setAttribute("number", number);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("totalPage", totalPage);		
		return "manageArticle";				
	}
}
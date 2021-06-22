package tLOL.service.main;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tLOL.dao.ArticleDao;
import tLOL.model.Article;
import tLOL.service.CommandProcess;

public class MainAction implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {

		ArticleDao ar = ArticleDao.getInstance();
		List<Article> hotList = ar.hotList();  //최근 글 중 추천수대로 hotList로 가져옴

		for(Article a : hotList) {
			String content = a.getArticle_content();
			int s_start = content.indexOf("<img");
			if(s_start >=0) {
				int s_end = content.indexOf(">", s_start) + 1;
				a.setArticle_content(content.substring(s_start, s_end));
			}
			else
				a.setArticle_content("");
		}
		
		request.setAttribute("hotList", hotList);
		
		return "main";
	}
}

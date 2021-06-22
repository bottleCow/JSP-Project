package tLOL.dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import tLOL.model.Article;

public class ArticleDao {
	private static ArticleDao instance = new ArticleDao();
	private ArticleDao() {}
	public static ArticleDao getInstance() {
		return instance;
	}

	private static SqlSession session;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
			session = ssf.openSession(true);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	@SuppressWarnings("unchecked") // 게시판 글 불러오기
	public List<Article> list(int startRow, int endRow, int board_num) {
		Map<String, Integer> parms = new HashMap<String, Integer>();
		parms.put("board_num", board_num);
		parms.put("startRow", startRow);
		parms.put("endRow", endRow);
		return session.selectList("articlens.selectList", parms);
	}
	@SuppressWarnings("unchecked") // 내가 쓴 글 불러오기
	public List<Article> myList(int startRow, int endRow, int member_num) {
		Map<String, Integer> parms = new HashMap<String, Integer>();
		parms.put("member_num", member_num);
		parms.put("startRow", startRow);
		parms.put("endRow", endRow);
		return session.selectList("articlens.selectMyList", parms);
	}

	@SuppressWarnings("unchecked")
	public List<Article> searchList(int startRow, int endRow, int board_num, String keyword) {
		Map<String, Object> parms = new HashMap<String, Object>();
		parms.put("board_num", board_num);
		parms.put("keyword", "'%" + keyword + "%'");
		parms.put("startRow", startRow);
		parms.put("endRow", endRow);
		return session.selectList("articlens.selectSearchList", parms);
	}
	public int getTotal(int board_num) {
		return (int) session.selectOne("articlens.total", board_num);
	}
	public void readcountUpdate(int article_num, int board_num) {
		Map<String, Integer> parms = new HashMap<String, Integer>();
		parms.put("board_num", board_num);
		parms.put("article_num", article_num);
		session.update("articlens.readcount", parms);		
	}
	public Article select(int article_num, int board_num) {
		Map<String, Integer> parms = new HashMap<String, Integer>();
		parms.put("board_num", board_num);
		parms.put("article_num", article_num);
		return (Article) session.selectOne("articlens.select", parms);	
	}
	public int getMyTotal(int member_num) {
		return (int) session.selectOne("articlens.myTotal", member_num);
	}

	public int getSearchTotal(int board_num, String keyword) {
		Map<String, Object> parms = new HashMap<String, Object>();
		parms.put("board_num", board_num);
		parms.put("keyword", "'%" + keyword + "%'");
		return (int) session.selectOne("articlens.searchTotal", parms);
	}
	public int insert(Article article) {
    return session.insert("articlens.insert", article);
  }
	public int update(int article_num, int board_num, String article_title, String article_content) {
		Map<String, Object> parms = new HashMap<String, Object>();
		parms.put("board_num", board_num);
		parms.put("article_num", article_num);
		// 작성일 가져오기
		Article article = (Article) session.selectOne("articlens.select", parms);	
		// 삭제하기
		session.delete("articlens.deleteForUpdate", parms);

		// 재입력	
		article.setArticle_title(article_title);
		article.setArticle_content(article_content);
		return session.insert("articlens.update", article);
	}
	public int delete(int article_num, int board_num) {
		Map<String, Object> parms = new HashMap<String, Object>();
		parms.put("board_num", board_num);
		parms.put("article_num", article_num);
		return session.update("articlens.delete", parms);
	}
	public int getSearchAllTotal(String keyword) {
		Map<String, Object> parms = new HashMap<String, Object>();
		parms.put("keyword", "'%" + keyword + "%'");
		return (int) session.selectOne("articlens.searchAllTotal", parms);
	}
	@SuppressWarnings("unchecked")
	public List<Article> searchAllList(int startRow, int endRow, String keyword) {
		Map<String, Object> parms = new HashMap<String, Object>();
		parms.put("keyword", "'%" + keyword + "%'");
		parms.put("startRow", startRow);
		parms.put("endRow", endRow);
		return session.selectList("articlens.selectSearchAllList", parms);
	}
	public int getManageTotal() {
		return (int) session.selectOne("articlens.manageTotal");
	}
	@SuppressWarnings("unchecked")
	public List<Article> manageList(int startRow, int endRow) {
		Map<String, Integer> parms = new HashMap<String, Integer>();
		parms.put("startRow", startRow);
		parms.put("endRow", endRow);
		return session.selectList("articlens.selectManageList", parms);
	}
	public int addRecom(int board_num, int article_num, int member_num) {
		Map<String, Integer> parms = new HashMap<String, Integer>();
		parms.put("board_num", board_num);
		parms.put("article_num", article_num);
		parms.put("member_num", member_num);
		if(session.selectOne("articlens.findRecom", parms) != null) {
			return 0;
		} else {
			session.insert("articlens.addRecom", parms);
			return 1;
		}
	}
	@SuppressWarnings("unchecked")
	public List<Article> hotList() {
		return session.selectList("articlens.hotList");
	}
}
package tLOL.dao;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import tLOL.model.Member;
public class MemberDao {
	// singleton
	private static MemberDao instance = new MemberDao();
	private MemberDao() {}
	public static MemberDao getInstance() {
		return instance;
	}
	private static SqlSession session;
		static {
			try {
				Reader reader = Resources.getResourceAsReader("configuration.xml");
				SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
				// true해야 입력/수정/삭제한 후에 commit실행
				session = ssf.openSession(true);
			}catch (Exception e) {
				System.out.println(e.getMessage());
			}
	}
	public Member select(String member_id) {
		return (Member) session.selectOne("memberns.select", member_id);
	}
	public int insert(Member member) {
		return session.insert("memberns.insert", member);
	}
	public int update(Member member) {
		return session.update("memberns.update", member);
	}
	public int delete(String member_id) {
		return session.update("memberns.delete", member_id);
	}
	public int restore(String member_id) {
		return session.update("memberns.restore", member_id);
	}
	public int getTotal() {
		return (int) session.selectOne("memberns.total");
	}
	public String chkMember(String member_id) {
		return (String) session.selectOne("memberns.chkMember", member_id);
	}
	@SuppressWarnings("unchecked")
	public List<Member> memberList(int startRow, int endRow) {
		Map<String, Integer> parms = new HashMap<String, Integer>();
		parms.put("startRow", startRow);
		parms.put("endRow", endRow);
		return session.selectList("memberns.memberList", parms);
	}
}


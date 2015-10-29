package board;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

public class BoardDao {

	protected Log log = LogFactory.getLog(this.getClass());

	// @Autowired
	@Autowired(required = false) // 필수가 아닌경우 등록 안하게 설정
	@Qualifier("defultTemplate") // 는 타입으로(by type) 찿아줌. 똑같은 클래스가
	// 있을경우CommonService1 라는 구분값으로 찿음
	// @Resource(name="testDao") //는 이름으로(by name) 찿아줌
	private SqlSessionTemplate sql;

	public List<UserVO> userList(UserVO vo) {
		List<UserVO> list = sql.selectList("defult.userList", vo);
		return list;
	}

	public List<BoardVO> boardList(BoardVO vo) {
		List<BoardVO> list = sql.selectList("defult.boardList", vo);
		return list;
	}

	public List<ReplyVO> replyList(ReplyVO vo) {
		List<ReplyVO> list = sql.selectList("defult.replyList", vo);
		return list;
	}

	public int userInsert(UserVO vo) {
		int result = sql.insert("defult.userInsert", vo);
		return result;
	}

	public int boardInsert(BoardVO vo) {
		int result = sql.insert("defult.boardInsert", vo);
		return result;
	}

	public int replyInsert(ReplyVO vo) {
		int result = sql.insert("defult.replyInsert", vo);
		return result;
	}

	public int userUpdate(UserVO vo) {
		int result = sql.update("defult.userUpdate", vo);
		return result;
	}

	public int boardUpdate(BoardVO vo) {
		int result = sql.update("defult.boardUpdate", vo);
		return result;
	}

	public int replyUpdate(ReplyVO vo) {
		int result = sql.update("defult.replyUpdate", vo);
		return result;
	}
}
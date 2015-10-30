package board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class BoardService {

	protected Log log = LogFactory.getLog(this.getClass());

	@Autowired
	// @Qualifier("CommonDao1")
	private BoardDao dao;

	public List<BoardVO> boardList(Map<String, String> map) {
		// TODO Auto-generated method stub
		log.debug("boardList");
		List<BoardVO> list =dao.boardList(map);
		return list;
	}

	public int boardListCount(Map<String, String> map) {
		// TODO Auto-generated method stub
		log.debug("boardListCount");
		int count= dao.boardListCount(map);
		return count;
	}
}

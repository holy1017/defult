package first;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("FirstDAO")
public class FirstDAO extends AbstractDAO {
	
	//@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("First.selectBoardList", map);
	}

	public void insertBoard(Map<String, Object> map) {
		// TODO Auto-generated method stub
		insert("First.insertBoard", map);
	}

	public void updateHitCnt(Map<String, Object> map) throws Exception {
		update("First.updateHitCnt", map);
	}

	// @SuppressWarnings("unchecked")
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("First.selectBoardDetail", map);
	}

	public void updateBoard(Map<String, Object> map) throws Exception {
		update("First.updateBoard", map);
	}

	public void deleteBoard(Map<String, Object> map) throws Exception {
		update("First.deleteBoard", map);
	}
}

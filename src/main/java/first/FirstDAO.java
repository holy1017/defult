package first;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("FirstDAO")
public class FirstDAO extends AbstractDAO{
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("First.selectBoardList", map);
	}
}

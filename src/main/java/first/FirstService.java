package first;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("FirstService")
public class FirstService {

	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "FirstDAO")
	private FirstDAO dao;

	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception {
		return dao.selectBoardList(map);
	}

	public void insertBoard(Map<String, Object> map) throws Exception {
		dao.insertBoard(map);
	}

	public Map<String, Object> selectBoardDetail(Map<String, Object> map)throws Exception {
		// TODO Auto-generated method stub
		dao.updateHitCnt(map);
		Map<String, Object> resultMap = dao.selectBoardDetail(map);
		return resultMap;
	}
	public void updateBoard(Map<String, Object> map) throws Exception{
		dao.updateBoard(map);
	}
}

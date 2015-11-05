package first;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Service("FirstService")
public class FirstService {

	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "FirstDAO")
	private FirstDAO dao;

	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception {
		return dao.selectBoardList(map);
	}

	public void insertBoard(Map<String, Object> map, HttpServletRequest request) throws Exception {
		dao.insertBoard(map);

		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		MultipartFile multipartFile = null;
		while (iterator.hasNext()) {
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			if (multipartFile.isEmpty() == false) {
				log.debug("------------- file start -------------");
				log.debug("name : " + multipartFile.getName());
				log.debug("filename : " + multipartFile.getOriginalFilename());
				log.debug("size : " + multipartFile.getSize());
				log.debug("-------------- file end --------------\n");
			}
		}
	}

	public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		dao.updateHitCnt(map);
		Map<String, Object> resultMap = dao.selectBoardDetail(map);
		return resultMap;
	}

	public void updateBoard(Map<String, Object> map) throws Exception {
		dao.updateBoard(map);
	}

	public void deleteBoard(Map<String, Object> map) throws Exception {
		dao.deleteBoard(map);
	}
}

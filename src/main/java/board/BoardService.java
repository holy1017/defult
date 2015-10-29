package board;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;



public class BoardService {

	protected Log log = LogFactory.getLog(this.getClass());

	@Autowired
	// @Qualifier("CommonDao1")
	private BoardDao dao;
}

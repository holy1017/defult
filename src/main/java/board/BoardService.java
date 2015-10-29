package board;

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
}

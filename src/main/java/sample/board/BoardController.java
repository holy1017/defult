package sample.board;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "/Board/*", method = RequestMethod.GET)
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	// @Autowired(required=false)//필수가 아닌경우 빈으로 등록 안하게 설정
	// @Qualifier("CommonService1")//는 타입으로(by type) ?아줌. 똑같은 클래스가 있을경우
	// CommonService1 라는 구분값으로 ?음
	// @Resource(name="testDao") //는 이름으로(by name) ?아줌
	private BoardService svc;
	
	
	
	/**
	 * http://localhost:8080/defult/sample/Board/BoardList
	 * mvc 테스트
	 * @param locale
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/BoardList", method = RequestMethod.GET)
	//@ResponseBody
	public String BoardList(Model model) {
		
		logger.info("BoardList");		
		
		List<BoardVO> list=svc.boardList();
		
		model.addAttribute("BoardList", list);
		
		return "BoardList";
	}
	
}

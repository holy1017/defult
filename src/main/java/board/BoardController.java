package board;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Handles requests for the application home page.
 */
@Controller
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	private final Logger log = LoggerFactory.getLogger(this.getClass());

	@Autowired
	// @Autowired(required=false)//필수가 아닌경우 빈으로 등록 안하게 설정
	// @Qualifier("CommonService1")//는 타입으로(by type) ?아줌. 똑같은 클래스가 있을경우
	// CommonService1 라는 구분값으로 ?음
	// @Resource(name="testDao") //는 이름으로(by name) ?아줌
	private BoardService svc;

	/**
	 * 기본 경로 테스트
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	// @ResponseBody
	public String sample(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "main";
	}

	@RequestMapping(value = "/boardList", method = RequestMethod.GET)
	public String boardList(
			Model model,
			@RequestParam(value = "BoardVO", required = false) BoardVO bvo,
			@RequestParam("pageNum") int pageNum) {

		log.debug("boardList");

		HashMap<String, String> map = new HashMap<String, String>();

		int totalRowCount = svc.boardListCount(map);
		PageUtil pu = new PageUtil(pageNum, totalRowCount, 10, 10);

		map.put("startNum", String.valueOf(pu.getStartRow()));
		map.put("endNum", String.valueOf(pu.getEndRow()));

		List<BoardVO> list = svc.boardList(map);

		model.addAttribute("list", list);
		model.addAttribute("startPageNum", pu.getStartPageNum());
		model.addAttribute("endPageNum", pu.getEndPageNum());
		model.addAttribute("totalPageCount", pu.getTotalPageCount());
		model.addAttribute("pageNum", pageNum);

		return "boardList";
	}

}

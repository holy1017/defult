package first;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FirstController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "FirstService")
	private FirstService service;

	/**
	 * http://localhost:8080/defult/first/openSampleBoardList
	 * 게시판 목록
	 * 
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/openSampleBoardList")
	public ModelAndView openSampleBoardList(Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("boardList");

		List<Map<String, Object>> list = service.selectBoardList(commandMap);
		mv.addObject("list", list);

		return mv;
	}
}

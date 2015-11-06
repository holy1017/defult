package first;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import common.utill.UtilsEmpty;
import common.utill.UtilsUUID;

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
	@RequestMapping(value = "/openBoardList")
	public ModelAndView openBoardList(Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("boardList");

		List<Map<String, Object>> list = service.selectBoardList(commandMap);
		mv.addObject("list", list);

		return mv;
	}

	/**
	 * http://localhost:8080/defult/first/testMapArgumentResolver?aaa=value1&bbb
	 * =value2
	 * 
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/testMapArgumentResolver")
	public ModelAndView testMapArgumentResolver(CommandMap commandMap) throws Exception {
		log.debug("testMapArgumentResolver");

		ModelAndView mv = new ModelAndView("");

		if (commandMap.isEmpty() == false) {
			Iterator<Entry<String, Object>> iterator = commandMap.getMap().entrySet().iterator();
			Entry<String, Object> entry = null;
			while (iterator.hasNext()) {
				entry = iterator.next();
				log.debug("key : " + entry.getKey() + ", value : " + entry.getValue());
			}
		}
		return mv;
	}

	@RequestMapping(value = "/openBoardWrite")
	public String openBoardWrite(CommandMap commandMap, HttpSession session) throws Exception {
		log.debug("openBoardWrite");

		session.setAttribute("CSRF_TOKEN", UtilsUUID.getRandomString());
		log.debug("CSRF_TOKEN:" + session.getAttribute("CSRF_TOKEN"));

		return "boardWrite";
		// ModelAndView mv = new ModelAndView("boardWrite");

		// return mv;

	}

	/**
	 * 실제로 글쓴 내용을 디비에 저장
	 * 
	 * @param commandMap
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/insertBoard", method = RequestMethod.POST)
	public ModelAndView insertBoard(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:openBoardList");

		service.insertBoard(commandMap.getMap(), request);

		return mv;
	}

	@RequestMapping(value = "/insertBoard")
	public String insertBoardNotPost(CommandMap commandMap, HttpServletRequest request,RedirectAttributes redirect) throws Exception {
//		request.setAttribute("msg", "잘못된 요청 방법 입니다.");//리다이랙트로는 안넘어감
		redirect.addFlashAttribute("msg", "잘못된 요청 방법 입니다.");
//		redirect.addFlashAttribute("param1", "나의파람");
//		redirect.addFlashAttribute("param2", "나의파람2");
		return "redirect:openBoardList";
	}

	@RequestMapping(value = "/openBoardDetail")
	public ModelAndView openBoardDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("boardDetail");

		Map<String, Object> map = service.selectBoardDetail(commandMap.getMap());
		mv.addObject("map", map.get("map"));// 기존 상세글
		// log.debug(map.get("list")==null);
		// log.debug(map.get("list").equals(""));
		log.debug(UtilsEmpty.isEmpty(map.get("list")));

		if (!UtilsEmpty.isEmpty(map.get("list")))
			mv.addObject("list", map.get("list"));// 첨부파일 목록

		return mv;
	}

	@RequestMapping(value = "/openBoardUpdate")
	public ModelAndView openBoardUpdate(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("boardUpdate");

		Map<String, Object> map = service.selectBoardDetail(commandMap.getMap());
		mv.addObject("map", map);

		return mv;
	}

	@RequestMapping(value = "/updateBoard")
	public ModelAndView updateBoard(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:openBoardDetail");

		service.updateBoard(commandMap.getMap());

		mv.addObject("IDX", commandMap.get("IDX"));
		return mv;
	}

	@RequestMapping(value = "/deleteBoard")
	public ModelAndView deleteBoard(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:openBoardList");

		service.deleteBoard(commandMap.getMap());

		return mv;
	}
}

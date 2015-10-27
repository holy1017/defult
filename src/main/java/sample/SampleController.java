package sample;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class SampleController {
	
	private static final Logger logger = LoggerFactory.getLogger(SampleController.class);
	
	@Autowired
	// @Autowired(required=false)//필수가 아닌경우 빈으로 등록 안하게 설정
	// @Qualifier("CommonService1")//는 타입으로(by type) ?아줌. 똑같은 클래스가 있을경우
	// CommonService1 라는 구분값으로 ?음
	// @Resource(name="testDao") //는 이름으로(by name) ?아줌
	private SampleService svc;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String sample(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "sample";
	}
	@RequestMapping(value = "/sample", method = RequestMethod.GET)
	public String sampleController(Locale locale, Model model) {
		
		logger.info("sampleController");		
		
		return svc.sampleService(locale,model);
	}
	
	
}

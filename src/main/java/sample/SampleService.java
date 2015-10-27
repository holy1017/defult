package sample;

import java.text.DateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.Locale;

import javax.activation.CommandMap;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Service
// @Service("CommonService1")
public class SampleService {

	protected Log log = LogFactory.getLog(this.getClass());
	
	@Autowired
	// @Qualifier("CommonDao1")
	private SampleDao dao;

	public String sampleService(Locale locale, Model model) {
		
		log.debug("sampleService");
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );	
		
		return dao.sampleDAO();		
	}

}

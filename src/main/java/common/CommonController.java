package common;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import common.utill.UtilsFile;
import first.CommandMap;

@Controller
@RequestMapping(value = "/common/")
public class CommonController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "commonService")
	private CommonService commonService;

	@Resource(name = "fileUtils")
	private UtilsFile fileUtils;
	
	@RequestMapping(value = "downloadFile")
	public void downloadFile(CommandMap commandMap, HttpServletResponse response) throws Exception {
		Map<String, Object> map = commonService.selectFileInfo(commandMap.getMap());
		String storedFileName = (String) map.get("STORED_FILE_NAME");
		String originalFileName = (String) map.get("ORIGINAL_FILE_NAME");

		fileUtils.readFile(response, storedFileName, originalFileName);
	}

	
}

package common.utill;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;

import com.nhncorp.lucy.security.xss.XssFilter;

import common.logger.LoggerInterceptor;

public class LucyXss {
	protected Log log = LogFactory.getLog(LoggerInterceptor.class);

	public String doDefult(String str) {
		XssFilter filter = XssFilter.getInstance("lucy-xss.xml");
		return filter.doFilter(str);
	}

	public String doSuperset(String str) {
		XssFilter filter = XssFilter.getInstance("lucy-xss-superset.xml");
		return filter.doFilter(str);
	}

	public String doFileSet(String str, String xmlFile) {
		XssFilter filter = XssFilter.getInstance(xmlFile);
		return filter.doFilter(str);
	}
}

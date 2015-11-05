package first;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("FirstService")
public class FirstService {


    Logger log = Logger.getLogger(this.getClass());
     
    @Resource(name="FirstDAO")
    private FirstDAO dvo;
     
    public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception {
        return dvo.selectBoardList(map);
    }
 
}
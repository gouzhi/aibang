import java.io.IOException;

import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.aibang.business.api.system.user.AbUserService;

@RunWith(SpringJUnit4ClassRunner.class)  
@ContextConfiguration(locations ={ "classpath*:/applicationContext.xml", "classpath*:/applicationContext-dubbo.xml","classpath*:/applicationContext-activemq.xml","classpath*:applicationContext-myBatis.xml" })
public class AppTest {
	
	@Autowired
	public AbUserService abUserService;
	
	
	@Test
	public void test() throws JsonParseException, JsonMappingException, IOException{
		abUserService.deleteById(6666);
	}

}
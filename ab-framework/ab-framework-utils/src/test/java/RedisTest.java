import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.aibang.framework.utils.redis.SpringRedisCacheService;
@RunWith(SpringJUnit4ClassRunner.class)  
@ContextConfiguration(locations = {"classpath:/spring/applicationContext.xml" })
public class RedisTest {
	@Autowired
	private SpringRedisCacheService redisService;
	@Test
	public void set(){
		redisService.set("bbb", 100);
	}
	@Test
	public void test(){
		System.out.println("-------------");
		System.out.println("-------------");
//		System.out.println(redisService.incr("bbb"));
		System.out.println("-------------");
		System.out.println("-------------");
	}
	
}

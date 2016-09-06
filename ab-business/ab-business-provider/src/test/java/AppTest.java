import java.io.IOException;
import java.util.Date;

import javax.annotation.Resource;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.aibang.business.api.system.user.AbUserService;
import com.aibang.business.api.user.user.UserService;
import com.aibang.business.api.user.user.UsersInfoService;
import com.aibang.framework.utils.ip.Utils;
import com.aibang.framework.utils.validate.ValidateUtils;
import com.aibang.transfer.model.dto.AbUser;
import com.aibang.transfer.model.dto.AbUserBase;
import com.aibang.transfer.model.dto.AbUsersInfo;


@RunWith(SpringJUnit4ClassRunner.class)  
@ContextConfiguration(locations ={ "classpath*:/applicationContext.xml", "classpath*:/applicationContext-dubbo.xml","classpath*:/applicationContext-activemq.xml","classpath*:applicationContext-myBatis.xml" })
public class AppTest {
	
	@Autowired
	public AbUserService abUserService;
	
	@Autowired
	private UsersInfoService usersInfoService;
	
	
	@Test
	public void test() throws JsonParseException, JsonMappingException, IOException{
		abUserService.deleteById(6666);
	}
	
	@Test
	public void addUserInfo(){
		
		AbUser user = new AbUser();
		user.setPhone("15835132986");
		user.setPassword("000000");
		user.setUsername(user.getPhone());
		AbUsersInfo usersInfo = new AbUsersInfo();
		AbUserBase userBase = new AbUserBase();
		// 会员账户预设置
		userBase.setCreateIp("192.168.11.1");// 创建IP
		userBase.setCreateTime(new Date());// 创建时间
		userBase.setTypeId(3);// 用户类型1管理员 2企业用户3会员
		userBase.setUsername(user.getUsername());// 登录名

		// 会员登陆信息预设置
		user.setCreateIp("192.168.11.1");// 创建IP
		user.setCreateTime(new Date());// 创建时间
		user.setTypeId(3);// 用户类型1管理员 2企业用户3会员
		user.setStatus(1);// 用户状态1有效用户2停用用户
		user.setIsDel(0);// 是否删除1删除0不删除
		user.setPhoneStatus(1);
		user.setEmailStatus(0);// 邮箱状态默认0未验证1验证通过
		user.setRealNameStatus(0);// 实名状态默认0未验证1验证通过
		user.setPassword(new SimpleHash("SHA-1", user.getUsername(), user
				.getPassword()).toString());// 登录密码

		// 会员信息
		usersInfo.setInviteCode("666666");// 邀请码
		usersInfo.setAbUser(user);// 设置登录信息
		usersInfo.setAbUserBase(userBase);// 设置账户信息
		usersInfo.setLastTime(new Date());// 最后登录时间
		usersInfo = usersInfoService.registerUser(usersInfo);
	}

}
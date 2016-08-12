package com.cifex.web.admin.operation.system.createcode;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cifex.framework.utils.Freemarker;
import com.cifex.framework.utils.PageData;
import com.cifex.framework.utils.PathUtil;
import com.cifex.framework.utils.file.FileUtil;
import com.cifex.framework.utils.filedown.FileDownloadUtil;
import com.cifex.framework.utils.zip.ZipUtil;
import com.cifex.web.admin.operation.base.AdminController;
 

/** 
 * 类名称：FreemarkerController
 * @version
 */
@Controller
@RequestMapping(value="/createCode")
public class CreateCodeController extends AdminController {
	
	/**
	 * 生成代码
	 */
	@RequestMapping(value="/proCode")
	public void proCode(HttpServletResponse response,HttpServletRequest request) throws Exception{
		PageData pd = new PageData();
		pd = this.getPageData();
		
		/* ============================================================================================= */
		String packageName = pd.getString("packageName");  			//包名				========1
		String objectName = pd.getString("objectName");	   			//类名				========2
		String zindext = pd.getString("zindex");	   	   			//属性总数
		int zindex = 0;
		if(null != zindext && !"".equals(zindext)){
			zindex = Integer.parseInt(zindext);
		}
		List<String[]> fieldList = new ArrayList<String[]>();   	//属性集合			========3
		for(int i=0; i< zindex; i++){
			fieldList.add(pd.getString("field"+i).split(",fh,"));	//属性放到集合里面
		}
		
		Map<String,Object> root = new HashMap<String,Object>();		//创建数据模型
		root.put("fieldList", fieldList);
		root.put("packageName", packageName);						//包名
		root.put("objectName", objectName);							//类名
		root.put("objectNameLower", objectName.toLowerCase());		//类名(全小写)
		root.put("objectNameUpper", objectName.toUpperCase());		//类名(全大写)
		root.put("nowDate", new Date());							//当前日期
		
		FileUtil.deleteFolder(PathUtil.getClasspath()+"admin/ftl");
		//DelAllFile.delFolder(PathUtil.getClasspath()+"admin/ftl"); //生成代码前,先清空之前生成的代码
		/* ============================================================================================= */
		
		String filePath = "admin/ftl/code/";						//存放路径
		String ftlPath = "createCode";								//ftl路径
		
		/*生成controller*/
		Freemarker.printFile("controllerTemplate.ftl", root, "controller/"+packageName+"/"+objectName.toLowerCase()+"/"+objectName+"Controller.java", filePath, ftlPath);
		
		/*生成service*/
		Freemarker.printFile("serviceTemplate.ftl", root, "service/"+packageName+"/"+objectName.toLowerCase()+"/"+objectName+"Service.java", filePath, ftlPath);

		/*生成mybatis xml*/
		Freemarker.printFile("mapperMysqlTemplate.ftl", root, "mybatis_mysql/"+packageName+"/"+objectName+"Mapper.xml", filePath, ftlPath);
		Freemarker.printFile("mapperOracleTemplate.ftl", root, "mybatis_oracle/"+packageName+"/"+objectName+"Mapper.xml", filePath, ftlPath);
		
		/*生成SQL脚本*/
		Freemarker.printFile("mysql_SQL_Template.ftl", root, "mysql数据库脚本/TB_"+objectName.toUpperCase()+".sql", filePath, ftlPath);
		Freemarker.printFile("oracle_SQL_Template.ftl", root, "oracle数据库脚本/TB_"+objectName.toUpperCase()+".sql", filePath, ftlPath);
		
		/*生成jsp页面*/
		Freemarker.printFile("jsp_list_Template.ftl", root, "jsp/"+packageName+"/"+objectName.toLowerCase()+"/"+objectName.toLowerCase()+"_list.jsp", filePath, ftlPath);
		Freemarker.printFile("jsp_edit_Template.ftl", root, "jsp/"+packageName+"/"+objectName.toLowerCase()+"/"+objectName.toLowerCase()+"_edit.jsp", filePath, ftlPath);
		
		/*生成说明文档*/
		Freemarker.printFile("docTemplate.ftl", root, "说明.doc", filePath, ftlPath);
		
		//this.print("oracle_SQL_Template.ftl", root);  控制台打印
		
		/*生成的全部代码压缩成zip文件*/
		//FileZip.zip(PathUtil.getClasspath()+"admin/ftl/code", PathUtil.getClasspath()+"admin/ftl/code.zip");
		ZipUtil.doZip(PathUtil.getClasspath()+"admin/ftl/code", null, null, true);
		
		/*下载代码*/
		//FileDownload.fileDownload(response, PathUtil.getClasspath()+"admin/ftl/code.zip", "code.zip");
		FileDownloadUtil.downloadI18N(PathUtil.getClasspath()+"admin/ftl/code.zip", "这是一个codezip包", null, request, response);
		
	}
	
}

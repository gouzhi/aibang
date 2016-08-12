<#include "/custom.include">
<#assign className = table.className>   
<#assign classNameFirstLower = className?uncap_first>   
<#assign classNameLowerCase = className?lower_case>   
<#assign pkJavaType = table.idColumn.javaType>   

package ${basepackage}.web.admin.operation;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import jxl.biff.DisplayFormat;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.cifex.controller.base.BaseController;
import com.cifex.entity.system.Menu;
import com.cifex.entity.Page;
import com.cifex.util.AppUtil;
import com.cifex.util.ObjectExcelView;
import com.cifex.util.Const;
import com.cifex.util.Tools;
import com.cifex.business.api;
import com.cifex.framework.utils.page;

/** 
 * 类名称：${className}Controller
 */
@Controller
@RequestMapping(value="/${classNameLowerCase}")
public class ${className}Controller extends AdminController {
	
	@Resource(name="${classNameFirstLower}Service")
	private ${className}Service ${classNameFirstLower}Service;
	
	private String display(String pageName)
	{
		return  ""+pageName;
	}
	/**
	 * 去新增页面
	 */
	@RequestMapping(value="/goAdd")
	public String goAdd(){
		logBefore(logger, "去新增${className}页面");
		return display("add");
	}
	
	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	public String save(ModelMap model,${className} ${classNameFirstLower}) throws Exception{
		logBefore(logger, "新增${className}");
		${classNameFirstLower}Service.saveObj(${classNameFirstLower});
		model.addAttribute("msg","success");
		return display("save_result");
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(value="/delete")
	@ResponseBody
	public void delete(Integer id){
		logBefore(logger, "删除${className}"+id);
		try{
			${classNameFirstLower}Service.deleteById(id);
			return "success";
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		
	}
	
	/**
	 * 去修改页面
	 */
	@RequestMapping(value="/goEdit/{id}")
	public String goEdit(ModelMap model,@PathVariable Integer id){
		logBefore(logger, "去修改${className}页面");
		${className} ${classNameFirstLower} = ${classNameFirstLower}Service.findById(id);	//根据ID读取
		model.addAttribute("${classNameFirstLower}", ${classNameFirstLower});
		return display("edit");
	}
	
	/**
	 * 修改
	 */
	@RequestMapping(value="/edit")
	public String edit(ModelMap model,${className} ${classNameFirstLower}) throws Exception{
		logBefore(logger, "修改${className}");
		${classNameFirstLower}Service.update(${classNameFirstLower});
		return display("edit");
	}
	
	/**
	 * 列表
	 */
	@RequestMapping(value="/list")
	public String list(ModelMap model,${className}Query ${classNameFirstLower}Query){
		logBefore(logger, "列表${className}");
		Page page = ${classNameFirstLower}Service.findPage(${classNameFirstLower}Query);	//列出${className}列表
		model.addAttribute("page", page);
		model.addAttribute("${classNameFirstLower}Query", ${classNameFirstLower}Query);
		model.addAttribute(Const.SESSION_QX,getHC());	//按钮权限
		return display("list");
	}
	
 
	
	 
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}

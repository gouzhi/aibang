package com.cifex.web.admin.operation.system.upload;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView; 

import com.cifex.framework.utils.AppUtil;
import com.cifex.framework.utils.Const;
import com.cifex.framework.utils.DateUtils;
import com.cifex.framework.utils.FileUpload;
import com.cifex.framework.utils.PageData;
import com.cifex.framework.utils.PathUtil;
import com.cifex.framework.utils.Tools;
import com.cifex.framework.utils.excel.export.CellContent;
import com.cifex.framework.utils.excel.export.PoiExcelView;
import com.cifex.framework.utils.excel.export.test.TestExportExcel;
import com.cifex.framework.utils.filedown.FileDownloadUtil;
import com.cifex.framework.utils.ip.IPSeeker;
import com.cifex.framework.utils.ip.Utils;
import com.cifex.framework.utils.zip.ZipUtil;
import com.cifex.web.admin.operation.base.AdminController;


/**
 * 
* @ClassName: fileUploadController
* @Description: (文件上传控制类)
* @author zy
* @date 2015-8-3 下午1:44:00
* Copyright CIFEX Corporation 2015
 */
@Controller
@RequestMapping(value="/fileupload")
public class fileUploadController extends AdminController {

	/**
	 * 
	* @Title: savePictures
	* @Description: (图片上传)
	* @param @param file
	* @param @return
	* @param @throws Exception
	* @return Object 
	* @throws
	 */
	@RequestMapping(value="/savePic")
	@ResponseBody
	public Object savePictures(@RequestParam(required=false) MultipartFile file) throws Exception{
		logBefore(logger, "新增Pictures");
		Map<String,String> map = new HashMap<String,String>();
		String  ffile = DateUtils.getDays(), fileName = "";
		if (null != file && !file.isEmpty()) {
			String filePath = PathUtil.getClasspath() + Const.FILEPATHIMG + ffile;		//文件上传路径
			fileName = FileUpload.fileUp(file, filePath, this.get32UUID());				//执行上传
		}else{
			System.out.println("上传失败");
		}
		map.put("path", Const.FILEPATHIMG +ffile + "/" + fileName);  //文件路径
		PageData pd = new PageData();
		
		pd.put("PICTURES_ID", this.get32UUID());			//主键
		pd.put("TITLE", "图片");								//标题
		pd.put("NAME", fileName);							//文件名
		pd.put("PATH", ffile + "/" + fileName);				//路径
		pd.put("CREATETIME", Tools.date2Str(new Date()));	//创建时间
		pd.put("MASTER_ID", "1");							//附属与
		pd.put("BZ", "图片管理处上传");						//备注
		//加水印
//		Watermark.setWatemark(PathUtil.getClasspath() + Const.FILEPATHIMG + ffile + "/" + fileName);		
		map.put("result", "ok");
		return AppUtil.returnObject(pd, map);
		//return map;
	}
	/**
	 * 
	* @Title: savePictures
	* @Description: (文件上传)
	* @param @param file
	* @param @return
	* @param @throws Exception
	* @return Object 
	* @throws
	 */
	@RequestMapping(value="/saveFile")
	@ResponseBody
	public Object saveFiles(@RequestParam(required=false) MultipartFile file) throws Exception{
		logBefore(logger, "新增文件");
		Map<String,String> map = new HashMap<String,String>();
		String  ffile = DateUtils.getDays(), fileName = "";
		if (null != file && !file.isEmpty()) {
			String filePath = PathUtil.getClasspath() + Const.FILEPATHFILE + ffile;		//文件上传路径
			fileName = FileUpload.fileUp(file, filePath, this.get32UUID());				//执行上传
		}else{
			System.out.println("上传失败");
		}
		map.put("path", Const.FILEPATHFILE +ffile + "/" + fileName);  //文件路径
		PageData pd = new PageData();
		
		pd.put("PICTURES_ID", this.get32UUID());			//主键
		pd.put("TITLE", "文件");								//标题
		pd.put("NAME", fileName);							//文件名
		pd.put("PATH", ffile + "/" + fileName);				//路径
		pd.put("CREATETIME", Tools.date2Str(new Date()));	//创建时间
		pd.put("MASTER_ID", "1");							//附属与
		pd.put("BZ", "文件上传");						//备注
		//加水印
//		Watermark.setWatemark(PathUtil.getClasspath() + Const.FILEPATHIMG + ffile + "/" + fileName);		
		map.put("result", "ok");
		return AppUtil.returnObject(pd, map);
		//return map;
	}

	/**
	 * 
	* @Title: goAdd
	* @Description: (加载上传图片页面)
	* @param @return
	* @return ModelAndView 
	* @throws
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd(){
         System.out.println(PathUtil.getClasspath());
         System.out.println(PathUtil.getClassResources());
         System.out.println(PathUtil.PathAddress());
         
		logBefore(logger, "去新增Pictures页面");
		ModelAndView mv = this.getModelAndView();
		try {
			mv.setViewName("system/tools/pictures_upload");
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}	
	
	
	@RequestMapping("exportexcel")
	public void exportexcel(HttpServletRequest request,HttpServletResponse response){
		try {
			//导出excel   demo
			TestExportExcel excel = new TestExportExcel();
			String path = "D://excelTemp/"+System.currentTimeMillis()+"/";
			excel.expor(request, null, path, "1");
			File zipFile = ZipUtil.doZip(path, null, null, true);
			FileDownloadUtil.download(zipFile.getAbsolutePath(), "aaaa.zip", null, request, response);
			fileOutPut(zipFile, "aaaa.zip", request, response);
			//获取IP  demo
			String ip = Utils.getCdnIpAddr(request);
			String addr = IPSeeker.getInstance().getAddress(ip);
			String addString = IPSeeker.getInstance().getAddress("58.132.171.109");
			String adg = IPSeeker.getInstance().getAddress("127.0.0.1");
			System.out.println(adg);
			System.out.println(addString);
			System.out.println(ip +"================="+addr);
			 
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	@RequestMapping("exportexcelview")
	public ModelAndView exportexcelview(HttpServletRequest request,HttpServletResponse response){
		List<Map<String, Object>> list=new ArrayList<Map<String, Object>>();
		Map<String, Object> model =new HashMap<String,Object>();
		model.put("用户名", "18615985465");
		model.put("密码", "18615985465");
		list.add(model);
		list.add(model);
		list.add(model);
		CellContent cc=new CellContent();
		cc.setTxt("用户名");
		cc.setLink("http://www.baidu.com");
	    model =new HashMap<String,Object>();
			model.put("用户名",cc);
			model.put("密码", "18615985465");
		list.add(model);
		PoiExcelView view= new PoiExcelView();
		view.setTitle("用户信息");
		
		
		view.setList(list);
		return new ModelAndView(view);
	}
	
	
}

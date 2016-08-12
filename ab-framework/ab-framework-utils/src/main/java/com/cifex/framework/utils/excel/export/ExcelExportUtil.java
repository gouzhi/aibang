/**    
 * @filename ExcelExportUtil.java     
 * @version www.cifex.com.cn    
 * @date 2015年8月14日     
 */
package com.cifex.framework.utils.excel.export;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

/**
 * @classname ExcelExportUtil
 * 导出excel工具类
 * @author zeng.fangfang
 * @date 2015年8月14日
 */
public abstract class ExcelExportUtil<T> extends PoiExcelExport {

	/**
	 * @methodname getHeaders
	 * @discription 标题
	 * @return String[]
	 * @author zeng.fangfang
	 * @date 2015年8月14日
	 */
	protected abstract String[] getHeaders();

	/**
	 * @methodname getDataset
	 *   获取内容（需要子类去重写）
	 * @param dataList
	 * @return List<String[]>
	 * @author zeng.fangfang
	 * @date 2015年8月14日
	 */
	protected abstract List<String[]> getDataset(List<T> dataList);

	/**
	 * @methodname expor  
	 * 导出
	 * @param request
	 * @param dataList 需要生成excel的数据
	 * @param path 下载路径
	 * @param fileName excel名称
	 * @throws java.io.UnsupportedEncodingException void
	 * @author zeng.fangfang
	 * @date 2015年8月14日
	 */
	public void expor(HttpServletRequest request, List<T> dataList,
			String path, String fileName) throws UnsupportedEncodingException {
		fileName = fileName + ".xls";//定义导出的excel名称
		
		String[] headers = getHeaders();//获取title
		
		List<String[]> dataset = getDataset(dataList);
		
		File file = new File(path);
		if (!file.exists()) {
			file.mkdirs();
		}
		
		try {
			FileOutputStream fos = new FileOutputStream(new File(path + fileName));
			exportExcel(headers, dataset, fos);
			fos.flush();
			fos.close();
		} catch (IOException e) { 
			e.printStackTrace();
		} 
	}
}

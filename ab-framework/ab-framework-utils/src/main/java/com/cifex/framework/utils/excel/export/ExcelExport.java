package com.cifex.framework.utils.excel.export;

import java.io.OutputStream;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * @classname ExcelExport
 * excel 文件导出
 * @author zeng.fangfang
 * @date 2015年8月14日
 */
public abstract class ExcelExport {
	/**
	 * 用于记录日志
	 */
	protected final Logger logger = LoggerFactory.getLogger(this.getClass());
	/**
	 * sheet名称
	 */
	private String sheetName = "sheet";// 工作表名

	public String getSheetName() {
		return sheetName;
	}

	public void setSheetName(String sheetName) {
		this.sheetName = sheetName;
	}

	/**
	 * @methodname setSheetStyle
	 * 设置工作表样式 【子类重写】
	 * @param sheet
	 * @return HSSFSheet
	 * @author zeng.fangfang
	 * @date 2015年8月14日
	 */
	public HSSFSheet setSheetStyle(HSSFSheet sheet) {
		return sheet;
	}

	/**
	 * @methodname setHSSFCellStyle
	 *  设置单元格表样式 【子类重写】
	 * @param style
	 * @return HSSFCellStyle
	 * @author zeng.fangfang
	 * @date 2015年8月14日
	 */
	public HSSFCellStyle setHSSFCellStyle(HSSFCellStyle style) {
		return style;
	}

	/**
	 * @methodname exportExcel  
	 *  由于excel的限制单个工作表只能支持6W行数据 
	 * @param headers 标题
	 * @param dataset 数据
	 * @param out 输出流
	 * @author zeng.fangfang
	 * @date 2015年8月14日
	 */
	public abstract void exportExcel(String[] headers, List<String[]> dataset,
			OutputStream out);
}

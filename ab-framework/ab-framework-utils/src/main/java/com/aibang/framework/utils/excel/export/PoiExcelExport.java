package com.aibang.framework.utils.excel.export;

import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.regex.Pattern;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

/**
 * @classname PoiExcelExport    
 *   使用poi组件导出excel 
 * @author zeng.fangfang    
 * @date 2015年8月19日
 */
public abstract class PoiExcelExport extends ExcelExport {

	/**
	 * 设置工作表样式 【子类重写】
	 * 
	 * @param sheet
	 * @return
	 */
	public HSSFSheet setSheetStyle(HSSFSheet sheet) {
		return sheet;
	}

	/**
	 * 设置单元格表样式 【子类重写】
	 * 
	 * @param sheet
	 * @return
	 */
	public HSSFCellStyle setHSSFCellStyle(HSSFCellStyle style) {
		return style;
	}

	@Override
	public void exportExcel(String[] headers, List<String[]> dataset,
			OutputStream out) {
		// 声明一个工作薄
		HSSFWorkbook workbook = new HSSFWorkbook();
		// 生成一个表格
		HSSFSheet sheet = workbook.createSheet(getSheetName());
		sheet = setSheetStyle(sheet);

		// style = setHSSFCellStyle(style);
		// 产生表格标题行
		// 处理检索信息
		int index = 0;
		if (null != headers) {//
			HSSFCellStyle style = workbook.createCellStyle();
			float hieght = getExcelCellAutoHeight(headers[0] + "", 2f);
			style = StyleUtils.getHeaderStyle(workbook);
			HSSFRow dataRow = sheet.createRow(index);
			for (int i = 0; i < headers.length; i++) {
				HSSFCell dataCell = dataRow.createCell(i);
				dataCell.setCellStyle(style);
				dataCell.setCellValue(headers[i]);
			}
			sheet.getRow(index).setHeightInPoints(hieght);
			index++;
		}
		sheet.autoSizeColumn(0);// 设置最适宽度
		// 遍历集合数据，产生数据行
		HSSFCellStyle style = workbook.createCellStyle();
		style = StyleUtils.getContentStyle(workbook);
		for (String[] cellArray : dataset) {
			HSSFRow dataRow = sheet.createRow(index);
			for (int i = 0; i < cellArray.length; i++) {
				float hieght = getExcelCellAutoHeight(cellArray[0] + "", 8f);
				HSSFCell dataCell = dataRow.createCell(i);
				dataCell.setCellStyle(style);
				dataCell.setCellValue(cellArray[i]);
				sheet.autoSizeColumn(i);// 设置最适宽度
				sheet.getRow(index).setHeightInPoints(hieght);
			}
			index++;
		}
		try {
			workbook.write(out);
		} catch (IOException e) {
			logger.error("导出excel出错", e);
		}
	}
	
	/**
	 * @methodname getExcelCellAutoHeight  
	 * @discription 获取单元格的最适合高度 
	 * @param str
	 * @param fontCountInline
	 * @return float
	 * @author zeng.fangfang
	 * @date 2015年8月14日
	 */
	public static float getExcelCellAutoHeight(String str,float fontCountInline){
		float defaultRowHeight = 12.00f;//每一行的高度指定
		float defaultCount = 0.00f;
		for (int i = 0; i < str.length(); i++) {
			float ff = getregex(str.substring(i, i + 1));
			defaultCount = defaultCount + ff;
		}
		return ((int) (defaultCount / fontCountInline) + 1) * defaultRowHeight;//计算
	}
	
	public static float getregex(String charStr){
		if("".equals(charStr))
			return 0.5f;
		// 判断是否为字母或字符
		if(Pattern.compile("^[A-Za-z0-9]+$").matcher(charStr).matches())
			return 0.5f;
		// 判断是否为全角
		if(Pattern.compile("[\u4e00-\u9fa5]+$").matcher(charStr).matches())
			return 1.00f;
		//全角符号 及中文
		if(Pattern.compile("[^x00-xff]").matcher(charStr).matches())
			return 1.00f;
		return 0.5f;
	}

}

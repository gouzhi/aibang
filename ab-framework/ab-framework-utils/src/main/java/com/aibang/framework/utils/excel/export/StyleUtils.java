/**    
 * @filename ExcelUtil.java     
 * @version www.cifex.com.cn    
 * @date 2015年8月14日     
 */
package com.aibang.framework.utils.excel.export;

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;

/**    
 * @classname ExcelUtil    
 * @description excel工具类 
 * @author zeng.fangfang    
 * @date 2015年8月14日   
 */
public class StyleUtils {

	/**
	 * @methodname getContentStyle  
	 *   设置excel内容样式   
	 * @param workbook
	 * @return HSSFCellStyle
	 * @author zeng.fangfang
	 * @date 2015年8月14日
	 */
	public static HSSFCellStyle getContentStyle(HSSFWorkbook workbook){
		//设置字体
        HSSFFont columnHeadFont = workbook.createFont();
        columnHeadFont.setFontName("Times New Roman");    
        HSSFCellStyle cellStyle = workbook.createCellStyle();
        cellStyle.setFont(columnHeadFont);
		cellStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);//填充单元格
		cellStyle.setAlignment(HSSFCellStyle.ALIGN_LEFT);// 左右居中  
		cellStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 上下居中
		cellStyle.setLocked(true); 
		cellStyle.setWrapText(true);  
		cellStyle.setLeftBorderColor(HSSFColor.BLACK.index);// 左边框的颜色 
		cellStyle.setBorderLeft((short) 1);// 边框的大小    
		cellStyle.setRightBorderColor(HSSFColor.BLACK.index);// 右边框的颜色    
		cellStyle.setBorderRight((short) 1);// 边框的大小    
		cellStyle.setTopBorderColor(HSSFColor.BLACK.index);//上边框的颜色 
		cellStyle.setBorderTop((short)1);// 边框的大小    
		cellStyle.setBottomBorderColor(HSSFColor.BLACK.index);//下边框的颜色 
		cellStyle.setBorderBottom((short)1);// 边框的大小    
		cellStyle.setBottomBorderColor(HSSFColor.BLACK.index); // 设置单元格的边框颜色
		cellStyle.setFillForegroundColor(HSSFColor.WHITE.index);//填充单元格为黄色
		return cellStyle;
	}
	
	/**
	 * @methodname getHeaderStyle  
	 *   设置表头样式   
	 * @param workbook
	 * @return HSSFCellStyle
	 * @author zeng.fangfang
	 * @date 2015年8月14日
	 */
	public static HSSFCellStyle getHeaderStyle(HSSFWorkbook workbook){
		//设置字体
        HSSFFont columnHeadFont = workbook.createFont();
        columnHeadFont.setFontName("Times New Roman");    
        columnHeadFont.setFontHeightInPoints((short) 14);    
        columnHeadFont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD); 
        HSSFCellStyle style = workbook.createCellStyle();
        style.setFont(columnHeadFont);
        //设置背景颜色
        style.setFillForegroundColor((short)13);
        style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);//填充单元格
        //设置举重
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 左右居中  
        style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 上下居中
        style.setLocked(true); 
        style.setWrapText(true);  
        //设置边框大小颜色
        style.setLeftBorderColor(HSSFColor.BLACK.index);// 左边框的颜色 
        style.setBorderLeft((short) 1);// 边框的大小    
        style.setRightBorderColor(HSSFColor.BLACK.index);// 右边框的颜色    
        style.setBorderRight((short) 1);// 边框的大小    
        style.setTopBorderColor(HSSFColor.BLACK.index);//上边框的颜色 
        style.setBorderTop((short)1);// 边框的大小    
        style.setBottomBorderColor(HSSFColor.BLACK.index);//下边框的颜色 
        style.setBorderBottom((short)1);// 边框的大小    
        style.setBorderBottom(HSSFCellStyle.BORDER_THIN); // 设置单元格的边框为粗体   
        style.setBottomBorderColor(HSSFColor.BLACK.index); // 设置单元格的边框颜色
        style.setFillForegroundColor(HSSFColor.GREY_40_PERCENT.index);//填充单元格为黄色
        return style;
    }
	
	/**
	 * @methodname setSheetStyle  
	 *   设置sheet宽度
	 * @param sheet
	 * @return HSSFSheet
	 * @author zeng.fangfang
	 * @date 2015年8月14日
	 */
	public static HSSFSheet setSheetStyle(HSSFSheet sheet) {
        sheet.setColumnWidth(0, 6000);
        sheet.setColumnWidth(1, 10000);
        sheet.setColumnWidth(2, 15000);
        sheet.setColumnWidth(3, 3000);
        sheet.setColumnWidth(4, 3000);
        sheet.setColumnWidth(5, 3000);
        sheet.setColumnWidth(6, 3000);
        sheet.setColumnWidth(7, 3000);
        sheet.setColumnWidth(8, 3000);
        sheet.setColumnWidth(9, 15000);
        return sheet;
    }
}

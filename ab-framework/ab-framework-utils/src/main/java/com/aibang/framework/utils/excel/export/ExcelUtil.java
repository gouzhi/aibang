package com.aibang.framework.utils.excel.export;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFHyperlink;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.CellRangeAddress;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Hyperlink;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.aspectj.weaver.ast.Instanceof;
/**
 *  EXCEL相关操作工具类
 * @classname ExcelUtil    
 * @description  EXCEL相关操作工具类 
 * @author liuj    
 * @date 2016年1月8日
 */
public class ExcelUtil {
	/**
	 *  日志类 logger 
	 */
	private static final Logger logger = Logger.getLogger(ExcelUtil.class);
	
	/**
	 * 单个sheet最大行数
	 */
	public static final int SHEET_MAX_ROWS = 65530;
	/**
	 * 导出时传入ExcelUtil的数据为空时 表头默认显示的内容
	 */
	public static final String POI_DEFAULT_VALUE = "您好你下载的内容为空";
	/**
	 * 
	 * 方法描述:按导入数据组装导出EXCEL表格  
	 * @param list 需导出的数据 excelName表格名称
	 * @return 
	 */
	@SuppressWarnings("deprecation")
	public static Workbook assembleExcel(List<Map<String, Object>> list, String excelName ,String sheetName,String title) {
		logger.debug("[ExcelUtil.assembleExcel:msg] start...") ;
		
		/**
		 * 工作表
		 */
		Workbook workbook = new HSSFWorkbook();
		
		/**
		 * 表单页
		 */
		Sheet sheet = workbook.createSheet();
		
		HSSFCellStyle headStyle = StyleUtils.getHeaderStyle((HSSFWorkbook)workbook);
		HSSFCellStyle contentStyle = StyleUtils.getContentStyle((HSSFWorkbook)workbook);
		
		/**
		 * 设置sheet名称
		 */
		workbook.setSheetName(0, sheetName) ;
		/**
		 * 创建行索引
		 */
		int rowIndex = 0;
		
		/**
		 * 创建列索引
		 */
		int cellIndex = 0;
		
		/**
		 * 表单第一行（表头）
		 */
		Row row = sheet.createRow(rowIndex);
		
		
		/**
		 * 表格标题
		 **/
		if(!StringUtils.isEmpty(title))
		{
			CellRangeAddress cra=new CellRangeAddress(0, 0, 0, list.get(0).entrySet().size()-1);        
	        //在sheet里增加合并单元格  
	        sheet.addMergedRegion(cra);  
	        
			/**
			 * 创建表头行单元格
			 */
			Cell cell = row.createCell(cellIndex);
			cell.setCellValue(title);
			cell.setCellStyle(headStyle);
			float hieght = PoiExcelExport.getExcelCellAutoHeight(title + "", 2f);
			row.setHeightInPoints(hieght);
			sheet.autoSizeColumn(cellIndex);// 设置最适宽度
			rowIndex++;
			row = sheet.createRow(rowIndex);
			
		}
		/**
		 * 判断list是否为空 
		 */
		 
		if (list != null && list.size() != 0) {
			/**
			 * 循环开始 cellIndex 置为 0
			 */
			cellIndex = 0 ;
			/**
			 * 循环list内第一个map 其 key为表头
			 */
			for (Entry<String, ?> en : list.get(0).entrySet()) {
				float hieght = PoiExcelExport.getExcelCellAutoHeight(en.getKey() + "", 2f);
				/**
				 * 创建表头行单元格
				 */
				Cell cell = row.createCell(cellIndex);
				/**
				 * 设置单元格内容
				 */
				cell.setCellValue(en.getKey());
				cell.setCellStyle(headStyle);
				
				row.setHeightInPoints(hieght);
				
				sheet.autoSizeColumn(cellIndex);// 设置最适宽度
				/**
				 * cellIndex所代表的当前单元格创建后cellIndex+1
				 */
				cellIndex++;
			}
			  
			/**
			 * 循环list
			 */
			for (int i = 1; i < list.size(); i++) {
				/**
				 * rowIndex所代表的当前行已创建 所以rowIndex+1创建行
				 */
				rowIndex++;
				
				/**
				 * 如果数据过多，分多个sheet
				 * add by:chenxiang@xwtec.cn
				 */
				if(rowIndex >= SHEET_MAX_ROWS){
					//新建一个sheet
					sheet = workbook.createSheet();
					//下一张sheet行索引置为0
					rowIndex = 0;
				}
				
				
				row = sheet.createRow(rowIndex);
				/**
				 * 循环开始 cellIndex 置为 0
				 */
				cellIndex = 0 ;
				/**
				 * 循环List的map创建单元格
				 */
				for (Entry<String, Object> en : list.get(0).entrySet()) {
					/**
					 * 根据索引创建单元植物园
					 */
					Cell cell = row.createCell(cellIndex);
					/**
					 * 设置单元格内容
					 */
					float hieght = PoiExcelExport.getExcelCellAutoHeight(changeNullToEmptyString(list.get(i).get(en.getValue())) + "", 8f);
					
					if(list.get(i).get(en.getValue())!=null && list.get(i).get(en.getValue()) instanceof CellContent)
					{
						CellContent cellContent=(CellContent)list.get(i).get(en.getValue());
						cell.setCellValue(cellContent.getTxt());
						Hyperlink link=new HSSFHyperlink(HSSFHyperlink.LINK_URL);
						link.setAddress(cellContent.getLink());
						cell.setHyperlink(link);
						
					}else {
						cell.setCellValue(changeNullToEmptyString(list.get(i).get(en.getValue())));	
					}
					cell.setCellStyle(contentStyle);
					row.setHeightInPoints(hieght);
					sheet.autoSizeColumn(cellIndex);// 设置最适宽度
					/**
					 * cellIndex所代表的当前单元格创建后cellIndex+1
					 */
					cellIndex++;
				}
			}
		}else{
			/**
			 * 创建表头行单元格
			 */
			Cell cell = row.createCell(cellIndex);
			/**
			 * 设置单元格内容
			 */
			cell.setCellValue(POI_DEFAULT_VALUE);
		}
		logger.debug("[ExcelUtil.assembleExcel:msg] end...") ;
		return workbook ;
	}
	
	public static String changeNullToEmptyString(Object obj){
		if(obj == null)
			return "";
		else
			return obj.toString();
	}
	
	/**
	 * 方法描述:根据文件获取到Workbook
	 * @param fileName 文件路径
	 * @return Workbook对象
	 */
	public static Workbook getWorkbook(String fileName) throws InvalidFormatException, IOException{
		InputStream inp = new FileInputStream(fileName);  
		Workbook wb = WorkbookFactory.create(inp); 
		return wb;
	}
	
	 /**
	  * 方法描述:获取第几个工作表的值
	  * @param fileName 文件路径  sheetIndex第几个工作表
	  * @return 工作表里的数据
	  * @throws IOException 
	  * @throws InvalidFormatException 
	  */
	 public static List<String[]> getAllData(Workbook wb,int sheetIndex){  
		 List<String[]> dataList = new ArrayList<String[]>();//返回结果
		 int columnNum = 0;  //共多少列默认0

		 //获取第几个工作表
	     Sheet sheet = wb.getSheetAt(sheetIndex);
	     //如果第一行不为空就获取共有多少列
	     if(sheet.getRow(0)!=null){  
	        columnNum = sheet.getRow(0).getLastCellNum()-sheet.getRow(0).getFirstCellNum();  
	     }  
	     //如果大于列大于0
	     if(columnNum>0){  
	    	//遍历sheet
	       for(Row row : sheet){   
	    	   //用来获取一行数据
	           String[] singleRow = new String[columnNum];  
	           for(int i=0;i<columnNum;i++){  
	              Cell cell = row.getCell(i, Row.CREATE_NULL_AS_BLANK);  
	              //判断类型
	              switch(cell.getCellType()){  
	                case Cell.CELL_TYPE_BLANK:  //空格
	                 singleRow[i] = "";  
	                 break;  
	               case Cell.CELL_TYPE_BOOLEAN:  //布尔值
	                 singleRow[i] = Boolean.toString(cell.getBooleanCellValue());  
	                 break;  
	               case Cell.CELL_TYPE_NUMERIC:  //数字               
	                 if(DateUtil.isCellDateFormatted(cell)){  
	                   singleRow[i] = String.valueOf(cell.getDateCellValue());  
	                 }else{   
	                   cell.setCellType(Cell.CELL_TYPE_STRING);  
	                   String temp = cell.getStringCellValue();  
	                   //判断是否包含小数点，如果不含小数点，则以字符串读取，如果含小数点，则转换为Double类型的字符串  
	                   if(temp.indexOf(".")>-1){  
	                     singleRow[i] = String.valueOf(new Double(temp)).trim();  
	                   }else{  
	                     singleRow[i] = temp.trim();  
	                   }  
	                 }  
	                 break;  
	               case Cell.CELL_TYPE_STRING:  //字符串
	                 singleRow[i] = cell.getStringCellValue().trim();  
	                 break;  
	               case Cell.CELL_TYPE_ERROR:  //错误
	                 singleRow[i] = "";  
	                 break;    
	               case Cell.CELL_TYPE_FORMULA:  //公式
	                 cell.setCellType(Cell.CELL_TYPE_STRING);  
	                 singleRow[i] = cell.getStringCellValue();  
	                 if(singleRow[i]!=null){  
	                   singleRow[i] = singleRow[i].replaceAll("#N/A","").trim();  
	                 }  
	                 break;    
	               default:  
	                 singleRow[i] = "";  
	                 break;  
	             }  
	          }   
	          /**
	           * 即使第一行为空，后面也可能不为空所以注释掉
	           */
	          //if("".equals(singleRow[0])){continue;}//如果第一行为空，跳过  
	          dataList.add(singleRow);  
	      }  
	    }  
	    return dataList;  
	  }    
	 
	 
	 /**
	  * 方法描述:Excel最大行index值，实际行数要加1 
	  * @param Workbook对象   sheetIndex第几个工作表
	  * @return Excel最大行index值
	  */
	  public static int getRowNum(Workbook wb, int sheetIndex){
		//获取工作表
	    Sheet sheet = wb.getSheetAt(sheetIndex);  
	    return sheet.getLastRowNum();  
	  }  
	    
	  /**
	   * 方法描述:获取excel共多少列
	   * @param Workbook对象  sheetIndex第几个工作表
	   * @return 共多少列
	   */
	  public static int getColumnNum(Workbook wb,int sheetIndex){
		//获取工作表
	    Sheet sheet = wb.getSheetAt(sheetIndex); 
	    Row row = sheet.getRow(0);//根据第一行获取共有多少列
	    if(row!=null&&row.getLastCellNum()>0){  
	       return row.getLastCellNum();  
	    }  
	    return 0;  
	  }  
}

package com.cifex.framework.utils.excel.read;

import java.text.SimpleDateFormat;
import java.util.ArrayList;

import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;

public abstract class PoiExcelHelper {  
	  public static final String SEPARATOR = ",";  
	    public static final String CONNECTOR = "-";  
	  
	    /**
	     * 获取sheet列表，子类必须实现 
	     * @param filePath
	     * @return ArrayList<String>
	     * @author zeng.fangfang
	     * @date 2015年8月19日
	     */
	    public abstract ArrayList<String> getSheetList(String filePath);  
	      
	    /**
	     * 读取Excel文件数据 
	     * @param filePath
	     * @param sheetIndex
	     * @return ArrayList<ArrayList<String>>
	     * @author zeng.fangfang
	     * @date 2015年8月19日
	     */
	    public ArrayList<ArrayList<String>> readExcel(String filePath, int sheetIndex) {  
	        return readExcel(filePath, sheetIndex, "1-", "1-");  
	    }  
	      
	    /**
	     * 读取Excel文件数据
	     * @param filePath
	     * @param sheetIndex
	     * @param rows
	     * @return ArrayList<ArrayList<String>>
	     * @author zeng.fangfang
	     * @date 2015年8月19日
	     */
	    public ArrayList<ArrayList<String>> readExcel(String filePath, int sheetIndex, String rows) {  
	        return readExcel(filePath, sheetIndex, rows, "1-");  
	    }  
	      
	    /**
	     * 读取Excel文件数据
	     * @param filePath
	     * @param sheetIndex
	     * @param columns
	     * @return ArrayList<ArrayList<String>>
	     * @author zeng.fangfang
	     * @date 2015年8月19日
	     */
	    public ArrayList<ArrayList<String>> readExcel(String filePath, int sheetIndex, String[] columns) {  
	        return readExcel(filePath, sheetIndex, "1-", columns);  
	    }  
	      
	    /**
	     * 读取Excel文件数据，子类必须实现
	     * @param filePath
	     * @param sheetIndex
	     * @param rows
	     * @param columns
	     * @return ArrayList<ArrayList<String>>
	     * @author zeng.fangfang
	     * @date 2015年8月19日
	     */
	    public abstract ArrayList<ArrayList<String>> readExcel(String filePath, int sheetIndex, String rows, String columns);  
	  
	    /**
	     * 读取Excel文件数据
	     * @param filePath
	     * @param sheetIndex
	     * @param rows
	     * @param columns
	     * @return ArrayList<ArrayList<String>>
	     * @author zeng.fangfang
	     * @date 2015年8月19日
	     */
	    public ArrayList<ArrayList<String>> readExcel(String filePath, int sheetIndex, String rows, String[] columns) {  
	        int[] cols = getColumnNumber(columns);  
	          
	        return readExcel(filePath, sheetIndex, rows, cols);  
	    }  
	  
	    /**
	     * 读取Excel文件数据，子类必须实现
	     * @param filePath
	     * @param sheetIndex
	     * @param rows
	     * @param cols
	     * @return ArrayList<ArrayList<String>>
	     * @author zeng.fangfang
	     * @date 2015年8月19日
	     */
	    public abstract ArrayList<ArrayList<String>> readExcel(String filePath, int sheetIndex, String rows, int[] cols);  
	      
	    /**
	     * 读取Excel文件内容
	     * @param sheet
	     * @param rows
	     * @param cols
	     * @return ArrayList<ArrayList<String>>
	     * @author zeng.fangfang
	     * @date 2015年8月19日
	     */
	    protected ArrayList<ArrayList<String>> readExcel(Sheet sheet, String rows, int[] cols) {  
	        ArrayList<ArrayList<String>> dataList = new ArrayList<ArrayList<String>> ();  
	        // 处理行信息，并逐行列块读取数据  
	        String[] rowList = rows.split(SEPARATOR);  
	        for (String rowStr : rowList) {  
	            if (rowStr.contains(CONNECTOR)) {  
	                String[] rowArr = rowStr.trim().split(CONNECTOR);  
	                int start = Integer.parseInt(rowArr[0]) - 1;  
	                int end;  
	                if (rowArr.length == 1) {  
	                	end = sheet.getPhysicalNumberOfRows()+1;
	                } else {  
	                    end = Integer.parseInt(rowArr[1].trim()) - 1;  
	                }  
	                dataList.addAll(getRowsValue(sheet, start, end, cols));  
	            } else {  
	                dataList.add(getRowValue(sheet, Integer.parseInt(rowStr) - 1, cols));  
	            }  
	        }  
	        return dataList;  
	    }  

	    /**
	     * 获取连续行、列数据
	     * @param sheet
	     * @param startRow
	     * @param endRow
	     * @param startCol
	     * @param endCol
	     * @return ArrayList<ArrayList<String>>
	     * @author zeng.fangfang
	     * @date 2015年8月19日
	     */
	    protected ArrayList<ArrayList<String>> getRowsValue(Sheet sheet, int startRow, int endRow,  
	            int startCol, int endCol) {  
	        if (endRow < startRow || endCol < startCol) {  
	            return null;  
	        }  
	          
	        ArrayList<ArrayList<String>> data = new ArrayList<ArrayList<String>>();  
	        for (int i = startRow; i <= endRow; i++) {  
	        	if (checkRowIsNull(sheet.getRow(i), startCol, endCol)) {
	        		continue;
	        	}
	            data.add(getRowValue(sheet, i, startCol, endCol));  
	        }  
	        return data;  
	    } 
	  
	    /**
	     * 获取连续行、不连续列数据  
	     * @param sheet
	     * @param startRow
	     * @param endRow
	     * @param cols
	     * @return ArrayList<ArrayList<String>>
	     * @author zeng.fangfang
	     * @date 2015年8月19日
	     */
	    private ArrayList<ArrayList<String>> getRowsValue(Sheet sheet, int startRow, int endRow, int[] cols) {  
	        if (endRow < startRow) {  
	            return null;  
	        }  
	          
	        ArrayList<ArrayList<String>> data = new ArrayList<ArrayList<String>>();  
	        for (int i = startRow; i <= endRow; i++) {  
	        	if (checkRowIsNull(sheet.getRow(i), cols)) {
	        		continue;
	        	}
	            data.add(getRowValue(sheet, i, cols));  
	        }  
	        return data;
	    }
	    
	    private boolean checkRowIsNull(Row row, int[] cols) {
	    	return checkRowIsNull(row, 0, cols.length);
	    	
	    }
	    
	    private boolean checkRowIsNull(Row row, int startCol, int endCol) {
	    	if (row == null) {
	    		return true;
	    	}
	    	for (int i = startCol; i < endCol; i++) {
	    		if (row.getCell(i) != null && row.getCell(i).getCellType() != Cell.CELL_TYPE_BLANK) {
	    			return false;
	    		}
	    	}
	    	return true;
	    }
	      
	    /**
	     * 获取行连续列数据
	     * @param sheet
	     * @param rowIndex
	     * @param startCol
	     * @param endCol
	     * @return ArrayList<String>
	     * @author zeng.fangfang
	     * @date 2015年8月19日
	     */
	    private ArrayList<String> getRowValue(Sheet sheet, int rowIndex, int startCol, int endCol) {  
	        if(endCol < startCol) {  
	            return null;  
	        }  
	          
	        Row row = sheet.getRow(rowIndex);  
	        ArrayList<String> rowData = new ArrayList<String>();  
	        for (int i = startCol; i <= endCol; i++) {  
	            rowData.add(getCellValue(row, i));  
	        }  
	        return rowData;  
	    }  
	      
	    /**
	     * 获取行不连续列数据
	     * @param sheet
	     * @param rowIndex
	     * @param cols
	     * @return ArrayList<String>
	     * @author zeng.fangfang
	     * @date 2015年8月19日
	     */
	    private ArrayList<String> getRowValue(Sheet sheet, int rowIndex, int[] cols) {  
	        Row row = sheet.getRow(rowIndex);  
	        ArrayList<String> rowData = new ArrayList<String>();  
	        for (int colIndex : cols) {  
	            rowData.add(getCellValue(row, colIndex));  
	        }  
	        return rowData;  
	    }  
	      
	    /**
	     * 获取单元格内容 
	     * @param row
	     * @param column
	     * @return String
	     * @author zeng.fangfang
	     * @date 2015年8月19日
	     */
	    protected String getCellValue(Row row, String column) {  
	        return getCellValue(row,getColumnNumber(column));  
	    }  
	  
	    /**
	     * 获取单元格内容
	     * @param row
	     * @param col
	     * @return String
	     * @author zeng.fangfang
	     * @date 2015年8月19日
	     */
	    private String getCellValue(Row row, int col) {  
	        Cell cell = row.getCell(col);  
	        return getCellValue(cell);  
	    }  
	  
	    /**
	     * 获取单元格内文本信息
	     * @param cell
	     * @return String
	     * @author zeng.fangfang
	     * @date 2015年8月19日
	     */
		public static final String getCellValue(Cell cell) {
			 
			String value = null ;
			if(cell==null){
				return value;
			}
			switch(cell.getCellType()) {
				case Cell.CELL_TYPE_NUMERIC :	// 数字
					if(HSSFDateUtil.isCellDateFormatted(cell)) {		// 如果是日期类型
						value = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(cell.getDateCellValue()) ;
					} else {
						cell.setCellType(Cell.CELL_TYPE_STRING);
						value = cell.getStringCellValue();
					}
					break ;
				case Cell.CELL_TYPE_STRING:		// 字符串
					value = cell.getStringCellValue() ;
					break ;
				case Cell.CELL_TYPE_FORMULA:	// 公式
					// 用数字方式获取公式结果，根据值判断是否为日期类型
					double numericValue = cell.getNumericCellValue() ;
					if(HSSFDateUtil.isValidExcelDate(numericValue)) {	// 如果是日期类型
						value = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(cell.getDateCellValue()) ;
					} else 	value = String.valueOf(numericValue) ;
					break ;
				case Cell.CELL_TYPE_BLANK:				// 空白
					value = "" ;
					break ;
				case Cell.CELL_TYPE_BOOLEAN:			// Boolean
					value = String.valueOf(cell.getBooleanCellValue()) ;
					break ;
				case Cell.CELL_TYPE_ERROR:				// Error，返回错误码
					value = String.valueOf(cell.getErrorCellValue()) ;
					break ;
				default:value = "" ;break ;
			}
			// 使用[]记录坐标
			return value;
		}

	  
	    /** 
	     * Change excel column letter to integer number 
	     *  
	     * @param columns 
	     *            column letter of excel file, like A,B,AA,AB 
	     * @return 
	     */  
	    private int[] getColumnNumber(String[] columns) {  
	        int[] cols = new int[columns.length];  
	        for(int i=0; i<columns.length; i++) {  
	            cols[i] = getColumnNumber(columns[i]);  
	        }  
	        return cols;  
	    }  
	  
	    /** 
	     * Change excel column letter to integer number 
	     *  
	     * @param column 
	     *            column letter of excel file, like A,B,AA,AB 
	     * @return 
	     */  
	    private int getColumnNumber(String column) {  
	        int length = column.length();  
	        short result = 0;  
	        for (int i = 0; i < length; i++) {  
	            char letter = column.toUpperCase().charAt(i);  
	            int value = letter - 'A' + 1;  
	            result += value * Math.pow(26, length - i - 1);  
	        }  
	        return result - 1;  
	    }  
	  
	    /** 
	     * Change excel column string to integer number array 
	     *  
	     * @param sheet 
	     *            excel sheet 
	     * @param columns 
	     *            column letter of excel file, like A,B,AA,AB 
	     * @return 
	     */  
	    protected int[] getColumnNumber(Sheet sheet, String columns) {  
	        // 拆分后的列为动态，采用List暂存  
	        ArrayList<Integer> result = new ArrayList<Integer> ();  
	        String[] colList = columns.split(SEPARATOR);  
	        for(String colStr : colList){  
	            if(colStr.contains(CONNECTOR)){  
	                String[] colArr = colStr.trim().split(CONNECTOR);  
	                int start = Integer.parseInt(colArr[0]) - 1;  
	                int end;  
	                if(colArr.length == 1){  
	                    end = sheet.getRow(sheet.getFirstRowNum()).getLastCellNum() - 1;  
	                }else{  
	                    end = Integer.parseInt(colArr[1].trim()) - 1;  
	                }  
	                for(int i=start; i<=end; i++) {  
	                    result.add(i);  
	                }  
	            }else{  
	                result.add(Integer.parseInt(colStr) - 1);  
	            }  
	        }  
	          
	        // 将List转换为数组  
	        int len = result.size();  
	        int[] cols = new int[len];   
	        for(int i = 0; i<len; i++) {  
	            cols[i] = result.get(i).intValue();  
	        }  
	  
	        return cols;  
	    }  
}  
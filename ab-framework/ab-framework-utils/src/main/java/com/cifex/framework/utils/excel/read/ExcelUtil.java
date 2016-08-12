package com.cifex.framework.utils.excel.read;//package com.cifex.framework.utils.excel.read;
//
//import java.io.FileInputStream;
//import java.io.FileNotFoundException;
//import java.io.IOException;
//import java.io.InputStream;
//import java.io.OutputStream;
//import java.util.ArrayList;
//import java.util.Date;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import jxl.Cell;
//import jxl.Sheet;
//import jxl.Workbook;
//import jxl.format.UnderlineStyle;
//import jxl.read.biff.BiffException;
//import jxl.write.Label;
//import jxl.write.WritableCellFormat;
//import jxl.write.WritableFont;
//import jxl.write.WritableSheet;
//import jxl.write.WritableWorkbook;
//import jxl.write.WriteException;
//import jxl.write.biff.RowsExceededException;
//
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//
//public class ExcelUtil {
//	/**
//	 * 用于记录日志
//	 */
//	protected static final Logger logger = LoggerFactory.getLogger(ExcelUtil.class);
//	/**
//	 * 
//	 * @param arrtitle 表格的标题数组
//	 * @param list  表格的每行的数据
//	 * @param response 
//	 * @return
//	 */
//	public static boolean expExcel(HttpServletRequest request,HttpServletResponse response,String[] arrtitle,List<Object[]> list,String filename){
//		response.setCharacterEncoding("UTF-8");
//		OutputStream os= null;
//		try {
//			Date date = new Date();
//			os = response.getOutputStream();
//			response.reset();
//			String dfileName = (filename!=null&&!filename.equals(""))?filename:String.valueOf(date.getTime());
//			if(request.getHeader("user-agent").indexOf("MSIE") != -1){
//				 dfileName = java.net.URLEncoder.encode(dfileName,"utf-8") + ".xls";
//			}else{
//				 dfileName = new String(dfileName.getBytes("utf-8"),"iso-8859-1") + ".xls";
//			}
//			response.setHeader("Content-disposition", "attachment; filename="+dfileName);
//			response.setContentType("application/msexcel");
//			// 建立excel文件
//			WritableWorkbook  wb=Workbook.createWorkbook(os);
//			// sheet名称
//			WritableSheet sheet=wb.createSheet("Text1", 0);
//			Label label;
//			// 设置excel标题
//			WritableFont wfont=new WritableFont(WritableFont.ARIAL,12, WritableFont.NO_BOLD, false,
//				    UnderlineStyle.NO_UNDERLINE, jxl.format.Colour.BLACK);
//			WritableCellFormat wcf=new WritableCellFormat (wfont);
//			for(int i=0;i<arrtitle.length;i++){
//				label=new Label(i, 0, arrtitle[i],wcf);
//				sheet.addCell(label);
//				for(int j=0;j<list.size();j++){
//					Object[] arrtemp = list.get(j);
//					label=new Label(i, j+1, arrtemp[i]==null?"":arrtemp[i].toString(),wcf);
//					sheet.addCell(label);
//				}
//			}
//			wb.write();
//			wb.close();
//			return true;
//		} catch (IOException e){
//			e.printStackTrace();
//		} catch (RowsExceededException e) {
//			e.printStackTrace();
//		} catch (WriteException e) {
//			e.printStackTrace();
//		}finally{
//			try {
//				os.flush();
//				os.close();
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//		}
//		return false;
//	}
//	public static boolean expExcelCopy(HttpServletRequest request,HttpServletResponse response,String[] arrtitle,List<Object[]> list,String[] condition,String[] tongji,String filename){
//		response.setCharacterEncoding("UTF-8");
//		OutputStream os= null;
//		try {
//			Date date = new Date();
//			os = response.getOutputStream();
//			response.reset();
//			String dfileName = (filename!=null&&!filename.equals(""))?filename:String.valueOf(date.getTime());
//			if(request.getHeader("user-agent").indexOf("MSIE") != -1){
//				 dfileName = java.net.URLEncoder.encode(dfileName,"utf-8") + ".xls";
//			}else{
//				 dfileName = new String(dfileName.getBytes("utf-8"),"iso-8859-1") + ".xls";
//			}
//			response.setHeader("Content-disposition", "attachment; filename="+dfileName);
//			response.setContentType("application/msexcel");
//			// 建立excel文件
//			WritableWorkbook  wb=Workbook.createWorkbook(os);
//			// sheet名称
//			WritableSheet sheet=wb.createSheet("Text1", 0);
//			Label label;
//			// 设置excel标题
//			WritableFont wfont=new WritableFont(WritableFont.ARIAL,12, WritableFont.NO_BOLD, false,
//				    UnderlineStyle.NO_UNDERLINE, jxl.format.Colour.BLACK);
//			WritableCellFormat wcf=new WritableCellFormat (wfont);
//			for(int j = 0; j < condition.length; j ++){
//				label = new Label(j, 0, condition[j], wcf);
//				sheet.addCell(label);
//			}
//			for(int k = 0; k < tongji.length; k ++){
//				label = new Label(k, 1, tongji[k], wcf);
//				sheet.addCell(label);
//			}
//			for(int i=0;i<arrtitle.length;i++){
//				label=new Label(i, 2, arrtitle[i],wcf);
//				sheet.addCell(label);
//				for(int j=0;j<list.size();j++){
//					Object[] arrtemp = list.get(j);
//					label=new Label(i, j+3, arrtemp[i]==null?"":arrtemp[i].toString(),wcf);
//					sheet.addCell(label);
//				}
//			}
//			wb.write();
//			wb.close();
//			return true;
//		} catch (IOException e){
//			e.printStackTrace();
//		} catch (RowsExceededException e) {
//			e.printStackTrace();
//		} catch (WriteException e) {
//			e.printStackTrace();
//		}finally{
//			try {
//				os.flush();
//				os.close();
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//		}
//		return false;
//	}
//	
//	/**
//	 * 
//	 * @param title 每一列的标题标识(map中的key)
//	 * @param filename 读取的文件的路径
//	 * @return
//	 */
//	public static boolean readExcel(String[] title,String filename){
//		List<Object> list = new ArrayList<Object>();
//		InputStream fs = null;
//		Workbook workBook = null;
//		try {
//		    fs = new FileInputStream(filename);// 加载excel文件
//		    workBook = Workbook.getWorkbook(fs);// 得到 workbook
//		} catch (FileNotFoundException e) {
//		    e.printStackTrace();
//		    return false;
//		} catch (BiffException e) {
//		    e.printStackTrace();
//		    return false;
//		} catch (IOException e) {
//		    e.printStackTrace();
//		    return false;
//		}
//		// 取得sheet，如果你的workbook里有多个sheet可以利用 wb.getSheets()方法来得到所有的。getSheets()方法返回 Sheet[] 数组 然后利用数组来操作。就是多次循环的事。
//		Sheet sheet = workBook.getSheet(0);//这里只取得第一个sheet的值，默认从0开始
//		Cell cell = null;//就是单个单元格
//		// 开始循环，取得 cell 里的内容，这里都是按String来取的 为了省事，具体你自己可以按实际类型来取。
//		for (int j = 0,k = sheet.getRows(); j < k; j++) {
//		    Map<String,Object> maptemp = new HashMap<String,Object>();
//		    for (int i = 0,m = sheet.getColumns(); i < m; i++) {
//		       cell = sheet.getCell(i, j);
//		       maptemp.put(title[i], cell.getContents());
//		       logger.warn(cell.getContents());
//		     }
//		     list.add(maptemp);
//		}
//		workBook.close();
//		return true;
//	}
//	
//	/**
//	 * 
//	 * @param arrtitle 表格的标题数组
//	 * @param list  表格的每行的数据
//	 * @param response 
//	 * @return
//	 */
//	public static boolean expExceltemp(HttpServletRequest request,HttpServletResponse response,String[] arrtitle,List<Object[]> list,String filename,List<Object[]> listtemp,Object[] objtotal){
//		response.setCharacterEncoding("UTF-8");
//		OutputStream os= null;
//		try {
//			Date date = new Date();
//			os = response.getOutputStream();
//			response.reset();
//			String dfileName = (filename!=null&&!filename.equals(""))?filename:String.valueOf(date.getTime());
//			if(request.getHeader("user-agent").indexOf("MSIE") != -1){
//				 dfileName = java.net.URLEncoder.encode(dfileName,"utf-8") + ".xls";
//			}else{
//				 dfileName = new String(dfileName.getBytes("utf-8"),"iso-8859-1") + ".xls";
//			}
//			response.setHeader("Content-disposition", "attachment; filename="+dfileName);
//			response.setContentType("application/msexcel");
//			// 建立excel文件
//			WritableWorkbook  wb=Workbook.createWorkbook(os);
//			// sheet名称
//			WritableSheet sheet=wb.createSheet("Text1", 0);
//			Label label;
//			// 设置excel标题
//			WritableFont wfont=new WritableFont(WritableFont.ARIAL,12, WritableFont.NO_BOLD, false,
//				    UnderlineStyle.NO_UNDERLINE, jxl.format.Colour.BLACK);
//			WritableCellFormat wcf=new WritableCellFormat (wfont);
//			int tempnum = 1;
//			int row=0;
//			int listsize=list.size();
//			for(int i=0;i<arrtitle.length;i++){
//				label=new Label(i, 0, arrtitle[i],wcf);
//				sheet.addCell(label);
//				row=tempnum=1;
//				for(int j=0;j<listsize;j++){
//					Object[] arrtemp = list.get(j);
//					if(tempnum != Integer.parseInt(arrtemp[0].toString())){
//						Object[] arrlisttemp = listtemp.get(tempnum-1);
//						label=new Label(i,row, arrlisttemp[i]==null?"":arrlisttemp[i].toString(),wcf);
//						sheet.addCell(label);
//						tempnum = Integer.parseInt(arrtemp[0].toString());
//						row++;
//					}
//					String content = "";
//					if(arrtemp[i]!=null){
//						if(i==0){
//							switch(Integer.parseInt(arrtemp[i].toString())){
//								case 1:
//									content = "一区";
//									break;
//								case 2:
//									content = "二区";
//									break;
//								case 3:
//									content = "三区";
//									break;
//								case 4:
//									content = "四区";
//									break;
//								case 5:
//									content = "五区";
//									break;
//								case 6:
//									content = "六区";
//									break;
//								case 7:
//									content = "七区";
//									break;
//								case 8:
//									content = "八区";
//									break;
//								case 9:
//									content = "九区";
//									break;
//								case 10:
//									content = "十区";
//									break;
//							}
//						}else{
//							content = arrtemp[i].toString();
//						}
//					}
//					label=new Label(i, row, content,wcf);
//					sheet.addCell(label);
//					row++;
//					if(j+1==listsize){
//						Object[] arrlisttemp = listtemp.get(tempnum-1);
//						label=new Label(i,row, arrlisttemp[i]==null?"":arrlisttemp[i].toString(),wcf);
//						sheet.addCell(label);
//						row++;
//						label=new Label(i,row, objtotal[i]==null?"":objtotal[i].toString(),wcf);
//						sheet.addCell(label);
//					}
//				}
//			}
//			wb.write();
//			wb.close();
//			return true;
//		} catch (IOException e){
//			e.printStackTrace();
//		} catch (RowsExceededException e) {
//			e.printStackTrace();
//		} catch (WriteException e) {
//			e.printStackTrace();
//		}finally{
//			try {
//				os.flush();
//				os.close();
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//		}
//		return false;
//	}
//	
//}

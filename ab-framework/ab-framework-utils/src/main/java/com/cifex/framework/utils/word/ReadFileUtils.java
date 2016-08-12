package com.cifex.framework.utils.word;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.text.NumberFormat;

import org.apache.commons.io.FileUtils;
import org.apache.pdfbox.pdfparser.PDFParser;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.util.PDFTextStripper;
import org.apache.poi.POIXMLDocument;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hwpf.extractor.WordExtractor;
import org.apache.poi.openxml4j.exceptions.OpenXML4JException;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.xslf.extractor.XSLFPowerPointExtractor;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.poi.xwpf.extractor.XWPFWordExtractor;
import org.apache.xmlbeans.XmlException;

public class ReadFileUtils {

	public static void main(String[] args) throws Exception {
		ReadFileUtils rf = new ReadFileUtils();
		String s = "";
//		s = rf.readTXT("E:/itsm文档的后缀名分析报告2.txt");
//		s = rf.readPDF("E:/memcached全面剖析.pdf");
//		s = rf.readEXCEL("E:/副本工作量及成本模板.xls");
//		s = rf.readEXCEL2007("E:/功能点估算方案.xlsx");
//		s = rf.readWORD("E:/pms中文.doc");
		s = rf.readWORD2007("F://test.docx");
//		s = rf.readPPT2007("e:/精细化管理信息系统项目汇报v1.0.pptx");
		System.out.println(s);
	}

	// 读取pptx
	public String readPPT2007(String file) throws IOException, XmlException,
			OpenXML4JException {
		return new XSLFPowerPointExtractor(POIXMLDocument.openPackage(file))
				.getText();
	}

	// 读取xls文件
	@SuppressWarnings("deprecation")
	public String readEXCEL(String file) throws IOException {
		StringBuilder content = new StringBuilder();
		HSSFWorkbook workbook = new HSSFWorkbook(new FileInputStream(file));// 创建对Excel工作簿文件的引用
		for (int numSheets = 0; numSheets < workbook.getNumberOfSheets(); numSheets++) {
			if (null != workbook.getSheetAt(numSheets)) {
				HSSFSheet aSheet = workbook.getSheetAt(numSheets);// 获得一个sheet
				for (int rowNumOfSheet = 0; rowNumOfSheet <= aSheet
						.getLastRowNum(); rowNumOfSheet++) {
					if (null != aSheet.getRow(rowNumOfSheet)) {
						HSSFRow aRow = aSheet.getRow(rowNumOfSheet); // 获得一个行
						for (short cellNumOfRow = 0; cellNumOfRow <= aRow
								.getLastCellNum(); cellNumOfRow++) {
							if (null != aRow.getCell(cellNumOfRow)) {
								HSSFCell aCell = aRow.getCell(cellNumOfRow);// 获得列值
								if (this.convertCell(aCell).length() > 0) {
									content.append(this.convertCell(aCell));
								}
							}
							content.append("\n");
						}
					}
				}
			}
		}
		return content.toString();
	}

	// 读取xlsx文件
	@SuppressWarnings("deprecation")
	public String readEXCEL2007(String file) throws IOException {
		StringBuilder content = new StringBuilder();
		XSSFWorkbook workbook = new XSSFWorkbook(file);
		for (int numSheets = 0; numSheets < workbook.getNumberOfSheets(); numSheets++) {
			if (null != workbook.getSheetAt(numSheets)) {
				XSSFSheet aSheet = workbook.getSheetAt(numSheets);// 获得一个sheet
				for (int rowNumOfSheet = 0; rowNumOfSheet <= aSheet
						.getLastRowNum(); rowNumOfSheet++) {
					if (null != aSheet.getRow(rowNumOfSheet)) {
						XSSFRow aRow = aSheet.getRow(rowNumOfSheet); // 获得一个行
						for (short cellNumOfRow = 0; cellNumOfRow <= aRow
								.getLastCellNum(); cellNumOfRow++) {
							if (null != aRow.getCell(cellNumOfRow)) {
								XSSFCell aCell = aRow.getCell(cellNumOfRow);// 获得列值
								if (this.convertCell(aCell).length() > 0) {
									content.append(this.convertCell(aCell));
								}
							}
							content.append("\n");
						}
					}
				}
			}
		}
		return content.toString();
	}

	private String convertCell(Cell cell) {
		NumberFormat formater = NumberFormat.getInstance();
		formater.setGroupingUsed(false);
		String cellValue = "";
		if (cell == null) {
			return cellValue;
		}

		switch (cell.getCellType()) {
		case HSSFCell.CELL_TYPE_NUMERIC:
			cellValue = formater.format(cell.getNumericCellValue());
			break;
		case HSSFCell.CELL_TYPE_STRING:
			cellValue = cell.getStringCellValue();
			break;
		case HSSFCell.CELL_TYPE_BLANK:
			cellValue = cell.getStringCellValue();
			break;
		case HSSFCell.CELL_TYPE_BOOLEAN:
			cellValue = Boolean.valueOf(cell.getBooleanCellValue()).toString();
			break;
		case HSSFCell.CELL_TYPE_ERROR:
			cellValue = String.valueOf(cell.getErrorCellValue());
			break;
		default:
			cellValue = "";
		}
		return cellValue.trim();
	}

	// 读取pdf文件
	public String readPDF(String file) throws IOException {
		String result = null;
		FileInputStream is = null;
		PDDocument document = null;
		try {
			is = new FileInputStream(file);
			PDFParser parser = new PDFParser(is);
			parser.parse();
			document = parser.getPDDocument();
			PDFTextStripper stripper = new PDFTextStripper();
			result = stripper.getText(document);
		} finally {
			if (is != null) {
				is.close();
			}
			if (document != null) {
				document.close();
			}
		}
		return result;
	}

	// 读取doc文件
	public String readWORD(String file) throws Exception {
		String returnStr = "";
		try {
			WordExtractor wordExtractor = new WordExtractor(
					new FileInputStream(new File(file)));
			returnStr = wordExtractor.getText();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return returnStr;
	}

	// 读取docx文件
	public String readWORD2007(String file) throws Exception {
		return new XWPFWordExtractor(POIXMLDocument.openPackage(file))
				.getText();
	}

	// 读取txt文件
	public String readTXT(String file) throws IOException {
		String encoding = ReadFileUtils.get_charset(new File(file));
		if (encoding.equalsIgnoreCase("GBK")) {
			return FileUtils.readFileToString(new File(file), "gbk");
		} else {
			return FileUtils.readFileToString(new File(file), "utf8");
		}
	}

	private static String get_charset(File file) throws IOException {
		String charset = "GBK";
		byte[] first3Bytes = new byte[3];
		BufferedInputStream bis = null;
		try {
			boolean checked = false;
			bis = new BufferedInputStream(new FileInputStream(file));
			bis.mark(0);
			int read = bis.read(first3Bytes, 0, 3);
			if (read == -1)
				return charset;
			if (first3Bytes[0] == (byte) 0xFF && first3Bytes[1] == (byte) 0xFE) {
				charset = "UTF-16LE";
				checked = true;
			} else if (first3Bytes[0] == (byte) 0xFE
					&& first3Bytes[1] == (byte) 0xFF) {
				charset = "UTF-16BE";
				checked = true;
			} else if (first3Bytes[0] == (byte) 0xEF
					&& first3Bytes[1] == (byte) 0xBB
					&& first3Bytes[2] == (byte) 0xBF) {
				charset = "UTF-8";
				checked = true;
			}
			bis.reset();
			if (!checked) {
				while ((read = bis.read()) != -1) {
					if (read >= 0xF0)
						break;
					if (0x80 <= read && read <= 0xBF) // 单独出现BF以下的，也算是GBK
						break;
					if (0xC0 <= read && read <= 0xDF) {
						read = bis.read();
						if (0x80 <= read && read <= 0xBF) // 双字节 (0xC0 - 0xDF)
							// (0x80
							// - 0xBF),也可能在GB编码内
							continue;
						else
							break;
					} else if (0xE0 <= read && read <= 0xEF) {// 也有可能出错，但是几率较小
						read = bis.read();
						if (0x80 <= read && read <= 0xBF) {
							read = bis.read();
							if (0x80 <= read && read <= 0xBF) {
								charset = "UTF-8";
								break;
							} else
								break;
						} else
							break;
					}
				}
				// System.out.println( loc + " " + Integer.toHexString( read )
				// );
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (bis != null) {
				bis.close();
			}
		}
		return charset;
	}
}

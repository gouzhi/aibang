/**    
 * @filename Html2PdfForFreeMarker.java     
 * @version www.cifex.com.cn    
 * @date 2015年10月12日     
 */
package com.aibang.framework.utils.pdf;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;




import com.aibang.framework.utils.FreeMarkerUtil;
import com.aibang.framework.utils.contract.LoanContract;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.xhtmlrenderer.pdf.ITextFontResolver;
import org.xhtmlrenderer.pdf.ITextRenderer;

import com.lowagie.text.DocumentException;
import com.lowagie.text.Image;
import com.lowagie.text.pdf.BaseFont;
import com.lowagie.text.pdf.PdfContentByte;
import com.lowagie.text.pdf.PdfReader;
import com.lowagie.text.pdf.PdfStamper;

import freemarker.template.TemplateException;

/**
 * 采用Flying Sauser 实现html转化pdf文件。纠错能力差，支持多种中文字体（部分样式不能识别），开源。
 * 采用FreeMarker对html模板进行修改填空
 * 
 * @author zeng.fangfang
 * @date 2015年10月12日
 */
public class Html2PdfForFreeMarker {

	private static ITextRenderer renderer;

	private static ITextFontResolver fontResolver;

	/**
	 * 用于记录日志
	 */
	private static final Logger LOGGER = LoggerFactory
			.getLogger(Html2PdfForFreeMarker.class);

	static {
		renderer = new ITextRenderer();
		fontResolver = renderer.getFontResolver();
		try {
			fontResolver.addFont("simsun.ttc", BaseFont.IDENTITY_H,
					BaseFont.NOT_EMBEDDED);
		} catch (DocumentException e) {
			LOGGER.error("添加字体失败", e);
		} catch (IOException e) {
			LOGGER.error("添加字体失败", e);
		}
	}

	/**
	 * 采用Flying Sauser 实现html转化pdf文件
	 * 
	 * @param outputPDFFilePath
	 *            生成的PDF文件路径
	 * @param htmlDocument
	 *            html代码
	 * @return boolean 成功返回true，失败返回false
	 * @author zeng.fangfang
	 * @date 2015年10月12日
	 */
	public boolean generateHTML2PDF(String outputPDFFilePath,
			String htmlDocument) {
		OutputStream os = null;
		try {
			os = new FileOutputStream(outputPDFFilePath);
			renderer.setDocumentFromString(htmlDocument);
			renderer.layout();
			renderer.createPDF(os);
			LOGGER.info("finish done...");
			return true;
		} catch (Exception e) {
			LOGGER.error("html转化pdf文件失败", e);
		} finally {
			try {
				if(os!=null){
					os.close();
				}

			} catch (IOException e) {
			}
		}
		return false;
	}

	/**
	 * 采用Flying Sauser 实现html转化pdf文件
	 * 
	 * @param outputPDFFilePath
	 *            生成的PDF文件路径
	 * @param ftlFilePath
	 *            ftl文件路径
	 * @param model
	 *            实体map
	 * @param flag true 加水印 false不加
	 * @return boolean 成功返回true，失败返回false
	 * @author zeng.fangfang
	 * @date 2015年10月12日
	 */
	public boolean generateHTML2PDF(String outputPDFFilePath,
			String ftlFilePath, Map<?, ?> model, boolean flag,String contractUrlB) {
		try {
			String htmlDocument = FreeMarkerUtil.execute(ftlFilePath, "UTF-8",
					model);
			String tempOutputPDFFilePath = outputPDFFilePath.substring(0,
					outputPDFFilePath.lastIndexOf("/") + 1)
					+ System.currentTimeMillis()
					+ getRandomNum()
					+ outputPDFFilePath.subSequence(
							outputPDFFilePath.lastIndexOf("."),
							outputPDFFilePath.length());
			this.generateHTML2PDF(tempOutputPDFFilePath, htmlDocument);
			if (flag) {
				this.addPdfMark(tempOutputPDFFilePath, outputPDFFilePath,
						getSrcPath("freemarker/Contract/Watermark.png"),getSrcPath(contractUrlB),getSrcPath("freemarker/Contract/zcgy.png"));
			}
			return true;
		} catch (IOException e) {
			e.printStackTrace();
			LOGGER.error("html转化pdf文件失败", e);
		} catch (TemplateException e) {
			e.printStackTrace();
			LOGGER.error("html转化pdf文件失败", e);
		} catch (Exception e) {
			e.printStackTrace();
			LOGGER.error("html转化pdf文件失败", e);
		}
		return false;
	}

	/**
	 * 获取随机数
	 * 
	 * @return int 获取1000以内的随机数
	 * @author zeng.fangfang
	 * @date 2015年10月12日
	 */
	public synchronized static int getRandomNum() {
		Random random = new Random();
		return random.nextInt(1000);
	}

	/**
	 * 获取文件路径
	 * 
	 * @param name
	 * @return String
	 * @author zeng.fangfang
	 * @date 2015年10月12日
	 */
	public static String getSrcPath(String name) {
		String result = null;
		if(name!=null){
			URL urlpath = Html2PdfForFreeMarker.class.getClassLoader().getResource(
					name);
			String path = urlpath.toString();
			// remove the head "file:",if it exists
			if (path.startsWith("file")) {
				path = path.substring(6);
			}
			path.replace("/", File.separator);
			result = path;

		}

		return result;
	}

	/**
	 * 给pdf文件添加水印
	 * 
	 * @param InPdfFile
	 *            要加水印的原pdf文件路径
	 * @param outPdfFile
	 *            加了水印后要输出的路径
	 * @param markImagePath
	 *            水印图片路径
	 *
	 *            原pdf文件的总页数 直接用reader.getNumberOfPages()获取pdf的总页数
	 * @throws Exception
	 *             void
	 * @author zeng.fangfang
	 * @date 2015年10月12日
	 */
	public void addPdfMark(String InPdfFile, String outPdfFile,
			String markImagePath,String contractImg1,String contractImg2) throws Exception {

		PdfReader reader = new PdfReader(InPdfFile, "PDF".getBytes());
		int pageSize = reader.getNumberOfPages();
		PdfStamper stamp = new PdfStamper(reader, new FileOutputStream(
				outPdfFile));

		Image img = Image.getInstance(markImagePath);// 插入水印

		img.setAbsolutePosition(10, 100);
		// img.setAbsolutePosition(220, 680);
		img.scalePercent(45);
		Image img2 = Image.getInstance(contractImg2);// 合同丙
		img2.setAbsolutePosition(220, 430);
		// img.setAbsolutePosition(220, 680);
		img2.scalePercent(35);
		Image img1 =null;
		if(contractImg1!=null&&contractImg1!=""){
			img1 = Image.getInstance(contractImg1);// 合同乙
			img1.setAbsolutePosition(100, 550);
			// img.setAbsolutePosition(220, 680);
			img1.scalePercent(35);
		}


		for (int i = 1; i <= pageSize; i++) {

			PdfContentByte under = stamp.getUnderContent(i);

			under.addImage(img);

			if(i==pageSize){
				under.addImage(img2);
				if (img1!=null){
					under.addImage(img1);
				}

			}


		}

		stamp.close();// 关闭

		File tempfile = new File(InPdfFile);

		if (tempfile.exists()) {

			tempfile.delete();
		}

	}

	public static void main(String[] args) throws Exception {
		// String htmlDocument = FreeMarkerUtil.execute(
		// "freemarker/Contract/Contract.ftl", "UTF-8", null);
		Html2PdfForFreeMarker forFreeMarker = new Html2PdfForFreeMarker();
		// String filePath =
		// "D:/apache-tomcat-7.0.62/webapps/hjs-web-front-site/upload/admin/";
		// File file = new File(filePath);
		// if (!file.exists()) {
		// file.mkdirs();
		// }
		// filePath = filePath + "1444631380753.pdf";
		// forFreeMarker.generateHTML2PDF("1444631380753.pdf", htmlDocument);
		// forFreeMarker.generateHTML2PDF(filePath, htmlDocument);
		Map<String,Object> paramMap=new HashMap<String,Object>();
		LoanContract loanContract=new LoanContract();
		loanContract.setContractCode("9999999999999999");
		loanContract.setPartyAUserName("北京全超环球商务有限公司");
		loanContract.setPartyAName("华金所");
		loanContract.setBusinessLicence("888888888888888");
		loanContract.setOrganizationCode("777777777777777");
		loanContract.setPartyBUserName("杨万明");
		loanContract.setPartyBName("华金所123");
		loanContract.setIdCardB("110102197202180472");
		loanContract.setLoanMoney(new BigDecimal(20000.00));
		loanContract.setLoanMoneyCapital("两万元");
		loanContract.setLendMoney(new BigDecimal(2000.00));
		loanContract.setLendMoneyCapital("两千元");
		loanContract.setBehoof("企业经营周转");
		loanContract.setRate(5.0);

		loanContract.setBorrowTime(30);


		loanContract.setBorrowTimeType(1);
		loanContract.setBonaType(1);



		loanContract.setDateTime("2015-10-22");
		//缺起息日的属性
		loanContract.setMonthBack("2015-11-31");

		paramMap.put("item",loanContract);
		forFreeMarker.generateHTML2PDF("F:/uuuuuuu2222.pdf",

				"freemarker/Contract/Contract3.ftl", paramMap,true,"freemarker/Contract/dmth.png");



		// forFreeMarker.addPdfMark("F:/thissisaa2222.pdf",
		// "F:/thissisaa2233322.pdf", "F:/pg_0002.jpg");

	}


}

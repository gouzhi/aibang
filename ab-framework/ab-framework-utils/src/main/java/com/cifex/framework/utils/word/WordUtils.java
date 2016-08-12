/**    
 * @filename WordUtils.java     
 * @version www.cifex.com.cn    
 * @date 2015年9月15日     
 */
package com.cifex.framework.utils.word;

import java.awt.Color;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.MalformedURLException;

import javax.imageio.ImageIO;

import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Element;
import com.lowagie.text.Font;
import com.lowagie.text.FontFactory;
import com.lowagie.text.Image;
import com.lowagie.text.PageSize;
import com.lowagie.text.Paragraph;
import com.lowagie.text.pdf.BaseFont;
import com.lowagie.text.rtf.RtfWriter2;

/**      
 * word工具类
 * @author zeng.fangfang    
 * @date 2015年9月15日   
 */
public class WordUtils {

	private Document document;

    private BaseFont bfChinese;

    private int tabsize = 20;// 段首距离

    private int fontsize = 10;// 正常字体大小

    public WordUtils(int tabsize, int fontsize) {
        this.tabsize = tabsize;
        this.fontsize = fontsize;
    }

    /**
     * 开始写入
     * @param filename
     * @throws DocumentException
     * @throws java.io.IOException
     * @author zff  2014-10-15下午6:04:28
     */
    public void beginWrite(String filename) throws DocumentException, IOException {
        document = new Document(PageSize.A4);
        RtfWriter2.getInstance(document, new FileOutputStream(filename));
        document.open();
        try {
            bfChinese = BaseFont.createFont("/usr/local/simsun.ttc,1", BaseFont.IDENTITY_H, BaseFont.NOT_EMBEDDED);//linix
        } catch (Exception e) {
            bfChinese = BaseFont.createFont("STSongStd-Light", "UniGB-UCS2-H", BaseFont.NOT_EMBEDDED);//window
        }
        
    }

    /**
     * 写入完成保存文件
     * @author zff  2014-10-15下午6:04:28
     */
    public void endWrite() {
        if (document != null && document.isOpen()) {
            document.close();
        }
    }

    /**
     * 段落距离
     * @param size
     * @throws DocumentException
     * @author zff  2014-10-15下午6:04:28
     */
    public void writeSpacing() throws DocumentException {
        Paragraph paragraph = new Paragraph();
        paragraph.setSpacingAfter(20);
        document.add(paragraph);
    }

    /**
     * 黑体居中
     * 
     * @param txt
     * @param fontSize
     * @throws DocumentException
     * @author zff  2014-10-15下午6:04:28
     */
    public void writeBlodCenter(String txt, int fontSize) throws DocumentException {
        Paragraph paragraph = new Paragraph(txt);
        paragraph.setAlignment(Element.ALIGN_CENTER);
        paragraph.setFont(getFont(fontSize, Font.BOLD));
        document.add(paragraph);
    }

    /**
     * 黑体靠左
     * 
     * @param txt
     * @param fontSize
     * @throws DocumentException
     * @author zff  2014-10-15下午6:04:28
     */
    public void writeBlodLeft(String txt, int fontSize) throws DocumentException {
        Paragraph paragraph = new Paragraph(txt);
        paragraph.setAlignment(Element.ALIGN_LEFT);
        paragraph.setFont(getFont(fontSize, Font.BOLD));
        document.add(paragraph);
    }

    /**
     * 黑体靠右
     * 
     * @param txt
     * @param fontSize
     * @throws DocumentException
     * @author zff  2014-10-15下午6:04:28
     */
    public void writeBlodRight(String txt, int fontSize) throws DocumentException {
        Paragraph paragraph = new Paragraph(txt);
        paragraph.setAlignment(Element.ALIGN_RIGHT);
        paragraph.setFont(getFont(fontSize, Font.BOLD));
        document.add(paragraph);
    }

    /**
     * 正常字体
     * 
     * @param txt
     * @throws DocumentException
     * @author zff  2014-10-15下午6:04:28
     */
    public void writeNormal(String txt) throws DocumentException {
        Paragraph paragraph = new Paragraph(txt);
        paragraph.setAlignment(Element.ALIGN_LEFT);
        paragraph.setFirstLineIndent(tabsize);
        paragraph.setFont(getFont(fontsize, Font.NORMAL));
        document.add(paragraph);
    }
    
    /**
     * 写标签  
     * @param txt
     * @throws DocumentException void   
     * @author zff  2014-10-15下午6:04:28
     */
    public void writeTagName(String txt, int fontSize)throws DocumentException{
        Paragraph paragraph = new Paragraph(txt,new Font(Font.NORMAL, fontSize, Font.NORMAL, new Color(255, 0, 0)));
        paragraph.setAlignment(Element.ALIGN_LEFT);
        paragraph.setFont(getFont(fontsize, Font.NORMAL));
        document.add(paragraph);
    }

    /**
     * 插入图片(居中)
     * @param absPath
     * @throws java.net.MalformedURLException
     * @throws java.io.IOException
     * @throws DocumentException
     * @author zff  2014-10-15下午6:04:28
     */
    public void writeImgMiddle(String absPath) throws MalformedURLException, IOException, DocumentException {
        BufferedImage image = ImageIO.read(new File(absPath));
        Image img = Image.getInstance(absPath);
        int prec = 0;
        int newWidth = 0;
        if (image.getWidth(null) > 500) {
            newWidth = 500;
            double t = (double) newWidth
                    / (double) image.getWidth(null);
            prec = (int) (t * 100) - 8;
        }
        img.setAbsolutePosition(0, 0);
        img.setAlignment(Image.MIDDLE);// 设置图片显示位置
        img.scalePercent(prec);
        img.setRotation(0);// 图像旋转一定角度
        document.add(img);
    }
    
    /**
     * 插入图片(居左)
     * @param absPath
     * @throws java.net.MalformedURLException
     * @throws java.io.IOException
     * @throws DocumentException
     * @author zff  2014-10-15下午6:04:28
     */
    public void writeImgLeft(String absPath) throws MalformedURLException, IOException, DocumentException {
        BufferedImage image = ImageIO.read(new File(absPath));
        Image img = Image.getInstance(absPath);
        int prec = 0;
        int newWidth = 0;
        if (image.getWidth(null) > 500) {
            newWidth = 500;
            double t = (double) newWidth
                    / (double) image.getWidth(null);
            prec = (int) (t * 100) - 8;
        }
        img.setAbsolutePosition(0, 0);
        img.setAlignment(Image.LEFT);// 设置图片显示位置
        img.scalePercent(prec);
        img.setRotation(0);// 图像旋转一定角度
        document.add(img);
    }
    
    /**
     * 插入图片(居右)
     * @param absPath
     * @throws java.net.MalformedURLException
     * @throws java.io.IOException
     * @throws DocumentException
     * @author zff  2014-10-15下午6:04:28
     */
    public void writeImgRight(String absPath) throws MalformedURLException, IOException, DocumentException {
        BufferedImage image = ImageIO.read(new File(absPath));
        Image img = Image.getInstance(absPath);
        int prec = 0;
        int newWidth = 0;
        if (image.getWidth(null) > 500) {
            newWidth = 500;
            double t = (double) newWidth
                    / (double) image.getWidth(null);
            prec = (int) (t * 100) - 8;
        }
        img.setAbsolutePosition(0, 0);
        img.setAlignment(Image.RIGHT);// 设置图片显示位置
        img.scalePercent(prec);
        img.setRotation(0);// 图像旋转一定角度
        document.add(img);
    }
    
    /**
     * 蓝色下划线  （靠右）
     * @param txt
     * @param fontSize
     * @throws DocumentException void   
     * @author zff  2014-10-15下午6:35:45
     */
    public void writeUnderLine(String txt,int fontSize) throws DocumentException{
        Font font = FontFactory.getFont(FontFactory.HELVETICA_BOLDOBLIQUE, fontSize,Font.UNDERLINE, new Color(0, 0, 255));
        Paragraph paragraph = new Paragraph(txt,font);
        paragraph.setAlignment(Element.ALIGN_RIGHT);
        document.add(paragraph);
    }

    private Font getFont(int fontsize, int fontweight) {
        Font font = new Font(bfChinese, fontsize, fontweight);
        return font;
    }
}

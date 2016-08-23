package com.aibang.framework.pay.weixin.common;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.stream.XMLEventReader;
import javax.xml.stream.XMLInputFactory;
import javax.xml.stream.XMLStreamException;
import javax.xml.stream.events.XMLEvent;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import com.thoughtworks.xstream.XStream;

/**
 * User: rising
 * Date: 2014/11/1
 * Time: 14:06
 */
public class XMLParser {

	/**
	 * 解析xml
	 * @param xmlString	xml类型数据
	 * @return	map map集合
	 * @throws ParserConfigurationException
	 * @throws IOException
	 * @throws SAXException Map<String,Object>
	 * @author maoruxin
	 * @date 2016年6月30日
	 */
    public static Map<String,Object> getMapFromXML(String xmlString) throws ParserConfigurationException, IOException, SAXException {

        //这里用Dom的方式解析回包的最主要目的是防止API新增回包字段
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();
        InputStream is =  getStringStream(xmlString);
        Document document = builder.parse(is);

        //获取到document里面的全部结点
        NodeList allNodes = document.getFirstChild().getChildNodes();
        Node node;
        Map<String, Object> map = new HashMap<String, Object>();
        int i=0;
        while (i < allNodes.getLength()) {
            node = allNodes.item(i);
            if(node instanceof Element){
                map.put(node.getNodeName(),node.getTextContent());
            }
            i++;
        }
        return map;

    }
    /**
     * XML数据映射到Java对象
     * @param xml
     * @param tClass
     * @return Object
     * @author maoruxin
     * @date 2016年6月30日
     */
    @SuppressWarnings("rawtypes") 
    public static Object getObjectFromXML(String xml, Class tClass) {
        //将从API返回的XML数据映射到Java对象
        XStream xStreamForResponseData = new XStream();
        xStreamForResponseData.alias("xml", tClass);
        xStreamForResponseData.ignoreUnknownElements();//暂时忽略掉一些新增的字段
        return xStreamForResponseData.fromXML(xml);
    }
    
    /**
     * 解析微信发来的请求（XML）
     * @param request	
     * @return Map<String,String>
     * @author maoruxin
     * @date 2016年6月30日
     */
	public static Map<String, String> parseXml(HttpServletRequest request) {
		// 将解析结果存储在HashMap中
		Map<String, String> map = new HashMap<String, String>();

		// 从request中取得输入流
		InputStream inputStream = null;
		try {
			inputStream = request.getInputStream();
			XMLInputFactory factory = XMLInputFactory.newInstance();
			XMLEventReader reader = factory.createXMLEventReader(inputStream);
			while (reader.hasNext()) {
				XMLEvent event = reader.nextEvent();
				if (event.isStartElement()) {
					String tagName = event.asStartElement().getName()
							.toString();
					if (!tagName.equals("xml")) {
						String text = reader.getElementText();
						map.put(tagName, text);
					}
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		} catch (XMLStreamException e) {
			e.printStackTrace();
		} finally {
			// 释放资源
			try {
				if (inputStream != null) {
					inputStream.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return map;
	}
    
	/**
	 * 字符串转化为字节流
	 * @param sInputString
	 * @return InputStream
	 * @author maoruxin
	 * @date 2016年6月30日
	 */
    public static InputStream getStringStream(String sInputString) {
        ByteArrayInputStream tInputStringStream = null;
        if (sInputString != null && !sInputString.trim().equals("")) {
            tInputStringStream = new ByteArrayInputStream(sInputString.getBytes());
        }
        return tInputStringStream;
    }
    
    /**
     * 用DOM方式组装返给微信的xml数据
     * @param code	状态码
     * @param msg	信息
     * @return String
     * @author maoruxin
     * @date 2016年6月30日
     */
    public static String wxResult(String code, String msg){
		String resultString = "";
		Document doc;
        Element xml;
        Element returnCode;
        Element returnMsg;
        try {
        	//得到DOM解析器的工厂实例
            DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
            //从DOM工厂中或得DOM解析器
            DocumentBuilder dbBuilder = dbFactory.newDocumentBuilder();
            //创建文档树模型对象
            doc = dbBuilder.newDocument();
            if(doc != null){
            	xml = doc.createElement("xml");
            	returnCode = doc.createElement("return_code");
            	returnMsg = doc.createElement("return_msg");
            	returnCode.appendChild(doc.createTextNode(code));
            	returnMsg.appendChild(doc.createTextNode(msg));
            	xml.appendChild(returnCode);
            	xml.appendChild(returnMsg);
            	doc.appendChild(xml);
            	TransformerFactory transformerFactory = TransformerFactory.newInstance();  
                Transformer transformer = transformerFactory.newTransformer();  
                DOMSource source = new DOMSource(doc);  
                ByteArrayOutputStream bos = new ByteArrayOutputStream();
                transformer.transform(source, new StreamResult(bos));  
                resultString = bos.toString();
            }
            
		} catch (Exception e) {
			// TODO: handle exception
		}
        return resultString;
	}
}

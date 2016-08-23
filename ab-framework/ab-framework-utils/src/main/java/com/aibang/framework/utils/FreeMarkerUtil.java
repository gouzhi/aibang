package com.aibang.framework.utils;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.StringWriter;
import java.io.Writer;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
/**
 * FreeMarker工具
 * @classname FreeMarkerUtil    
 * @description FreeMarker工具 
 * @author liuj    
 * @date 2015年9月25日
 */
public class FreeMarkerUtil {
	private static final Logger LOG = LoggerFactory.getLogger(FreeMarkerUtil.class);
    /**
     * 初始化配置
     */
    @SuppressWarnings("deprecation")
	private static final Configuration CONFIGURATION = new Configuration() {
        {
            setClassForTemplateLoading(FreeMarkerUtil.class, "/");
            setDefaultEncoding("utf-8");
        }
    };

    /**
     * 执行
     * @param config                配置信息
     * @param modelName             模板名字
     * @param encoding              编码
     * @param root                  map
     * @return                      填充后的文本
     * @throws java.io.IOException  文件操作异常
     * @throws TemplateException    填充异常
     */
    public static String execute(Configuration config, String modelName,
            String encoding, Map<?, ?> root) throws IOException,
            TemplateException {

		BufferedWriter writer = null;

		try {
			Template tp = config.getTemplate(modelName, encoding);

			StringWriter stringWriter = new StringWriter();
			writer = new BufferedWriter(stringWriter);
			tp.setEncoding(encoding);
			tp.process(root, writer);
			return stringWriter.toString();
		} finally {
			if (null != writer) {
				writer.flush();
				writer.close();
			}

		}

	}

	/**
	 * 执行
	 * 
	 * @param config      配置信息
	 * @param modelName   模板名字
	 * @param encoding    编码
	 * @param root map
	 * @param outputStream         输出流
	 * @throws TemplateException   填充异常
	 * @throws java.io.IOException 文件操作异常
	 */
	public static void execute(Configuration config, String modelName,
			String encoding, Map<?, ?> root, FileOutputStream outputStream)
			throws TemplateException, IOException {

		Writer out = null;

		try {

			// 合并数据模型与模板
			out = new OutputStreamWriter(outputStream, encoding);

			// 获取模板,并设置编码方式，这个编码必须要与页面中的编码格式一致
			config.getTemplate(modelName, encoding).process(root, out);

		} finally {

			try {
				out.flush();
				out.close();
				outputStream.flush();
				outputStream.close();
			} catch (IOException e) {
				LOG.error("关闭输出流失败！", e);
			}

		}

	}

	/**
	 * 执行
	 * 
	 * @param config   配置信息
	 * @param name     模板名字
	 * @param encoding 编码
	 * @param root  map
	 * @param file  保存至文件
	 * @throws TemplateException   填充异常
	 * @throws java.io.IOException 文件操作异常
	 */
	public static void execute(Configuration config, String name,
			String encoding, Map<?, ?> root, File file)
			throws TemplateException, IOException {
		execute(config, name, encoding, root, new FileOutputStream(file));
	}

	/**
	 * 执行
	 * 
	 * @param config     配置信息
	 * @param modelName  模板名字
	 * @param encoding   编码
	 * @param root  map
	 * @param filePathName          文件保存路径
	 * @throws TemplateException    填充异常
	 * @throws java.io.IOException  文件操作异常
	 */
	public static void execute(Configuration config, String modelName,
			String encoding, Map<?, ?> root, String filePathName)
			throws TemplateException, IOException {
		execute(config, modelName, encoding, root, new FileOutputStream(
				filePathName));
	}

	/**
	 * 执行
	 * 
	 * @param modelName  模板名字
	 * @param encoding  编码
	 * @param root  map
	 * @param filePathName 文件保存路径
	 * @throws TemplateException  填充异常
	 * @throws java.io.IOException 文件操作异常
	 */
	public static void execute(String modelName, String encoding,
			Map<?, ?> root, String filePathName) throws TemplateException,
			IOException {
		execute(CONFIGURATION, modelName, encoding, root, new FileOutputStream(
				filePathName));
	}

	/**
	 * 执行
	 * 
	 * @param modelName 模板名字
	 * @param encoding  编码
	 * @param root  map
	 * @return 填充后的文本
	 * @throws java.io.IOException 文件操作异常
	 * @throws TemplateException 填充异常
	 */
	public static String execute(String modelName, String encoding,
			Map<?, ?> root) throws IOException, TemplateException {
		return execute(CONFIGURATION, modelName, encoding, root);
	}
}

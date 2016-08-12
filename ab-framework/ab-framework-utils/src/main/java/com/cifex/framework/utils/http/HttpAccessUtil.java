/**    
 * @filename HttpAccessUtil.java     
 * @version www.cifex.com.cn    
 * @date 2015年8月27日     
 */
package com.cifex.framework.utils.http;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.ObjectOutputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.log4j.Logger;

import com.cifex.framework.exception.FrameworkException;

/**
 * Http 请求访问工具类
 * 
 * @author zeng.fangfang
 * @date 2015年8月27日
 */
public class HttpAccessUtil {

	/**
	 * 日志
	 */
	private static Logger log = Logger.getLogger(HttpAccessUtil.class);
	private static final String parameterJoin = "&";
	private static final String parameterEqual = "=";

	/**
	 * 发起http请求并获取结果
	 * 
	 * @param requestUrl
	 *            请求地址
	 * @param mimeTypes
	 *            enum MimeTypes
	 * @param requestMethod
	 *            请求方式（GET、POST）
	 * @param connTimeoutMills
	 *            设置连接主机超时，单位：毫秒
	 * @param readTimeoutMills
	 *            设置从主机读取数据超时，单位：毫秒
	 * @param attachments
	 *            附加提交的数据，可以是单字符串{"json":"value"} 或者 多个参数遵循 A=a&B=b格式
	 * 
	 * @return remoteHttps 返回的结果
	 */
	public static String httpRequest(String requestUrl, MimeTypes mimeTypes,
			String requestMethod, int connTimeoutMills, int readTimeoutMills,
			String attachments) throws Exception {
		HttpURLConnection httpUrlConn = null;
		InputStream inputStream = null;
		InputStreamReader inputStreamReader = null;
		BufferedReader bufferedReader = null;
		// PS:其实亦可以统一使用ObjectOutputStream，因为String也是impl Serializable
		OutputStream outputStream = null;
		StringBuffer buffer = new StringBuffer();
		try {
			URL url = new URL(requestUrl);
			httpUrlConn = (HttpURLConnection) url.openConnection();
			// 设置content_type
			httpUrlConn.setRequestProperty("Content-Type",
					mimeTypes.getMimeType());
			httpUrlConn.setConnectTimeout(connTimeoutMills);
			httpUrlConn.setReadTimeout(readTimeoutMills);
			// 设置是否向httpUrlConn输出，因为兼容post请求，参数要放在http正文内，因此需要设为true,
			// 默认情况下是false
			httpUrlConn.setDoOutput(true);
			// 设置是否从httpUrlConn读入，默认情况下是true
			httpUrlConn.setDoInput(true);
			httpUrlConn.setUseCaches(false);

			// 设置请求方式（GET/POST），默认是GET
			httpUrlConn.setRequestMethod(requestMethod);
			// 完成相关配置后，进行connect操作，实际上只是建立了一个与服务器的tcp连接，并没有实际发送http请求
			httpUrlConn.connect();

			// 当有额外数据需要提交时
			if (StringUtils.isNotBlank(attachments)) {
				// 此处getOutputStream会隐含的进行connect，即：如同调用上面的connect()方法，
				// 所以在开发中不调用上述的connect()也可以，不过建议最好显式调用
				outputStream = httpUrlConn.getOutputStream();
				// 注意编码格式，防止中文乱码
				outputStream.write(attachments.getBytes("UTF-8"));
				outputStream.flush();
				// outputStream不是一个网络流，充其量是个字符串流，往里面写入的东西不会立即发送到网络，
				// 而是存在于内存缓冲区中，待outputStream流关闭时，根据输入的内容生成http正文。所以这里的close是必须的
				outputStream.close();
			}
			// 将返回的输入流转换成字符串
			// 无论是post还是get，http请求实际上直到HttpURLConnection的getInputStream()这个函数里面才正式发送出去
			inputStream = httpUrlConn.getInputStream();// 注意，实际发送请求的代码段就在这里
			inputStreamReader = new InputStreamReader(inputStream, "UTF-8");
			bufferedReader = new BufferedReader(inputStreamReader);

			String str = null;
			while ((str = bufferedReader.readLine()) != null) {
				buffer.append(str);
			}
		} catch (Exception e) {
			log.error(requestMethod + " " + requestUrl + " error ", e);
			throw e;
		} finally {
			try {
				IOUtils.closeQuietly(bufferedReader);
				IOUtils.closeQuietly(inputStreamReader);
				IOUtils.closeQuietly(inputStream);
				IOUtils.closeQuietly(outputStream);
				if (httpUrlConn != null) {
					httpUrlConn.disconnect();
				}
			} catch (Exception e) {
				log.error(e);
			}
		}
		return buffer.toString();
	}

	/**
	 * 采取post方式提交序列化后的object对象 </br>
	 * 
	 * @param requestUrl
	 *            请求地址
	 * @param connTimeoutMills
	 *            设置连接主机超时，单位：毫秒
	 * @param readTimeoutMills
	 *            设置从主机读取数据超时，单位：毫秒
	 * @param serializedObject
	 *            序列化后的object对象
	 * 
	 * @return remoteHttp返回的结果
	 */
	public static String httpPostSerialObject(String requestUrl,
			int connTimeoutMills, int readTimeoutMills, Object serializedObject)
			throws Exception {
		HttpURLConnection httpUrlConn = null;
		InputStream inputStream = null;
		InputStreamReader inputStreamReader = null;
		BufferedReader bufferedReader = null;
		ObjectOutputStream oos = null;
		StringBuffer buffer = new StringBuffer();
		try {
			URL url = new URL(requestUrl);
			httpUrlConn = (HttpURLConnection) url.openConnection();
			// 设置content_type=SERIALIZED_OBJECT
			// 如果不设此项,在传送序列化对象时,当WEB服务默认的不是这种类型时可能抛java.io.EOFException
			httpUrlConn.setRequestProperty("Content-Type",
					MimeTypes.SERIALIZED_OBJECT.getMimeType());
			httpUrlConn.setConnectTimeout(connTimeoutMills);
			httpUrlConn.setReadTimeout(readTimeoutMills);
			// 设置是否向httpUrlConn输出，因为是post请求，参数要放在http正文内，因此需要设为true, 默认情况下是false
			httpUrlConn.setDoOutput(true);
			// 设置是否从httpUrlConn读入，默认情况下是true
			httpUrlConn.setDoInput(true);
			// 不使用缓存
			httpUrlConn.setUseCaches(false);

			// 设置请求方式，默认是GET
			httpUrlConn.setRequestMethod("POST");
			httpUrlConn.connect();

			if (serializedObject != null) {
				// 此处getOutputStream会隐含的进行connect，即：如同调用上面的connect()方法，
				// 所以在开发中不调用上述的connect()也可以，不过建议最好显式调用
				// write object(impl Serializable) using ObjectOutputStream
				oos = new ObjectOutputStream(httpUrlConn.getOutputStream());
				oos.writeObject(serializedObject);
				oos.flush();
				// outputStream不是一个网络流，充其量是个字符串流，往里面写入的东西不会立即发送到网络，
				// 而是存在于内存缓冲区中，待outputStream流关闭时，根据输入的内容生成http正文。所以这里的close是必须的
				oos.close();
			}
			// 将返回的输入流转换成字符串
			// 无论是post还是get，http请求实际上直到HttpURLConnection的getInputStream()这个函数里面才正式发送出去
			inputStream = httpUrlConn.getInputStream();// 注意，实际发送请求的代码段就在这里
			inputStreamReader = new InputStreamReader(inputStream, "UTF-8");
			bufferedReader = new BufferedReader(inputStreamReader);

			String str = null;
			while ((str = bufferedReader.readLine()) != null) {
				buffer.append(str);
			}
		} catch (Exception e) {
			log.error(requestUrl + " error ", e);
			throw e;
		} finally {
			try {
				IOUtils.closeQuietly(bufferedReader);
				IOUtils.closeQuietly(inputStreamReader);
				IOUtils.closeQuietly(inputStream);
				IOUtils.closeQuietly(oos);
				if (httpUrlConn != null) {
					httpUrlConn.disconnect();
				}
			} catch (Exception e) {
				log.error(e);
			}
		}
		return buffer.toString();
	}

	public static String makeUrl(String baseUrl,
			Map<String, String> parameterMap) {
		StringBuffer parasb = new StringBuffer(baseUrl);
		if (null != parameterMap) {
			parasb.append("?");
			for (Map.Entry<String, String> entry : parameterMap.entrySet()) {
				parasb.append(entry.getKey()).append(parameterEqual)
						.append(entry.getValue()).append(parameterJoin);

			}
		}
		return parasb.substring(0, parasb.length() - 1);
	}

	public static String appendParameter(String baseUrl,
			Map<String, String> parameterMap) {
		StringBuffer parasb = new StringBuffer(baseUrl);
		if (null != parameterMap) {
			parasb.append(parameterJoin);
			for (Map.Entry<String, String> entry : parameterMap.entrySet()) {
				String val = "";
				try {
					if(entry.getValue() != null){
						val = URLEncoder.encode(entry.getValue(), "UTF-8");
					}
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
					val = entry.getValue();
				}
				parasb.append(entry.getKey()).append(parameterEqual)
						.append(val)
						.append(parameterJoin);

			}
		}
		return parasb.substring(0, parasb.length() - 1);
	}

	public static String get(String url) throws Exception {

		CloseableHttpClient httpclient = HttpClients.createDefault();
		CloseableHttpResponse response = null;
		log.info("调用url：" + url);
		try {
			HttpGet httpGet = new HttpGet(url);
			response = httpclient.execute(httpGet);
			InputStream inputStream = response.getEntity().getContent();
			BufferedReader rd = new BufferedReader(new InputStreamReader(
					inputStream));

			String line = "";
			StringBuffer resultString = new StringBuffer();
			while ((line = rd.readLine()) != null) {
				resultString.append(line);
			}

			log.info(url + "回复:" + resultString.toString());

			return resultString.toString();
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new FrameworkException("发送请求错误:" + e.getMessage());
		} finally {
			try {
				response.close();
				httpclient.close();
			} catch (Exception ignore) {
			}
		}
	}

	public static String get(String url, Map<String, String> params)
			throws Exception {

		CloseableHttpClient httpclient = HttpClients.createDefault();
		CloseableHttpResponse response = null;
		log.info("调用url：" + url);
		try {
			String newUrl = appendParameter(url, params);
			HttpGet httpGet = new HttpGet(newUrl);
			response = httpclient.execute(httpGet);
			InputStream inputStream = response.getEntity().getContent();
			BufferedReader rd = new BufferedReader(new InputStreamReader(
					inputStream));

			String line = "";
			StringBuffer resultString = new StringBuffer();
			while ((line = rd.readLine()) != null) {
				resultString.append(line);
			}

			log.info(url + "回复:" + resultString.toString());

			return resultString.toString();
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new FrameworkException("发送请求错误:" + e.getMessage());
		} finally {
			try {
				response.close();
				httpclient.close();
			} catch (Exception ignore) {
			}
		}
	}

	public static String post(String url, Map<String, String> params)
			throws Exception {

		log.info("调用参数：" + params);

		CloseableHttpClient httpclient = HttpClients.createDefault();
		CloseableHttpResponse response = null;
		try {
			List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(1);
			for (String key : params.keySet()) {
				nameValuePairs
						.add(new BasicNameValuePair(key, params.get(key)));
			}
			HttpPost httpPost = new HttpPost(url);
			httpPost.setEntity(new UrlEncodedFormEntity(nameValuePairs, "utf-8"));

			response = httpclient.execute(httpPost);
			InputStream inputStream = response.getEntity().getContent();
			BufferedReader rd = new BufferedReader(new InputStreamReader(
					inputStream));

			String line = "";
			StringBuffer resultString = new StringBuffer();
			while ((line = rd.readLine()) != null) {
				resultString.append(line);
			}
			log.info("回复:"
					+ URLDecoder.decode(resultString.toString(), "UTF-8"));

			return resultString.toString();
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new FrameworkException("发送请求错误:" + e.getMessage());
		} finally {
			try {
				response.close();
				httpclient.close();
			} catch (Exception ignore) {
			}
		}
	}
	/**
	 * for test
	 * 
	 * @param args
	 * @see
	 */
	public static void main(String[] args) throws Exception {
		log.info(httpRequest("http://172.11.1.248",
				MimeTypes.TXT, "POST", 100000, 100000,
				"access_token=30865F078C9327C4"));
	}
}

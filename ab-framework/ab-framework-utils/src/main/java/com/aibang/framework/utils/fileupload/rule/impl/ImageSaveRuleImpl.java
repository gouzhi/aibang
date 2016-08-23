/**    
 * @filename ImageSaveRuleImpl.java     
 * @version www.cifex.com.cn    
 * @date 2015年8月12日     
 */
package com.aibang.framework.utils.fileupload.rule.impl;

import java.awt.image.BufferedImage;
import java.io.File;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import net.coobird.thumbnailator.Thumbnails;

import com.aibang.framework.utils.fileupload.rule.IImageSaveRule;
import com.aibang.framework.utils.fileupload.rule.ReturnResult;

/**    
 * @classname ImageSaveRuleImpl    
 * @description 图片保存规则 
 * @author zeng.fangfang    
 * @date 2015年8月12日   
 */
public class ImageSaveRuleImpl implements IImageSaveRule {

	@Override
	public ReturnResult uploadImage(HttpServletRequest request,
			ReturnResult returnResult, File destFile, String userPath)
			throws Exception {
		String isthrum = request.getParameter("isthrum");//生成缩略图
		String thrumone_w = request.getParameter("thrumone_w");
		/** 第一张宽 */
		String thrumone_h = request.getParameter("thrumone_h");
		/** 第一张高 */
		/*String thrumtwo_w = request.getParameter("thrumtwo_w");
		*//***//*
		String thrumtwo_h = request.getParameter("thrumtwo_h");
		*//***//*
		String thrumthree_w = request.getParameter("thrumthree_w");
		*//***//*
		String thrumthree_h = request.getParameter("thrumthree_h");*/
		Map<String, String> data = returnResult.getData();
		String savePath = data.get("savePath");
		savePath = savePath.substring(0,savePath.lastIndexOf("/"));
		if (isthrum != null && isthrum.equals("1")) {
			if (thrumone_w != null
					&& !thrumone_w.trim().equals("")
					&& !thrumone_w.trim().equals("0")
					&& thrumone_h != null
					&& !thrumone_h.trim().equals("")
					&& !thrumone_h.trim().equals("0")) {// 生第一张
				 
				String thrumone =resizeImage(destFile, Integer.parseInt(thrumone_w), Integer.parseInt(thrumone_h), new File(destFile.getParent()+"/thrumone_"+destFile.getName()));
				data.put("thrumone", savePath+"/"+thrumone);
			}
			/*if (thrumtwo_w != null
					&& !thrumtwo_w.trim().equals("")
					&& !thrumtwo_w.trim().equals("0")
					&& thrumtwo_h != null
					&& !thrumtwo_h.trim().equals("")
					&& !thrumtwo_h.trim().equals("0")) {// 生第二张
				String thrumtwo =resizeImage(destFile, Integer.parseInt(thrumtwo_w), Integer.parseInt(thrumtwo_h), new File(destFile.getParent()+"/thrumtwo_"+destFile.getName()));
				data.put("thrumtwo", savePath+"/"+thrumtwo);
			}
			if (thrumthree_w != null
					&& !thrumthree_w.trim().equals("")
					&& !thrumthree_w.trim().equals("0")
					&& thrumthree_h != null
					&& !thrumthree_h.trim().equals("")
					&& !thrumthree_h.trim().equals("0")) {// 生第二张
				String thrumthree =resizeImage(destFile, Integer.parseInt(thrumthree_w), Integer.parseInt(thrumthree_h), new File(destFile.getParent()+"/thrumthree_"+destFile.getName()));
				data.put("thrumthree", savePath+"/"+thrumthree);
			}*/
		}
		return returnResult;
	}
	
	private String resizeImage(File sourcefile, int width, int height,
			File destFile) throws Exception {
		BufferedImage sourceImage = ImageIO.read(sourcefile);
		if (sourceImage.getWidth() == width
				&& sourceImage.getHeight() == height) {
			Thumbnails.of(sourceImage).size(width, height)
			.keepAspectRatio(true).outputQuality(1f).toFile(destFile);
			return destFile.getName();
		} else {
			Thumbnails.of(sourceImage).size(width, height)
					.keepAspectRatio(true).outputQuality(0.8f).toFile(destFile);
			return destFile.getName();
		}

	}

}

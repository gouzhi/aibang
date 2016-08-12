/*
 * Powered By [cifex-framework]
 * Web Site: http://www.cifex.com
 * Since 2015 - 2015
 */

package com.cifex.transfer.model.education.dto;
import java.io.Serializable;


import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.cifex.framework.utils.DateConvertUtils;
import com.cifex.transfer.model.BaseEntity;


public class JcContentExt extends BaseEntity implements Serializable{
	
	/**    
	 * serialVersionUID     
	 * @since Ver 1.1    
	 */    
	
	private static final long serialVersionUID = -4868874276390411654L;
	//alias
	public static final String TABLE_ALIAS = "JcContentExt";
	public static final String ALIAS_CONTENT_ID = "contentId";
	public static final String ALIAS_TITLE = "标题";
	public static final String ALIAS_SHORT_TITLE = "简短标题";
	public static final String ALIAS_AUTHOR = "作者";
	public static final String ALIAS_ORIGIN = "来源";
	public static final String ALIAS_ORIGIN_URL = "来源链接";
	public static final String ALIAS_DESCRIPTION = "描述";
	public static final String ALIAS_RELEASE_DATE = "发布日期";
	public static final String ALIAS_MEDIA_PATH = "媒体路径";
	public static final String ALIAS_MEDIA_TYPE = "媒体类型";
	public static final String ALIAS_TITLE_COLOR = "标题颜色";
	public static final String ALIAS_IS_BOLD = "是否加粗";
	public static final String ALIAS_TITLE_IMG = "标题图片";
	public static final String ALIAS_CONTENT_IMG = "内容图片";
	public static final String ALIAS_TYPE_IMG = "类型图片";
	public static final String ALIAS_LINK = "外部链接";
	public static final String ALIAS_TPL_CONTENT = "指定模板";
	public static final String ALIAS_NEED_REGENERATE = "需要重新生成静态页";
	
	//date formats
	public static final String FORMAT_RELEASE_DATE = DATE_FORMAT;
	
	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
    /**
     * contentId       db_column: content_id 
     */	
	private Integer contentId;
    /**
     * 标题       db_column: title 
     */	
	private String title;
    /**
     * 简短标题       db_column: short_title 
     */	
	private String shortTitle;
    /**
     * 作者       db_column: author 
     */	
	private String author;
    /**
     * 来源       db_column: origin 
     */	
	private String origin;
    /**
     * 来源链接       db_column: origin_url 
     */	
	private String originUrl;
    /**
     * 描述       db_column: description 
     */	
	private String description;
    /**
     * 发布日期       db_column: release_date 
     */	
	private java.util.Date releaseDate;
    /**
     * 媒体路径       db_column: media_path 
     */	
	private String mediaPath;
    /**
     * 媒体类型       db_column: media_type 
     */	
	private String mediaType;
    /**
     * 标题颜色       db_column: title_color 
     */	
	private String titleColor;
    /**
     * 是否加粗       db_column: is_bold 
     */	
	private Boolean isBold;
    /**
     * 标题图片       db_column: title_img 
     */	
	private String titleImg;
    /**
     * 内容图片       db_column: content_img 
     */	
	private String contentImg;
    /**
     * 类型图片       db_column: type_img 
     */	
	private String typeImg;
    /**
     * 外部链接       db_column: link 
     */	
	private String link;
    /**
     * 指定模板       db_column: tpl_content 
     */	
	private String tplContent;
    /**
     * 需要重新生成静态页       db_column: need_regenerate 
     */	
	private Boolean needRegenerate;
	//columns END

	public JcContentExt(){
	}

	public JcContentExt(
		Integer contentId
	){
		this.contentId = contentId;
	}

	public void setContentId(Integer value) {
		this.contentId = value;
	}
	
	public Integer getContentId() {
		return this.contentId;
	}
	public void setTitle(String value) {
		this.title = value;
	}
	
	public String getTitle() {
		return this.title;
	}
	public void setShortTitle(String value) {
		this.shortTitle = value;
	}
	
	public String getShortTitle() {
		return this.shortTitle;
	}
	public void setAuthor(String value) {
		this.author = value;
	}
	
	public String getAuthor() {
		return this.author;
	}
	public void setOrigin(String value) {
		this.origin = value;
	}
	
	public String getOrigin() {
		return this.origin;
	}
	public void setOriginUrl(String value) {
		this.originUrl = value;
	}
	
	public String getOriginUrl() {
		return this.originUrl;
	}
	public void setDescription(String value) {
		this.description = value;
	}
	
	public String getDescription() {
		return this.description;
	}
	public String getReleaseDateString() {
		return DateConvertUtils.format(getReleaseDate(), FORMAT_RELEASE_DATE);
	}
	public void setReleaseDateString(String value) {
		setReleaseDate(DateConvertUtils.parse(value, FORMAT_RELEASE_DATE,java.util.Date.class));
	}
	
	public void setReleaseDate(java.util.Date value) {
		this.releaseDate = value;
	}
	
	public java.util.Date getReleaseDate() {
		return this.releaseDate;
	}
	public void setMediaPath(String value) {
		this.mediaPath = value;
	}
	
	public String getMediaPath() {
		return this.mediaPath;
	}
	public void setMediaType(String value) {
		this.mediaType = value;
	}
	
	public String getMediaType() {
		return this.mediaType;
	}
	public void setTitleColor(String value) {
		this.titleColor = value;
	}
	
	public String getTitleColor() {
		return this.titleColor;
	}
	public void setIsBold(Boolean value) {
		this.isBold = value;
	}
	
	public Boolean getIsBold() {
		return this.isBold;
	}
	public void setTitleImg(String value) {
		this.titleImg = value;
	}
	
	public String getTitleImg() {
		return this.titleImg;
	}
	public void setContentImg(String value) {
		this.contentImg = value;
	}
	
	public String getContentImg() {
		return this.contentImg;
	}
	public void setTypeImg(String value) {
		this.typeImg = value;
	}
	
	public String getTypeImg() {
		return this.typeImg;
	}
	public void setLink(String value) {
		this.link = value;
	}
	
	public String getLink() {
		return this.link;
	}
	public void setTplContent(String value) {
		this.tplContent = value;
	}
	
	public String getTplContent() {
		return this.tplContent;
	}
	public void setNeedRegenerate(Boolean value) {
		this.needRegenerate = value;
	}
	
	public Boolean getNeedRegenerate() {
		return this.needRegenerate;
	}
	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("ContentId",getContentId())
			.append("Title",getTitle())
			.append("ShortTitle",getShortTitle())
			.append("Author",getAuthor())
			.append("Origin",getOrigin())
			.append("OriginUrl",getOriginUrl())
			.append("Description",getDescription())
			.append("ReleaseDate",getReleaseDate())
			.append("MediaPath",getMediaPath())
			.append("MediaType",getMediaType())
			.append("TitleColor",getTitleColor())
			.append("IsBold",getIsBold())
			.append("TitleImg",getTitleImg())
			.append("ContentImg",getContentImg())
			.append("TypeImg",getTypeImg())
			.append("Link",getLink())
			.append("TplContent",getTplContent())
			.append("NeedRegenerate",getNeedRegenerate())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getContentId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof JcContentExt == false) return false;
		if(this == obj) return true;
		JcContentExt other = (JcContentExt)obj;
		return new EqualsBuilder()
			.append(getContentId(),other.getContentId())
			.isEquals();
	}
}


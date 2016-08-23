package com.aibang.framework.utils.page;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.lang.StringUtils;
 
/**
 * 分页信息
 * 第一页从1开始
 */
public class Page<T> implements Serializable,Iterable<T>
{
	 
	private static final long serialVersionUID = -2794246961808560543L;

	protected List<T> result;

	protected int pageSize;

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	protected int pageNumber;
	protected int totalCount = 0;
	protected int pageCount=0;
	
	
	public boolean isEntityOrField() {
		return entityOrField;
	}

	public void setEntityOrField(boolean entityOrField) {
		this.entityOrField = entityOrField;
	}

	

	private boolean entityOrField=true;	//true:需要分页的地方，传入的参数就是Page实体；false:需要分页的地方，传入的参数所代表的实体拥有Page属性
	
	private String pageStr;		//最终页面显示的底部翻页导航，详细见：getPageStr();
	
	public int getPageCount() {
		int totalPage = totalCount / pageSize;
		if (totalPage == 0 || totalCount % pageSize != 0) {
			totalPage++;
		}
		return totalPage;
	}
	public Page()
	{
		
	}
	@SuppressWarnings("rawtypes")
	public Page(PageRequest p, int totalCount) {
		this(p.getPageNumber(),p.getPageSize(),totalCount);
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public Page(int pageNumber,int pageSize,int totalCount) {
		this(pageNumber,pageSize,totalCount,new ArrayList(0));
	}
	
	public Page(int pageNumber,int pageSize,int totalCount,List<T> result) {
		if(pageSize <= 0) throw new IllegalArgumentException("[pageSize] must great than zero");
		this.pageSize = pageSize;
		this.pageNumber = PageUtils.computePageNumber(pageNumber,pageSize,totalCount);
		this.totalCount = totalCount;
		setResult(result);
	}

	public void setResult(List<T> elements) {
		if(elements == null) throw new IllegalArgumentException("'result' must be not null");
		this.result = elements;
	}
	
    /**
     * 当前页包含的数据
     *
     * @return 当前页数据源
     */
	public List<T> getResult() {
		return result;
	}
	
    /**
     * 是否是首页（第一页），第一页页码为1
     *
     * @return 首页标识
     */
	public boolean isFirstPage() {
		return getThisPageNumber() == 1;
	}

    /**
     * 是否是最后一页
     *
     * @return 末页标识
     */
	public boolean isLastPage() {
		return getThisPageNumber() >= getLastPageNumber();
	}
    /**
     * 是否有下一页
     *
     * @return 下一页标识
     */
	public boolean isHasNextPage() {
		return getLastPageNumber() > getThisPageNumber();
	}
    /**
     * 是否有上一页
     *
     * @return 上一页标识
     */
	public boolean isHasPreviousPage() {
		return getThisPageNumber() > 1;
	}
    /**
     * 获取最后一页页码，也就是总页数
     *
     * @return 最后一页页码
     */
	public int getLastPageNumber() {
		return PageUtils.computeLastPageNumber(totalCount, pageSize);
	}
    /**
     * 总的数据条目数量，0表示没有数据
     *
     * @return 总数量
     */
	public int getTotalCount() {
		return totalCount;
	}
    /**
     * 获取当前页的首条数据的行编码
     *
     * @return 当前页的首条数据的行编码
     */
	public int getThisPageFirstElementNumber() {
		return (getThisPageNumber() - 1) * getPageSize() + 1;
	}
    /**
     * 获取当前页的末条数据的行编码
     *
     * @return 当前页的末条数据的行编码
     */
	public int getThisPageLastElementNumber() {
		int fullPage = getThisPageFirstElementNumber() + getPageSize() - 1;
		return getTotalCount() < fullPage ? getTotalCount() : fullPage;
	}
    /**
     * 获取下一页编码
     *
     * @return 下一页编码
     */
	public int getNextPageNumber() {
		return getThisPageNumber() + 1;
	}
    /**
     * 获取上一页编码
     *
     * @return 上一页编码
     */
	public int getPreviousPageNumber() {
		return getThisPageNumber() - 1;
	}
    /**
     * 每一页显示的条目数
     *
     * @return 每一页显示的条目数
     */
	public int getPageSize() {
		return pageSize;
	}
    /**
     * 当前页的页码
     *
     * @return 当前页的页码
     */
	public int getThisPageNumber() {
		return pageNumber;
	}

    /**
     * 得到用于多页跳转的页码
     * @return
     */
	public List<Integer> getLinkPageNumbers() {
		return PageUtils.generateLinkPageNumbers(getThisPageNumber(), getLastPageNumber(),10);
	}
	
	/**
	 * 得到数据库的第一条记录号
	 * @return
	 */
	public int getFirstResult() {
		return PageUtils.getFirstResult(pageNumber, pageSize);
	}

    public Iterator<T> iterator() {
       /* return result == null ? Collections.emptyList().iterator() : result.iterator();*/
    	return null;
    }

	public int getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}
	
	public void setPageStr(String pageStr) {
		this.pageStr = pageStr;
	}
	
	private String show;
	
	public void setURL(String url) {
		int totalResult=totalCount;
		int currentPage=pageNumber;
		int showCount=pageSize;
		int totalPage=getPageCount(); 
		if (getPageCount() > 0) {
			url = url.replaceAll("&", "&amp;");
			StringBuffer buffered = new StringBuffer("<ul class=\"page\">");
			if (url != null && !"".equals(url.trim())) {
				buffered.append("	<li><a>共<font color=red>"+totalResult+"</font>条</a></li>\n");
				/*buffered.append("	<li><input type=\"number\" value=\"\" id=\"toGoPage\" style=\"width:60px;text-align:center;float:left\" placeholder=\"页码\"/></li>\n");
				buffered.append("	<li style=\"cursor:pointer;\"><a onclick=\"toTZ();\"  class=\"btn btn-mini btn-success\">跳转</a></li>\n");*/
				
				buffered.append("<li> <a href='"+ url.replaceAll("\\{showpage}", "1")+ "'>首页</a> </li>");
				if (isHasPreviousPage())
					buffered.append("<li><a href='"+ url.replaceAll("\\{showpage}", "" + (currentPage - 1)) + "'>上一页</a></li>");
				
				int showTag = 5;//分页标签显示数量
				int startTag = 1;
				
				
				if(currentPage>showTag){
					startTag = currentPage-1;
				}
				int endTag = startTag+showTag-1;
				
				for (int i = startTag; i <= endTag; i++) {
					String pagem_sel = "";
					if (i == currentPage)
						pagem_sel = "id='pagemr'";
					buffered.append("<li><a href='" + url.replaceAll("\\{showpage}", "" + i) + "' " + pagem_sel + ">" + i + "</a></li>");
				}
				if (isHasNextPage())
					buffered.append("<li><a href='" + url.replaceAll("\\{showpage}", "" + (currentPage + 1)) + "'>下一页</a></li>");
				buffered.append("<li><a href='" + url.replaceAll("\\{showpage}", "" + totalPage) + "'>尾页</a> </li>");
				buffered.append("<li><a>第"+currentPage+"页</a></li>\n");
				buffered.append("<li><a>共"+totalPage+"页</a></li>\n");
			}
			buffered.append("</ul>");
			this.show = buffered.toString();
		}
	}

	
	public String getShow() {
		return show;
	}

	public void setShow(String show) {
		this.show = show;
	}
	
	private String formName="";
	
	public String getPageStr() {
		
		int totalResult=totalCount;
		int currentPage=pageNumber;
		int showCount=pageSize;
		int totalPage=getPageCount();
		
		StringBuffer sb = new StringBuffer();
		if(totalResult>0){
			sb.append("	<ul>\n");
			if(currentPage==1){
				sb.append("	<li><a>共<font color=red>"+totalResult+"</font>条</a></li>\n");
				sb.append("	<li><input type=\"number\" value=\"\" id=\"toGoPage\" style=\"width:60px;text-align:center;float:left\" placeholder=\"页码\"/></li>\n");
				sb.append("	<li style=\"cursor:pointer;\"><a onclick=\"toTZ"+formName+"();\"  class=\"btn btn-mini btn-success\">跳转</a></li>\n");
				sb.append("	<li><a>首页</a></li>\n");
				sb.append("	<li><a>上页</a></li>\n");
			}else{
				sb.append("	<li><a>共<font color=red>"+totalResult+"</font>条</a></li>\n");
				sb.append("	<li><input type=\"number\" value=\"\" id=\"toGoPage\" style=\"width:60px;text-align:center;float:left\" placeholder=\"页码\"/></li>\n");
				sb.append("	<li style=\"cursor:pointer;\"><a onclick=\"toTZ"+formName+"();\"  class=\"btn btn-mini btn-success\">跳转</a></li>\n");
				sb.append("	<li style=\"cursor:pointer;\"><a onclick=\"nextPage"+formName+"(1)\">首页</a></li>\n");
				sb.append("	<li style=\"cursor:pointer;\"><a onclick=\"nextPage"+formName+"("+(currentPage-1)+")\">上页</a></li>\n");
			}
			int showTag = 5;//分页标签显示数量
			int startTag = 1;
			if(currentPage>showTag){
				startTag = currentPage-1;
			}
			int endTag = startTag+showTag-1;
			for(int i=startTag; i<=totalPage && i<=endTag; i++){
				if(currentPage==i)
					sb.append("<li><a><font class=\"currentPage\">"+i+"</font></a></li>\n");
				else
					sb.append("	<li style=\"cursor:pointer;\"><a onclick=\"nextPage"+formName+"("+i+")\">"+i+"</a></li>\n");
			}
			if(currentPage==totalPage){
				sb.append("	<li><a>下页</a></li>\n");
				sb.append("	<li><a>尾页</a></li>\n");
			}else{
				sb.append("	<li style=\"cursor:pointer;\"><a onclick=\"nextPage"+formName+"("+(currentPage+1)+")\">下页</a></li>\n");
				sb.append("	<li style=\"cursor:pointer;\"><a onclick=\"nextPage"+formName+"("+totalPage+")\">尾页</a></li>\n");
			}
			sb.append("	<li><a>第"+currentPage+"页</a></li>\n");
			sb.append("	<li><a>共"+totalPage+"页</a></li>\n");
			
			
//			sb.append("	<li><select title='显示条数' style=\"width:55px;float:left;\" onchange=\"changeCount(this.value)\">\n");
//			sb.append("	<option value='"+showCount+"'>"+showCount+"</option>\n");
//			sb.append("	<option value='10'>10</option>\n");
//			sb.append("	<option value='20'>20</option>\n");
//			sb.append("	<option value='30'>30</option>\n");
//			sb.append("	<option value='40'>40</option>\n");
//			sb.append("	<option value='50'>50</option>\n");
//			sb.append("	<option value='60'>60</option>\n");
//			sb.append("	<option value='70'>70</option>\n");
//			sb.append("	<option value='80'>80</option>\n");
//			sb.append("	<option value='90'>90</option>\n");
//			sb.append("	<option value='99'>99</option>\n");
//			sb.append("	</select>\n");
//			sb.append("	</li>\n");
			
			
			
			sb.append("</ul>\n");
			sb.append("<script type=\"text/javascript\">\n");
			
			String formObj="document.forms[0]";
			if(!StringUtils.isBlank(formName))
			{
			  formObj="document.forms['"+formName+"']";
			} 
			
			//换页函数
			sb.append("function nextPage"+formName+"(page){");
			sb.append(" if(top!=null) top.jzts();");
			sb.append("	if(true && "+formObj+"){\n");
			sb.append("		var url = "+formObj+".getAttribute(\"action\");\n");
			sb.append("		if(url.indexOf('?')>-1){url += \"&"+(entityOrField?"pageNumber":"page.pageNumber")+"=\";}\n");
			sb.append("		else{url += \"?"+(entityOrField?"pageNumber":"page.pageNumber")+"=\";}\n");
			sb.append("		url = url + page + \"&" +(entityOrField?"pageSize":"page.pageSize")+"="+showCount+"\";\n");
			sb.append("		"+formObj+".action = url;\n");
			sb.append("		"+formObj+".submit();\n");
			sb.append("	}else{\n");
			sb.append("		var url = document.location+'';\n");
			sb.append("		if(url.indexOf('?')>-1){\n");
			sb.append("			if(url.indexOf('pageNumber')>-1){\n");
			sb.append("				var reg = /pageNumber=\\d*/g;\n");
			sb.append("				url = url.replace(reg,'pageNumber=');\n");
			sb.append("			}else{\n");
			sb.append("				url += \"&"+(entityOrField?"pageNumber":"page.pageNumber")+"=\";\n");
			sb.append("			}\n");
			sb.append("		}else{url += \"?"+(entityOrField?"pageNumber":"page.pageNumber")+"=\";}\n");
			sb.append("		url = url + page + \"&" +(entityOrField?"pageSize":"page.pageSize")+"="+showCount+"\";\n");
			sb.append("		document.location = url;\n");
			sb.append("	}\n");
			sb.append("}\n");
			
			//调整每页显示条数
			//sb.append("function changeCount(value){");
			//sb.append(" top.jzts();");
			//sb.append("	if(true && document.forms[0]){\n");
			//sb.append("		var url = document.forms[0].getAttribute(\"action\");\n");
			//sb.append("		if(url.indexOf('?')>-1){url += \"&"+(entityOrField?"pageNumber":"page.pageNumber")+"=\";}\n");
			//sb.append("		else{url += \"?"+(entityOrField?"pageNumber":"page.pageNumber")+"=\";}\n");
			//sb.append("		url = url + \"1&" +(entityOrField?"pageSize":"page.pageSize")+"=\"+value;\n");
			//sb.append("		document.forms[0].action = url;\n");
			//sb.append("		document.forms[0].submit();\n");
			//sb.append("	}else{\n");
			//sb.append("		var url = document.location+'';\n");
			//sb.append("		if(url.indexOf('?')>-1){\n");
			//sb.append("			if(url.indexOf('pageNumber')>-1){\n");
			//sb.append("				var reg = /pageNumber=\\d*/g;\n");
			//sb.append("				url = url.replace(reg,'pageNumber=');\n");
			//sb.append("			}else{\n");
			//sb.append("				url += \"1&"+(entityOrField?"pageNumber":"page.pageNumber")+"=\";\n");
			//sb.append("			}\n");
			//sb.append("		}else{url += \"?"+(entityOrField?"pageNumber":"page.pageNumber")+"=\";}\n");
			//sb.append("		url = url + \"&" +(entityOrField?"pageSize":"page.pageSize")+"=\"+value;\n");
			//sb.append("		document.location = url;\n");
			//sb.append("	}\n");
			//sb.append("}\n");
			
			//跳转函数 
			sb.append("function toTZ"+formName+"(){");
			sb.append("var toPaggeVlue = document.getElementById(\"toGoPage\").value;");
			sb.append("if(toPaggeVlue == ''){document.getElementById(\"toGoPage\").value=1;return;}");
			sb.append("if(isNaN(Number(toPaggeVlue))){document.getElementById(\"toGoPage\").value=1;return;}");
			sb.append("nextPage"+formName+"(toPaggeVlue);");
			sb.append("}\n");
			sb.append("</script>\n");
		}
		pageStr = sb.toString();
		return pageStr;
	}
	
	
	
	
      public String getFrontPageStr() {
		
		int totalResult=totalCount;
		int currentPage=pageNumber;
		int showCount=pageSize;
		int totalPage=getPageCount();
		
		StringBuffer sb = new StringBuffer();
		if(totalResult>0){
			sb.append("	<ul class=\"u_c_paging\">\n");
			
			//上一页
			if(currentPage!=1){ 
				sb.append("	<li style=\"cursor:pointer;\"><a onclick=\"nextPage"+formName+"("+(currentPage-1)+")\">&lt;</a></li>\n");
			}
			
			
			if(totalPage<6||(currentPage<6&&(totalPage-currentPage)<5))
			{
				for (int i = 1; i <= totalPage; i++) {
					if(currentPage==i)
						sb.append("<li class=\"currentPage\"><a><font >"+i+"</font></a></li>\n");
					else
						sb.append("	<li style=\"cursor:pointer;\"><a onclick=\"nextPage"+formName+"("+i+")\">"+i+"</a></li>\n");
				}
			}else
			{
				
		        if(currentPage==1)
		        {
		          sb.append("<li class=\"currentPage\"><a><font >1</font></a></li>\n");
		        }else
		        {
				  sb.append("<li style=\"cursor:pointer;\"><a onclick=\"nextPage"+formName+"(1)\">1</a></li>\n");
		        }
				
		        if(currentPage==2)
		        {
		        	sb.append("<li class=\"currentPage\"><a><font >2</font></a></li>\n");
		        }else
		        {
				   sb.append("<li style=\"cursor:pointer;\"><a onclick=\"nextPage"+formName+"(2)\">2</a></li>\n");
		        }
				
				if(currentPage>5)
				{
					sb.append(" <li class=\"l_c_point\">...</li>\n");
				}else
				{
					if(currentPage==3)
			        {
			        	sb.append("<li class=\"currentPage\"><a><font >3</font></a></li>\n");
			        }else
			        {
					   sb.append("<li style=\"cursor:pointer;\"><a onclick=\"nextPage"+formName+"(3)\">3</a></li>\n");
			        }
				}
				
				for(int i=currentPage-2;i<=currentPage+2; i++){
					if( i > 3 && i<totalPage-2)
					{
						if(currentPage==i)
							sb.append("<li class=\"currentPage\"><a><font >"+i+"</font></a></li>\n");
						else
							sb.append("	<li style=\"cursor:pointer;\"><a onclick=\"nextPage"+formName+"("+i+")\">"+i+"</a></li>\n");
					}
		        }
				
				if((totalPage-currentPage)>4)
				{
					sb.append(" <li  class=\"l_c_point\">...</li>\n");
				}else
				{
					if((totalPage-2)==currentPage)
					{
						sb.append("<li  class=\"currentPage\"><a><font>"+(totalPage-2)+"</font></a></li>\n");
					}else
					{
						sb.append("	<li style=\"cursor:pointer;\"><a onclick=\"nextPage"+formName+"("+(totalPage-2)+")\">"+(totalPage-2)+"</a></li>\n");
					}
				}
				
				if((totalPage-1)==currentPage)
				{
					sb.append("<li  class=\"currentPage\"><a><font>"+(totalPage-1)+"</font></a></li>\n");
				}else
				{
					sb.append("	<li style=\"cursor:pointer;\"><a onclick=\"nextPage"+formName+"("+(totalPage-1)+")\">"+(totalPage-1)+"</a></li>\n");
				}
				if(totalPage==currentPage)
				{
					sb.append("<li  class=\"currentPage\"><a><font>"+totalPage+"</font></a></li>\n");
				}else
				{
					sb.append("	<li style=\"cursor:pointer;\"><a onclick=\"nextPage"+formName+"("+totalPage+")\">"+totalPage+"</a></li>\n");
				}
				
			}
			
			
			
			//下一页
			if(currentPage!=totalPage){ 
				sb.append("	<li style=\"cursor:pointer;\"><a onclick=\"nextPage"+formName+"("+(currentPage+1)+")\">&gt;</a></li>\n");
			}
			
			sb.append("</ul>\n");
			sb.append("<script type=\"text/javascript\">\n");
			
			String formObj="document.forms[0]";
			if(!StringUtils.isBlank(formName))
			{
			  formObj="document.forms['"+formName+"']";
			} 
			
			//换页函数
			sb.append("function nextPage"+formName+"(page){");
			sb.append(" if(top!=null) top.jzts();");
			sb.append("	if(true && "+formObj+"){\n");
			sb.append("		var url = "+formObj+".getAttribute(\"action\");\n");
			sb.append("		if(url.indexOf('?')>-1){url += \"&"+(entityOrField?"pageNumber":"page.pageNumber")+"=\";}\n");
			sb.append("		else{url += \"?"+(entityOrField?"pageNumber":"page.pageNumber")+"=\";}\n");
			sb.append("		url = url + page + \"&" +(entityOrField?"pageSize":"page.pageSize")+"="+showCount+"\";\n");
			sb.append("		"+formObj+".action = url;\n");
			sb.append("		"+formObj+".submit();\n");
			sb.append("	}else{\n");
			sb.append("		var url = document.location+'';\n");
			sb.append("		if(url.indexOf('?')>-1){\n");
			sb.append("			if(url.indexOf('pageNumber')>-1){\n");
			sb.append("				var reg = /pageNumber=\\d*/g;\n");
			sb.append("				url = url.replace(reg,'pageNumber=');\n");
			sb.append("			}else{\n");
			sb.append("				url += \"&"+(entityOrField?"pageNumber":"page.pageNumber")+"=\";\n");
			sb.append("			}\n");
			sb.append("		}else{url += \"?"+(entityOrField?"pageNumber":"page.pageNumber")+"=\";}\n");
			sb.append("		url = url + page + \"&" +(entityOrField?"pageSize":"page.pageSize")+"="+showCount+"\";\n");
			sb.append("		document.location = url;\n");
			sb.append("	}\n");
			sb.append("}\n");
			 
		 
			sb.append("</script>\n");
			 
		}
		pageStr = sb.toString();
		return pageStr;
	}

	public String getFormName() {
		return formName;
	}

	public void setFormName(String formName) {
		this.formName = formName;
	}
}


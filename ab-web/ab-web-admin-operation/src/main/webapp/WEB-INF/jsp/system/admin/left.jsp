<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

		<!-- 本页面涉及的js函数，都在head.jsp页面中     -->
<!-- 		控制可收缩<div id="sidebar" class="menu-min"> -->
	<div id="sidebar" >
				<div id="sidebar-shortcuts" class="">

					<%--<div id="sidebar-shortcuts-large">

						<button class="btn btn-small btn-success" onclick="changeMenu();" title="切换菜单"><i class="icon-pencil"></i></button>

						<button class="btn btn-small btn-info" title="UI实例" onclick="window.open('<%=basePathl%>static/UI_new');"><i class="icon-eye-open"></i></button>

						<button class="btn btn-small btn-warning" title="数据字典" id="adminzidian" onclick="zidian();"><i class="icon-book"></i></button>
						
						<button class="btn btn-small btn-danger" title="菜单管理" id="adminmenu" onclick="menu();"><i class="icon-folder-open"></i></button>
						
					    </div>

					--%>
					<div id="sidebar-shortcuts-mini">
						<span class="btn btn-success"></span>

						<span class="btn btn-info"></span>

						<span class="btn btn-warning"></span>

						<span class="btn btn-danger"></span>
					</div>

				</div><!-- #sidebar-shortcuts -->


				<ul class="nav nav-list">

					<%--<li class="active" id="fhindex">
					  <a href="main/index"><i class="icon-dashboard"></i><span>后台首页</span></a>
					</li>



			--%><c:forEach items="${menuList}" var="menu">
				<c:if test="${menu.hasMenu}">
				<li id="lm${menu.id }">
					  <a style="cursor:pointer;" class="dropdown-toggle" >
						<i class="${menu.menuIcon == null ? 'icon-desktop' : menu.menuIcon}"></i>
						<span>${menu.menuName }</span>
						<b class="arrow icon-angle-down"></b>
					  </a>
					  <ul class="submenu">
							<c:forEach items="${menu.subMenu}" var="sub">
								<c:if test="${sub.hasMenu}">
									<c:choose>
										<c:when test="${'#' ne sub.menuUrl}">
											<li id="z${sub.id }">
											<a style="cursor:pointer;" target="mainFrame"  onclick="siMenu('z${sub.id }','lm${menu.id }','${sub.menuName }','${sub.menuUrl }')"><i class="icon-double-angle-right"></i>${sub.menuName }</a></li>
										</c:when>
										<c:otherwise>
										    <li>
											    <a class="dropdown-toggle" style="cursor:pointer;">
													<i class="icon-double-angle-right"></i>
													${sub.menuName }
													<b class="arrow icon-angle-down"></b>
												</a>
												
												<ul class="submenu"  >
													<c:forEach items="${sub.subMenu}" var="threeMenu">
													    	<c:if test="${threeMenu.hasMenu}">
									                     <li id="z${threeMenu.id }">
															<a style="cursor:pointer;" target="mainFrame"  onclick="siMenu('z${threeMenu.id }','lm${menu.id }','${threeMenu.menuName }','${threeMenu.menuUrl }')">
																<i class=""></i>
																${threeMenu.menuName }
															</a>
														</li>
														</c:if>
									                </c:forEach>
												</ul>
										   </li>
										</c:otherwise>
									</c:choose>
								</c:if>
								
							</c:forEach>
				  		</ul>
				</li>
				</c:if>
			</c:forEach>

				</ul><!--/.nav-list-->

<!-- 			可收缩	<div id="sidebar-collapse"><i class="icon-double-angle-left"></i></div> -->
				<%--<div id="sidebar-collapse"><i class="icon-double-angle-left icon-double-angle-right"></i></div>

			--%></div><!--/#sidebar-->


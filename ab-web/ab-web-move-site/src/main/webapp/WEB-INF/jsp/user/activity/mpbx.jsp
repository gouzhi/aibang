<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>华金所 - 你买票我报销</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<link href="${css_imagedomain}/move/css/activity1.css" type="text/css" rel="stylesheet" />
<script src="${css_imagedomain}/move/js/jquery.js" type="text/javascript"></script>
<script src="${css_imagedomain}/move/js/zhuce_mobile.js" type="text/javascript"></script>
</head>
<body>
<div class="wapOutside">
  <div class="bannerImg"><img src="${css_imagedomain}/move/images/banner1.jpg" /><img src="${css_imagedomain}/move/images/banner2.jpg" /><img src="${css_imagedomain}/move/images/banner3.jpg" /></div>
  <div class="gameTime">活动时间：2015年12月1日-2016年3月1日</div>
  <div class="littBg1"></div>
  <!-- 加载注册模块 -->
  <div id="reg_form"></div>
  <script type="text/javascript" src="http://${web_name}${web_domain}${project_name}/regcommon.js"></script> 
  <!-- 加载注册模块结束 -->
  <div class="littImg1"><a href="#zhuce"><img src="${css_imagedomain}/move/images/img5.png" /></a></div>
  <div class="littBg3">
  <img src="${css_imagedomain}/move/images/img4.png" />
    <p>凡在活动时间购买赢春计划理财产品客户，除享受以上优惠返利外，推荐好友并购买赢春2号、3号理财产品，送好事成双红包（50元人民币），多推多送，送完为止。</p>
  </div>
  <div class="actTt"><img src="${css_imagedomain}/move/images/title1.png" /><a href="http://mp.weixin.qq.com/s?__biz=MzAwMzc0MjEyMg==&mid=400824627&idx=1&sn=e8bf9abb2c733316c84b4e3bfd481f0e#rd" target="_blank">查看详情</a></div>
  <ul class="actList">
    <li>
      <p>投资2000元\30天，即可获赠火车餐费补助<span>20元</span></p>
    </li>
    <li>
      <p>投资5000元\30天，即可获赠火车餐费补助<span>50元</span></p>
    </li>
    <li>
      <p>投资2万元\30天，即可获赠交通补助<span>200元</span></p>
    </li>
    <li>
      <p>投资5000元\90天，即可获赠交通补助<span>100元</span></p>
    </li>
    <li>
      <p>投资2万元\90天，即可报销单人单程火车票<br />
        （硬座/硬卧）或交通补助<span>300元</span></p>
    </li>
    <li>
      <p>投资5万元\90天，即可报销单人单程火车票
        （硬卧/高铁二等座）或交通补助<span>500元</span></p>
    </li>
    <li>
      <p>投资2万元\180天，即可报销单人单程火车票
        （硬卧/高铁二等座）或交通补助<span>500元</span></p>
    </li>
    <li>
      <p>投资5万元\180天，即可报销单人往返火车票（
        硬卧/软卧/高铁一、二等座）或交通补助<span>1000元</span></p>
    </li>
    <li>
      <p>投资10万元\180天，即可报销单人往返火车票
        （任意坐席）或交通补助<span>2000元</span></p>
    </li>
  </ul>
  <div class="actTt1"><img src="${css_imagedomain}/move/images/title2.png" /></div>
  <ul class="dhList">
  <li class="listBg1">
      <span class="listImg"><img src="${css_imagedomain}/move/images/icon2.png" /></span><p>用户每购买一次活动产品，仅获得一次报销机会，多买多送。此活动不能使用任何投资兑换券。</p>
    </li>
    <li class="listBg2">
      <span class="listImg"><img src="${css_imagedomain}/move/images/icon3.png" /></span><p>兑换火车票的用户请于2016年3月1日前快递本人实名火车票到华金所，火车票与您在华金所账号内的身份信息一致，即可报销；否则按交通补助金额发放。</p>
    </li>
    <li class="listBg3">
      <span class="listImg"><img src="${css_imagedomain}/move/images/icon4.png" /></span><p>火车票、自驾补助及好事成双现金红包，于2016年3月31日前发至您的账户后，即可提现</p>
    </li>
  </ul>
  <div class="evm">
  <p><img src="${css_imagedomain}/move/images/evm.png" /></p>
  <p>活动详情请关注华金所微信</p>
  <p>本次活动最终解释权归华金所所有</p>
</div></div>

<script type="text/javascript">				
		//TOCMAT重启之后 点击左侧列表跳转登录首页 
		if (window != top) {
			top.location.href = location.href;
		}
</script>
</body> 
</html>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/demo.css" type="text/css">
<link rel="stylesheet" href="css/zTreeStyle/zTreeStyle.css" type="text/css">
<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="js/jquery.ztree.core-3.5.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
var setting = {
		async : {
			enable : true, // 设置 zTree是否开启异步加载模式
			url : "<%=basePath %>TreeServlet",  // Ajax 获取数据的 URL 地址
			autoParam : ["id"]// 异步加载时自动提交父节点属性的参数,假设父节点 node = {id:1, name:"test"}，异步加载时，提交参数 zId=1
		},
		data : { // 必须使用data
			simpleData : {
				enable : true,
				idKey : "id", // id编号命名 默认
				pIdKey : "pId", // 父id编号命名 默认
				rootPId : 0 // 用于修正根节点父节点数据，即 pIdKey 指定的属性值
			}
		},
		// 回调函数
		callback : {
			onClick : function (event, treeId, treeNode, clickFlag) {
				// 判断是否父节点
				if (!treeNode.isParent) {
					alert("treeId自动编号：" + treeNode.tId + ", 节点id是：" + treeNode.id + ", 节点文本是：" + treeNode.name);
				}
			},
			//捕获异步加载出现异常错误的事件回调函数 和 成功的回调函数
			onAsyncError : zTreeOnAsyncError,
			onAsyncSuccess : function (event, treeId, treeNode, msg) {}
		}
	};

	// 加载错误提示
	function zTreeOnAsyncError(event, treeId, treeNode, XMLHttpRequest, textStatus, errorThrown) {
		alert("加载错误：" + XMLHttpRequest);
	};

	// 过滤函数
	function filter(treeId, parentNode, childNodes) {
		if (!childNodes)
			return null;
		for (var i = 0, l = childNodes.length; i < l; i++) {
			childNodes[i].name = childNodes[i].name.replace(/\.n/g, '.');
		}
		return childNodes;
	}

	// 渲染
	$(document).ready(function () {
		$.fn.zTree.init($("#treeDemo"), setting);
	});  
</script>
</head>
<body>
<h1>最简单的树 -- 标准 JSON 数据</h1>
<h6>[ 文件路径: core/standardData.html ]</h6>
<div class="content_wrap">
	<div class="zTreeDemoBackground left">
		<ul id="treeDemo" class="ztree"></ul>
	</div>
	<div class="right">
		<ul class="info">
			<li class="title"><h2>1、setting 配置信息说明</h2>
				<ul class="list">
				<li class="highlight_red">普通使用，无必须设置的参数</li>
				<li>与显示相关的内容请参考 API 文档中 setting.view 内的配置信息</li>
				<li>name、children、title 等属性定义更改请参考 API 文档中 setting.data.key 内的配置信息</li>
				</ul>
			</li>
			<li class="title"><h2>2、treeNode 节点数据说明</h2>
				<ul class="list">
				<li class="highlight_red">标准的 JSON 数据需要嵌套表示节点的父子包含关系
					<div><pre xmlns=""><code>例如：
var nodes = [
	{name: "父节点1", children: [
		{name: "子节点1"},
		{name: "子节点2"}
	]}
];</code></pre></div>
				</li>
				<li>默认展开的节点，请设置 treeNode.open 属性</li>
				<li>无子节点的父节点，请设置 treeNode.isParent 属性</li>
				<li>其他属性说明请参考 API 文档中 "treeNode 节点数据详解"</li>
				</ul>
			</li>
		</ul>
	</div>
</div>
</body>
</html>
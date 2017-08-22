<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ include file="/common/common.jspf"%>
<title>Login page</title>
</head>
<body>
	<div id="loginDiv">
		<form id="ff" method="post" action="${proPath}/account/login.action">
			<div>
				<label for="accLogin">账号:</label>
				<!-- 采用 js验证 -->
				<input type="text" name="accLogin"  />
			</div>
			<div>
				<label for="accPass">密码:</label>
				<!-- 行内验证
				<input class="easyui-validatebox" type="text" name="name"
					data-options="required:true,missingMessage:'请填写密码！'" />
					 -->
				<input type="text" name="accPass" />
			</div>
		</form>
				<div style="color:red" >${requestScope.msg}</div>
	</div>
	<script type="text/javascript">
		/*
		 *＄｛选择器｝把ｄｏｍ对象转为ｊｑｕｅｒｙ对象，一般再处理成easyUI对象
		 *例如　把$("name='accName'")validatebox({})转为easyUI对象
		 *easyUI对象就可以使用相关的语法进行处理，如：$('selector').plugin('method', parameter); 
		 */
		//alert("ddddd");
		//这里的大括号相关于写json格式的数据：{属性：值，属性：值}
		//alert("ddddd");
		$("[name='accLogin']").validatebox({
			required : true,
			missingMessage : '请填写账号！'
		});
		$("[name='accPass']").validatebox({
			required : true,
			missingMessage : '请填写密码！'
		});
		//禁用验证
		$("#ff").form("disableValidation");
		//把div的内容作为对话框方式弹出
		$('#loginDiv').dialog({
			title : '登陆入口',
			width : 250,
			height : 150,
			closed : false,
			cache : false,
			//设置关闭按钮可见
			closable : false,
			//模式化窗口.如果为true将锁屏
			modal : true,
			buttons:[{
				text:'登录',
				handler:function(){
					alert("可以登录了");
				  $("#ff").form("enableValidation");
				  //通过验证，通过就提交。
				  if($("#ff").form("validate")){
					  $("#ff").submit();
				  }
				}
			},{
				text:'取消',
				handler:function(){}
			}]
			
			
		});
		
	</script>
</body>
</html>


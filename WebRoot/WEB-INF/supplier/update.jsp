<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
<%@ include file="/common/common.jspf"%>
<title>My JSP</title>
</head>
<body>

	<form id="ff" method="post">
	   <div>
			<label for="supId">供应商编号:</label> <input type="text" name="supId" readonly="readonly" />
		</div>
		<div>
			<label for="supName">供应商:</label> <input type="text" name="supName" />
		</div>
		<div>
			<label for="supLinkman">联系人:</label> <input type="text"
				name="supLinkman" />
		</div>
		<div>
			<label for="supPhone">联系电话:</label> <input type="text"
				name="supPhone" />
		</div>
		<div>
			<label for="supAddress">联系地址:</label> <input type="text"
				name="supAddress" />
		</div>
				<div>
			<label for="supPay">期初应付(元):</label> <input type="text"
				name="supPay" />
		</div>
				<div>
			<label for="supType">供应商类型：</label> 									
				<select id="cc" class="easyui-combobox" name="supType" style="width:200px;">   
					<c:forEach items="${applicationScope.sysParam.supType}" var="supType">
					    <option value="${supType.key}">${supType.value}</option>   
					</c:forEach>   
				</select>  
		</div>
		<div>
			<label for="supRemark">备注:</label>
			<textarea name="supRemark"></textarea>
		</div>
		<div>
			<input id="btn" type="button" value="提交" />
		</div>
	</form>

	<script type="text/javascript">
		$(function() {
			var win = parent.$("iframe[title='供应商管理']").get(0).contentWindow;//返回ifram页面窗体对象（window)
			
			var row = win.$('#dg').datagrid("getSelected");
			//alert(row.supId);
			
			$('#ff').form('load',{
				supId:row.supId,
				supName:row.supName,
				supAddress:row.supAddress,
				supType:row.supType,
				supPay:row.supPay,
				supLinkman:row.supLinkman,
				supPhone:row.supPhone,
				supRemark:row.supRemark
			});

			
		
			$("[name='supName']").validatebox({
				required : true,
				missingMessage : '请填写供应商！'
			});
			$("[name='supLinkman']").validatebox({
				required : true,
				missingMessage : '请填写出联系人！'
			});
			$("[name='supPhone']").validatebox({
				required : true,
				missingMessage : '请填写联系电话！'
			});
			//禁用验证
			$("#ff").form("disableValidation");

			$("#btn").click(function() {
				//alert("ddddddddddd");
				$("#ff").form("enableValidation");
				if ($("#ff").form("validate")) {
					//alert("------------");
					$('#ff').form('submit', {
						url : '${proPath}/supplier/update.action',
						onSubmit : function() {
							return true;
						},
						success : function(count) {							
								//可以定义为对应消息框
								if(count>0){
									alert("修改成功！");									
								}else{
									alert("修改失败！");
								}
								parent.$("#win").window("close");
								win.$("#dg").datagrid("reload");							
						}
					});

				}

			});

		});
	</script>
</body>
</html>

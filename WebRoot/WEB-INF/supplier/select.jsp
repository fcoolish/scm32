<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/common/common.jspf"%>
<html>
<head>


<title></title>
<style type="text/css">
.searchbox{
	margin:-3
}
</style>

<script type="text/javascript">
	$(function(){
			var win = parent.$("iframe[title='商品采购']").get(0).contentWindow;//返回ifram页面窗体对象（window)
	
			$('#dg').datagrid({    
			    //url:'${proPath}/supplier/selectPage.action', //通过关键字查询
			    //支持多条件查询
			    url:'${proPath}/supplier/selectPageUseDyc.action', 
			    
			    fitColumns:true,
			    nowrapL:true,
			    idField:'supId',
			    singleSelect:true,
			    
			    rownumbers:true,
			    pagination:true,
			    pageSize:5,
			    pageList:[2,5,10,20],
			    
			     queryParams: {
					supName: '%%',
					supAddress:'%%'			
				}, 
						    
			    toolbar: [{
					iconCls: 'icon-ok',
					text:'选择供应商',
					handler: function(){
					var row =  $("#dg").datagrid("getSelected");
					alert(row.supId);
					win.$("#ff").form('load',{
						supId:row.supId,
						supName:row.supName
						
					});
					
					parent.$("#win").window("close");

					
					
						//alert('新增按钮');
					/* 	parent.$('#win').window({    
							title :'添加供应商',						
						    width:600,    
						    height:400,    
						    modal:true,
						    content:"<iframe src='${proPath}/base/goURL/supplier/insert.action' height='100%' width='100%' frameborder='0px' ></iframe>"  
						});  */
					}
						

				},'-',{
					text:"名称：<input type='text' id='supName' name='supName'/>",					
				}
				,'-',{
					text:"地址：<input type='text' id='supAddress' name='supAddress'/>",					
				}],			       
			    

				columns : [ [{
					checkbox:true,
				}, {
				field : 'supId',
				title : '供应商编号'
			}, {
				field : 'supName',
				title : '供应商名称',
				width : 100
			}, {
				field : 'supLinkman',
				title : '联系人',
				width : 100
			}, {
				field : 'supPhone',
				title : '联系电话',
				width : 100
			}, {
				field : 'supPay',
				title : '期初应付（元）',
				width : 100
			}, {
				field : 'supType',
				title : '供应商类型',
				width : 100
			}, {
				field : 'supAddress',
				title : '供应商地址',
				width : 100
			}, {
				field : 'supRemark',
				title : '备注',
				width : 100,
				align : 'right'
			} ] ]
		});
		
			$('#supAddress').searchbox({ 
			searcher:function(value,name){ 
				alert("supAddress:"+value); 
				alert("supName:"+$('#supName').val());
				$('#dg').datagrid('load',{
					supName: '%'+$('#supName').val()+'%',
					supAddress:'%'+value+'%'		
				});					
			}, 
			prompt:'' 
		});
		
	/* 通过关键字查询
		$('#ss').searchbox({ 
			searcher:function(value,name){ 
				alert(value + "," + name); 
				$('#dg').datagrid('load',{
					keyWord: '%'+value+'%'					
				});					
			}, 
			prompt:'请输入供应商名称' 
		}); */ 

	});
</script>
</head>

<body>

	<table id="dg"></table>
</body>
</html>
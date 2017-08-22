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
			    url:'${proPath}/goods/selectPageUseDyc.action', 
			    
			    fitColumns:true,
			    nowrapL:true,
			    idField:'goodsId',
			    rownumbers:true,
			    singleSelect:true,
			    
			    pagination:true,
			    pageSize:5,
			    pageList:[2,5,10,20],
			    
			     queryParams: {
					goodsName: '%%'		
				}, 
						    
			    toolbar: [{
					iconCls: 'icon-save',
					text:'保存',
					handler: function(){
						//alert('保存按钮');
						
						var row = $("#dg").datagrid("getSelected");
						if(row==null){
							alert("请选择需要采购的商品");
							return false;							
						}
						//alert(row.goodsId);
						//alert($("#bodBuyPrice").val());
						win.$("#dg").datagrid('appendRow',{
							goodsId:row.goodsId,
							goodsName:row.goodsName,
							goodsUnit:row.goodsUnit,
							goodsType:row.goodsType,
							goodsColor:row.goodsColor,
							bodAmount:$("#bodAmount").val(),
							bodBuyPrice:$("#bodBuyPrice").val(),
							bodTotalPrice:$("#bodBuyPrice").val()*$("#bodAmount").val(),
							bodImeiList:$("#bodImeiList").val()
						});
						
						parent.$("#win").window("close");

				
					}
		
				},'-',{
					text:"名称：<input type='text' id='goodsName' name='goodsName'/>",					
				}],			       
			    

				columns : [ [{
					checkbox:true,
				}, {
				field : 'goodsId',
				title : '商品编号'
			}, {
				field : 'goodsName',
				title : '商品名称',
				width : 100
			}, {
				field : 'goodsUnit',
				title : '单位',
				width : 100
			}, {
				field : 'goodsType',
				title : '型号',
				width : 100
			}, {
				field : 'goodsColor',
				title : '颜色',
				width : 100
			}] ]
		});
		
			$('#goodsName').searchbox({ 
			searcher:function(value,name){ 
				
				$('#dg').datagrid('load',{				
					goodsName:'%'+value+'%'		
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

<body style="margin:0px">

	<table id="dg"></table>
<form  style="padding:5px;margin:0px;background:#eee;"  action="">
采购数量：<input type="text" id='bodAmount' name='bodAmount' class="easyui-numberbox" value="1" data-options="min:1,max:1000000000">
价格：<input type="text" id='bodBuyPrice' name='bodBuyPrice' class="easyui-numberbox"  value="22" data-options="min:0,precision:2">
手机串号：<textarea  id='bodImeiList' name='bodImeiList'>3333</textarea>

</form>

	
</body>
</html>
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
		var editIndex = undefined;
			$('#dg').datagrid({    
			    //url:'${proPath}/supplier/selectPage.action', //通过关键字查询
			    //支持多条件查询
			    //url:'${proPath}/supplier/selectPageUseDyc.action', 
			    
			    fitColumns:true,
			    nowrapL:true,
			    idField:'goodsId',
			    rownumbers:true,
			    /* pagination:true,
			    pageSize:5,
			    pageList:[2,5,10,20], */
			    
			 /*     queryParams: {
					supName: '%%',
					supAddress:'%%'			
				},  */
						    
			    toolbar: [{
					iconCls: 'icon-add',
					text:'选择商品',
					handler: function(){
						alert('选择商品');
						 parent.$('#win').window({    
							title :'选择需要采购商品',						
						    width:600,    
						    height:400,    
						    modal:true,
						    content:"<iframe src='${proPath}/base/goURL/goods/select.action' height='100%' width='100%' frameborder='0px' ></iframe>"  
						});  
					}
						

				},'-',{
					iconCls: 'icon-remove',
					text:'删除商品',
					handler: function(){
						alert('删除商品');
						//判断是否选中一行，并且只能选中一行进行修改
						var array =  $("#dg").datagrid("getSelections");
						if(array.length>0){
						for(var i=array.length-1;i>=0;i--){
								alert(i);
								var index = $("#dg").datagrid("getRowIndex",array[i].goodsId);
								$("#dg").datagrid("deleteRow",index);
							}
						
						}else{
							alert("请选择不需要采购的商品");
						}
						
					}
				},'-',{
					iconCls: 'icon-ok',
					text:'提交采购',
					handler: function(){
						alert('提交采购');
						//form表单验证
						//获取数据
						/* var data = $("#dg").datagrid("getData");
						//alert(data);
						console.info(data);
						console.info(data.rows);
						
						if(data.rows.length==0){
							alert("请选择需要采购的商品");
							return false;
						} 
						
						//把对象转成JSON格式的字符串
						 var rows =JSON.stringify(data.rows);
						*/
						var rows = $("#dg").datagrid("getRows");
						console.info(rows);				
						
						//把对象转成JSON格式的字符串
						 rows =JSON.stringify(rows);
						 console.info(rows);
						
						//提交采购到服务端
						 $('#ff').form('submit', {    
						    url:'${proPath}/buyOrder/insert.action',    
						    onSubmit: function(param){    
						        param.rows = rows; 
						        return true;   
						         
						    },
						    success:function(data){  
						    //自己处理返回的信息  
						        alert(data);   
						    }      
						}); 
						
						
					}
			
				}],			       
			    
				columns : [ [{
					checkbox:true,
				}, {
				field : 'goodsId',
				title : '商品编号',
				width : 100
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
			}, {
				field : 'bodAmount',
				title : '数量',
				editor:'numberbox',
				width : 100
			}, {
				field : 'bodBuyPrice',
				title : '进价',
				editor:{type:'numberbox',options:{precision:2}},
				width : 100
			}, {
				field : 'bodTotalPrice',
				title : '合计',
				editor:{type:'numberbox',options:{precision:2}},
				width : 100
			}, {
				field : 'bodImeiList',
				title : '串号列表',
				editor:'textarea',
				width : 100,
				align : 'right'
			}  ] ],nDblClickCell: function(index,field,value){
				
				//结束编辑行, 可以不用，不会被调用，将在单击事件处理
					if(editIndex != undefined){							
						//alert(" onDblClickCell editIndex != undefined");			
					  $(this).datagrid('endEdit', editIndex);
						editIndex = undefined;
					}
					//alert("dbclick");		
					//设置可编辑行	
					$(this).datagrid('beginEdit', index);
					editIndex = index;
					//alert("dbclick");				
					var ed = $(this).datagrid('getEditor', {index:index,field:field});
					//alert("field||index:"+field+index);				
					$(ed.target).focus();
				},
				//单击单元格时，如果存在编辑的单元格，结束编辑,这里的参数 index没有用
				onClickCell: function(index,field,value){
				
					if(editIndex!= undefined){					
						//alert(" onClickCell editIndex != undefined");			
					 //结束编辑行，代码已没用
					 /*  $(this).datagrid('endEdit', editIndex);
					  alert(" onClickCell editIndex != undefined1");	
					  	//设置可编辑行	
					  $(this).datagrid('beginEdit', editIndex);
					  alert(" onClickCell editIndex != undefined2");	 */
					  //计算总价
					  var amount = $(this).datagrid('getEditor', {index:editIndex,field:"bodAmount"});
					  var buyPrice=$(this).datagrid('getEditor', {index:editIndex,field:"bodBuyPrice"});
					  var bodTotalPrice =$(buyPrice.target).numberbox('getValue')*$(amount.target).numberbox('getValue');
					  //alert("bodTotalPrice"+bodTotalPrice);
					  var ed = $(this).datagrid('getEditor', {index:editIndex,field:"bodTotalPrice"});
					  //alert(" onClickCell editIndex != undefined3");	
					  $(ed.target).numberbox('setValue', bodTotalPrice);
					  //alert(" onClickCell editIndex != undefined4");	
					  
					  //结束编辑行
					  $(this).datagrid('endEdit', editIndex);
						editIndex = undefined;
					}				
				}
			
			
		});
		
		
		$('#supName').searchbox({ 
			searcher:function(value,name){ 
			//alert(value + "," + name);
			 			parent.$('#win').window({    
							title :'选择供应商',						
						    width:800,    
						    height:600,    
						    modal:true,
						    content:"<iframe src='${proPath}/base/goURL/supplier/select.action' height='100%' width='100%' frameborder='0px' ></iframe>"  
						});  
			
			}, 
			prompt:'请选择供应商' 
		}); 


	});
</script>
</head>

<body>
<form style="padding:15px;margin:0px;background:#eee;" id="ff" action="">
   请填写采购信息：<br>
 	供应商：<input type="hidden" id="supId" name="supId"/>
 	<input type="text" id="supName" name="supName"/>
 	仓库：<select id="cc" class="easyui-combobox" name="shId" style="width:200px;">   
					<c:forEach items="${applicationScope.sysParam.shId}" var="shId">
					    <option value="${shId.key}">${shId.value}</option>   
					</c:forEach>   
				</select>
 	日期：<input  type="text" id="boDate"
				class="easyui-datebox" name="boDate" required="required"></input>

    应付：<input type="text" id="boPayable" name="boPayable"/><br>
    已付：<input type="text" id="boPaid" name="boPaid"/>
 	欠款：<input type="text" id="boArrears" name="boArrears"/>
 	原始单号：<input type="text" id="boOriginal" name="boOriginal"/><br>
 	经手人：<input type="text" id="boAttn" name="boAttn"/>
 	操作员：<input type="text" id="boOperator" name="boOperator"/>
 	备注：<input type="text" id="boRemark" name="boRemark"/>
 </form>

	<table id="dg"></table>
</body>
</html>
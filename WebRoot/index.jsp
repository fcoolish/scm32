<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<html>
  <head>
   
  </head>
  
  <body>
    <div>
   			<label for="supType">供应商类型：</label> 									
				<select id="cc" class="easyui-combobox" name="supType" style="width:200px;">   
					<c:forEach items="${applicationScope.sysParam.supType}" var="supType">
					    <option value="${supType.key}">${supType.value}</option>   
					</c:forEach>   
				</select>  
		</div>

  </body>
</html>

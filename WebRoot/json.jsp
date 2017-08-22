
  
    <title>this is a test page./title>
  	<script type="text/javascript">
  		$(
	  		function(){
	  			$("#bt1").click(
	  				function(){
		  				$.post(
		  					"supplier/doAjax.action",
		  					{supId:1001,supName:"name1001"},
		  					function(json){alert(json.supId+"||"+json.supName);},
		  					"json"
		  				);
		  			}
	  			);	  			
	  		}
  		);
  	
  	</script>
  
  </head>  
  <body>
 	<button id="bt1" >testJson</button> 
  </body>
</html>


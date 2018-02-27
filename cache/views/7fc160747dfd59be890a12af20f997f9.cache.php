<?php include $this->_include('header'); ?>
<style>
.table-query-zone .button-wh{width:128px;height:18px;}
.table-query-zone .button.easyui-combotree{width:108px;}
.table-function-zone{padding:0;}

.flex-col{display:flex;flex-direction:column;flex-wrap:wrap;}
.flex-row{display:flex;flex-direction:row;flex-wrap:wrap;}
.flex-item{padding:0;border:0;flex:1;overflow:hidden}

.box{padding:5px;border:0;align-items:center;display:flex;}
.page-header{padding:0 5px;border:0;height:30px;}
.page-main{position:absolute;width:100%;top:50px;bottom:5px}
</style>
<script src="<?php echo JLIB_PATH; ?>highcharts/highcharts.min.js"></script>
<script src="<?php echo JLIB_PATH; ?>highcharts/highcharts-more.js"></script>
<!-- <script type="text/javascript" src="<?php echo JLIB_PATH; ?>highcharts/highcharts.js"></script> -->
<body class="skin-blue tabs-body" style="overflow-x:hidden">
	<div class="flex-row page-header" >  
			<div class="flex-item box">电场交易分析</div>
			<div class="flex-item box"><select><option value="11010001">阳宗海</option></select></div>
	</div> 
	<div class="flex-col page-main" style="">

		
		<div class="flex-item flex-row" >
			<div class="flex-item box" style="justify-content:center;border:1px dotted #333">  建设中 ...</div>
			<div class="flex-item box" id="chart-companygen2"></div>
			<div class="flex-item box" id="chart-companygen3"></div>
			
			<!-- <div class="flex-item box" id="chart-companygen0"></div> -->
			<!-- <div class="flex-item box" id="chart-companygen1"></div> -->
			<!-- <div class="flex-item box" id="chart-companygen2"></div> -->
		</div>
		<div class="flex-item flex-row" > 
			<div class="flex-item box" id="chart-companygen0"></div>
			<div class="flex-item box" id="chart-companygen1"></div>
			<div class="flex-item box" id="chart-companygen2"></div>
		</div>
	</div>




<!--Wrapper End-->

</body>
<?php include $this->_include('footer'); ?>
<?php include $this->_include('header'); ?>
<style>
.table-query-zone .button-wh{width:128px;height:18px;}
.table-query-zone .button.easyui-combotree{width:108px;}
.table-function-zone{padding:0;}

.flex-col{display:flex;flex-direction:column;flex-wrap:wrap;height:100%}
.flex-row{display:flex;flex-direction:row;flex-wrap:wrap;height:100%}
.flex-item{padding:0;border:0;flex:1}

.box{padding:5px;border:0}

</style>
<script src="<?php echo JLIB_PATH; ?>highcharts/highcharts.min.js"></script>
<script src="<?php echo JLIB_PATH; ?>highcharts/highcharts-more.js"></script>
<!-- <script type="text/javascript" src="<?php echo JLIB_PATH; ?>highcharts/highcharts.js"></script> -->
<body class="skin-blue tabs-body" style="overflow-x:hidden">
<div class="flex-col" >
	<div class="flex-item flex-row">
		<?php include $this->_include('blocks/gridflow/rate'); ?>
		<div class="flex-item box" id="chart-gridrate-3"></div>
	</div>
	
	<div class="flex-item flex-row">
		<div class="flex-item box" id="chart-gridrate-4"></div>
		<div class="flex-item box" id="chart-gridrate-5"></div>
		<div class="flex-item box" id="chart-gridrate-6"></div>
	</div>

</div>




<!--Wrapper End-->

</body>
<?php include $this->_include('footer'); ?>
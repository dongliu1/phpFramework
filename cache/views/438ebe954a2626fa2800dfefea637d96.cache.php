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
		<?php include $this->_include('blocks/gridflow/rate');  include $this->_include('blocks/gridflow/trends');  include $this->_include('blocks/gridflow/user10'); ?>
	</div>
	
	<div class="flex-item flex-row">
		<?php $return = $this->_listdata("table=content_1_companygen LIKEcompanycode=YN_% order=month"); extract($return); $count=count($return); if (is_array($return)) { foreach ($return as $key=>$t) {  } } ?>
		<script>var data_companygen=<?php echo json_encode($return,256); ?>;</script>
		<?php include $this->_include('blocks/gridflow/companygen_0');  include $this->_include('blocks/gridflow/companygen_1');  include $this->_include('blocks/gridflow/companygen_2'); ?>
		<!-- <div class="flex-item box" id="chart-companygen0"></div> -->
		<!-- <div class="flex-item box" id="chart-companygen1"></div> -->
		<!-- <div class="flex-item box" id="chart-companygen2"></div> -->
	</div>

</div>




<!--Wrapper End-->

</body>
<?php include $this->_include('footer'); ?>
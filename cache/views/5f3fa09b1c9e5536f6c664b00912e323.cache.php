<?php include $this->_include('header');  $companycode=$_GET['code']?$_GET['code']:'11010001'; ?>
<style>

</style>
<script src="<?php echo JLIB_PATH; ?>highcharts/highcharts.min.js"></script>
<script src="<?php echo JLIB_PATH; ?>highcharts/highcharts-more.js"></script>
<!-- <script type="text/javascript" src="<?php echo JLIB_PATH; ?>highcharts/highcharts.js"></script> -->
<body class="skin-blue tabs-body" style="overflow-x:hidden">
	<div class="flex-row page-header" >  
			<div class="flex-item box">电场生产分析</div>
			<div class="flex-item box">
			<select id="plant-select" >
			<?php $return = $this->_listdata("table=content_1_companyinfo isdependent=1 order=code_ASC"); extract($return); $count=count($return); if (is_array($return)) { foreach ($return as $key=>$t) { ?>
			<option value="<?php echo $t['code']; ?>" <?php if ($t['code']==$companycode) { ?>selected<?php } ?>><?php echo $t['companyname']; ?></option>
			<?php } } ?>
			</select>
			<script>
				$("#plant-select").on("change",function(){
					location.href="<?php echo url('member/content',array('catid'=>$catid)); ?>&code="+$(this).val();
				})
			</script>
			</div>
	</div> 
	<div class="flex-col page-main" style="">

		
		<div class="flex-item flex-row" >
			
			<?php $return = $this->_listdata("table=content_1_companygen LIKEcompanycode=$companycode order=month_ASC"); extract($return); $count=count($return); if (is_array($return)) { foreach ($return as $key=>$t) {  } } ?>
			<script>var data_companygen=<?php echo json_encode($return,256); ?>;console.log(data_companygen)</script>
			<?php include $this->_include('blocks/companygen/0');  include $this->_include('blocks/companygen/1');  include $this->_include('blocks/companygen/2'); ?>
			<!-- <div class="flex-item box" id="chart-companygen0"></div> -->
			<!-- <div class="flex-item box" id="chart-companygen1"></div> -->
			<!-- <div class="flex-item box" id="chart-companygen2"></div> -->
		</div>
		<div class="flex-item flex-row" > 
			<?php include $this->_include('blocks/gridflow/rate');  include $this->_include('blocks/gridflow/trends'); ?>
		</div>
	</div>




<!--Wrapper End-->

</body>
<?php include $this->_include('footer'); ?>
<?php include $this->_include('header'); ?>

<style>

#loginbar{background:url(views/default/rsc/bg.jpg);height:100%;width:100%;overflow:hidden;position: absolute;bottom:0%;right:0%;}
#login{    position: absolute;bottom: 50px;right: 50px;}

#login ul{padding:10px 0 0 0;margin:0}
#login ul li{list-style-type:none;padding:10px 0 5px 0;*padding:8px 0 5px 0}
#login ul li span{float:left;text-align:left;padding-top:7px;color:#333}
#login ul li u{text-decoration:none;font-size:14px}
#login ul li.col{padding:0 0 0 49px}
#login ul li#err_m{display:none;padding:5px 0 0 0;color:#f00}
#login #verifytip{color:#808080;padding:0 0 7px 0}
#login #verifyinput{padding:10px 0 0 6px;*padding:8px 0 0 6px}
#login #label_vcode_tip{display:inline-block;font-size:12px;padding:5px 0 0 57px}
#login #verifyshow{padding:0 0 0 57px}
#login #changeimg_link{line-height:53px}
#login em{color:#F00;padding:0 3px;font-style:normal}
#login p{padding:0 0 0 32px;margin:0;color:#535353}
#login label{padding:0 0 0 8px;color:#535353;position:absolute;margin-top:10px;line-height:8px;*line-height:15px}
#login .low_login{margin-top:0}
#login .login_button{margin:0 auto;height:20px;padding:12px 0 0 62px;float:none}
#login .lineright{line-height:20px;height:20px;padding:0 10px 0 0;text-align:right}
#login .linemid{float:left;width:270px;padding:10px 0 0 30px;color:#c00;visibility:hidden}



.login{float:right;width:365px;height:365px;padding:0 0 0 24px;background-repeat:no-repeat;background-position:0 0}
.login h3{font-size:14px;text-align: center;}
.login ul{padding:22px 0 0 0}
.login li{clear:both;width:350px;display:block;overflow:hidden;position:relative}
.login li.col,.login li.col2{width:300px;height:40px;padding:53px 0 0 49px;_padding:50px 0 0 52px}
.login li.col2{padding:10px 0 0 49px;_padding:17px 0 0 52px}
.login li.col strong,.login li.col2 strong{color:#266392;font-size:14px}
.login li.col span,.login li.col2 span{color:#999}
.login li blockquote{float:left;width:50px;line-height:30px;font-size:14px}
.login li a.login_info,.login li a.login_info1{color:#889db6;margin:0 0 0 5px;position:absolute;top:7px;*top:10px;_top:7px}
.login li a.login_info1{margin-left:10px;top:38px;*top:40px;_top:38px}
.login li .keep_login{float:left;width:350px;line-height:15px;*line-height:16px;padding:3px 0 0 49px;_padding:3px 0 0 52px}
.login li .keep_login input{float:left;width:15px;height:15px}
.login li a.login_button{float:left;width:95px;height:36px;margin:17px 0 0 49px;_margin:17px 0 0 52px;display:inline;background-repeat:no-repeat;background-position:-420px -190px}
.login li a.login_button:hover{background-position:-420px -226px}
</style>
<!--Wrapper-->
<div id="loginbar">
    <div id="login">
        <div id="login_alert" class="login">
            <h3>用户登录</h3>
			<div class="main" style="border:0px;">
                <div id="normal_login">
                    <div id="web_login">
                        <form  action="<?php echo url('member/login'); ?>" method="post" >
						<input type="hidden" value="<?php echo $backurl; ?>" name="data[back]">
                        <ul id="g_list">
                        <li>
                            <span><u>&nbsp;&nbsp;会员：</u></span> <input type="text" class="inputstyle" name="data[username]" tabindex="1" />
                        </li> 
                        <li>
                            <span><u>&nbsp;&nbsp;密码：</u></span><input type="password" class="inputstyle" name="data[password]" tabindex="2" />
                        </li>
                        <?php if ($memberconfig['logincode']) { ?>
                        <li>
                            <span for="code"><u>&nbsp;&nbsp;验证：</u></span><input name="code" type="text" style="width:110px;" tabindex="3" class="inputstyle" /><label style="margin-top:0px;"><img id="code" src="<?php echo url("api/captcha/", array("width"=>80, "height"=>28)); ?>" align="absmiddle" title="看不清楚？换一张" onclick="document.getElementById('code').src='<?php echo url("api/captcha/", array("width"=>80, "height"=>28)); ?>&'+Math.random();" style="cursor:pointer; float:left"></label>
                        </li>
                        <?php } ?>
                        </ul> 
                        <div class="login_button">
                            <input type="submit" value="登 录" class="btn" tabindex="4" name="submit"/>
                            <label><input type="checkbox" id="cookie" name="data[cookie]" value="1" /> 记住登录状态</label>
                        </div>
                        <?php if ($memberconfig['isoauth']) { ?>
                        <div style="padding-top:40px; padding-left:0px; text-align:center">
                        <?php if (is_array($memberconfig['oauth'])) { $count=count($memberconfig['oauth']);foreach ($memberconfig['oauth'] as $name=>$t) {  if ($t['appid'] && $t['appkey']) { ?>
                        <a href="<?php echo url("member/login/oauth", array("name"=>$name)); ?>"><img src="<?php echo SITE_THEME; ?>images/<?php echo strtolower($name); ?>_login.gif" align="absmiddle" border="0"></a>&nbsp;&nbsp;
                        <?php }  } } ?>
                        </div>
                        <?php } ?>
                        </form>
                    </div>
                </div>
             </div>
        </div>
    </div>
</div>
<!--Wrapper End-->
<?php include $this->_include('footer'); ?>
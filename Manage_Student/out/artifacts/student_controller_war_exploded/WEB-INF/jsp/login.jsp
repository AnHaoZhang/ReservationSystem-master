<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta charset="utf-8"/>
    <title>登录 - 创新楼教室预约系统</title>

    <meta name="description" content="User login page"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0"/>

    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/images/logo/favicon.ico"
          type="image/x-icon"/>

    <!-- bootstrap & fontawesome -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css"/>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/font-awesome/4.5.0/css/font-awesome.min.css"/>

    <!-- text fonts -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/fonts.googleapis.com.css"/>

    <!-- ace styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace.min.css"/>

    <!--[if lte IE 9]>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace-part2.min.css"/>
    <![endif]-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace-rtl.min.css"/>

    <!--[if lte IE 9]>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace-ie.min.css"/>
    <![endif]-->

    <!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

    <!--[if lte IE 8]>
    <script src="${pageContext.request.contextPath}/assets/js/html5shiv.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/respond.min.js"></script>
    <![endif]-->
</head>

<body class="login-layout light-login"
      style="background: url(${pageContext.request.contextPath}/assets/images/background/background.png); background-color: #F7FAFC"
      onload="is_neizhi()">
<div class="main-container">
    <div class="main-content">
        <div class="row">
            <div class="col-sm-10 col-sm-offset-1">
                <div class="login-container" style="margin-top: 180px;">

                    <div class="space-6"></div>

                    <div class="position-relative">
                        <div id="login-box" class="login-box visible widget-box no-border">
                            <div class="widget-body">
                                <div class="widget-main">
                                    <h4 class="header blue lighter bigger">
                                        <i class="ace-icon fa fa-coffee green"></i>
                                        创新楼教室预约系统
                                    </h4>

                                    <div class="space-6"></div>

                                    <span id="errorMessage" style="color:red;">${errorMessage}</span>
                                    <form action="${pageContext.request.contextPath}/student/loginValidate.html"
                                          method="post">
                                        <fieldset>
                                            <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" class="form-control" name="username"
                                                                   placeholder="账号" required value="${username}"/>
															<i class="ace-icon fa fa-user"></i>
														</span>
                                            </label>

                                            <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="password" class="form-control" name="pwd"
                                                                   placeholder="密码" required/>
															<i class="ace-icon fa fa-lock"></i>
														</span>
                                            </label>

                                            <div class="space"></div>

                                            <div class="clearfix">
                                                <label class="inline">
                                                    <a href="${pageContext.request.contextPath}/student/forgetPassword.html">找回密码</a>
                                                </label>

                                                <button type="submit"
                                                        class="width-35 pull-right btn btn-sm btn-primary">
                                                    <i class="ace-icon fa fa-key"></i>
                                                    <span class="bigger-110">登录</span>
                                                </button>
                                            </div>

                                            <div class="space-4"></div>
                                            <div class="block clearfix">
                                                <span class="blue lighter" style="float: left;"><i class="ace-icon fa fa-phone"></i>管理员联系电话：0411-87403475</span>
                                            </div>
                                            <div class="space-4"></div>
                                        </fieldset>
                                    </form>


                                </div><!-- /.widget-body -->
                            </div><!-- /.login-box -->


                        </div><!-- /.position-relative -->


                    </div>
                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.main-content -->
    </div><!-- /.main-container -->
</div>

<!-- basic scripts -->

<!--[if !IE]> -->
<script src="${pageContext.request.contextPath}/assets/js/jquery-2.1.4.min.js"></script>

<!-- <![endif]-->

<!--[if IE]>
<script src="${pageContext.request.contextPath}/assets/js/jquery-1.11.3.min.js"></script>
<![endif]-->
<script type="text/javascript">
    if ('ontouchstart' in document.documentElement) document.write("<script src='${pageContext.request.contextPath}/assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
</script>

<!-- inline scripts related to this page -->
<script type="text/javascript">
    jQuery(function ($) {
        $(document).on('click', '.toolbar a[data-target]', function (e) {
            e.preventDefault();
            var target = $(this).data('target');
            $('.widget-box.visible').removeClass('visible');//hide others
            $(target).addClass('visible');//show target
        });
    });


    //you don't need this, just used for changing background

</script>
<script type="text/javascript">
    function is_neizhi() {
        var ua = navigator.userAgent.toLowerCase();
        var isIosQQ = (/ QQ/i.test(navigator.userAgent));
        var isAndroidQQ = (/MQQBrowser/i.test(navigator.userAgent) && /QQ/i.test((navigator.userAgent).split('MQQBrowser')));
        if (ua.match(/MicroMessenger/i) == "micromessenger") {
            return "weixin";
        }
        if (isIosQQ || isAndroidQQ) {
            //qq内置浏览器
            return "QQ";
        } else if (ua.match(/Alipay/i) == "alipay" && payway == 2) {
            return "alipay";
        }
        return false;
    }

    var isNeizhi = is_neizhi();  //调用上面js判断
    var winHeight = typeof window.innerHeight != 'undefined' ? window.innerHeight : document.documentElement.clientHeight;  //网页可视区高度
    var weixinTip = $('<div id="weixinTip"><p><img src="${pageContext.request.contextPath}/assets/images/background/live_weixin.png" alt="用浏览器打开"/></p></div>');

    if (isNeizhi) {
        $("body").append(weixinTip);
    }
    $("#weixinTip").css({
        "position": "fixed",
        "left": "0",
        "top": "0",
        "height": winHeight,
        "width": "100%",
        "z-index": "1000",
        "background-color": "rgba(0,0,0,0.8)",
        "filter": "alpha(opacity=80)",
    });
    $("#weixinTip p").css({
        "text-align": "center",
        "margin-top": "10%",
        "padding-left": "5%",
        "padding-right": "5%"
    });
    $("#weixinTip p img").css({
        "max-width": "100%",
        "height": "auto"
    });
</script>
</body>
</html>

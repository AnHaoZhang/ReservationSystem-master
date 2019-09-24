<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta charset="utf-8"/>
    <title>修改密码 - 创新楼教室预约系统</title>

    <meta name="description" content="Common UI Features &amp; Elements"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0"/>

    <link rel="shortcut icon"  href="${pageContext.request.contextPath}/assets/images/logo/favicon.ico" type="image/x-icon" />

    <!-- bootstrap & fontawesome -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css"/>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/font-awesome/4.5.0/css/font-awesome.min.css"/>

    <!-- page specific plugin styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/jquery-ui.custom.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/jquery.gritter.min.css"/>

    <!-- text fonts -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/fonts.googleapis.com.css"/>

    <!-- ace styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace.min.css" class="ace-main-stylesheet"
          id="main-ace-style"/>

    <!--[if lte IE 9]>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace-part2.min.css"
          class="ace-main-stylesheet"/>
    <![endif]-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace-skins.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace-rtl.min.css"/>

    <!--[if lte IE 9]>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace-ie.min.css"/>
    <![endif]-->

    <!-- inline styles related to this page -->
    <style>
        /* some elements used in demo only */
        .spinner-preview {
            width: 100px;
            height: 100px;
            text-align: center;
            margin-top: 60px;
        }

        .dropdown-preview {
            margin: 0 5px;
            display: inline-block;
        }

        .dropdown-preview > .dropdown-menu {
            display: block;
            position: static;
            margin-bottom: 5px;
        }
    </style>

    <!-- ace settings handler -->
    <script src="${pageContext.request.contextPath}/assets/js/ace-extra.min.js"></script>

    <!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

    <!--[if lte IE 8]>
    <script src="${pageContext.request.contextPath}/assets/js/html5shiv.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/respond.min.js"></script>
    <![endif]-->
</head>

<body class="no-skin">
<div id="navbar" class="navbar navbar-default          ace-save-state">
    <div class="navbar-container ace-save-state" id="navbar-container">
        <button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler" data-target="#sidebar">
            <span class="sr-only">Toggle sidebar</span>

            <span class="icon-bar"></span>

            <span class="icon-bar"></span>

            <span class="icon-bar"></span>
        </button>

        <div class="navbar-header pull-left">
            <a href="${pageContext.request.contextPath}/student/index.html" class="navbar-brand">
                <small>
                    <i class="fa fa-leaf"></i>
                    创新楼教室预约系统
                </small>
            </a>
        </div>

        <div class="navbar-buttons navbar-header pull-right" role="navigation">
            <ul class="nav ace-nav" style="text-align: right;">

                <li class="light-blue dropdown-modal">
                    <a data-toggle="dropdown" href="#" class="dropdown-toggle">
                        <img class="nav-user-photo"
                             src="${pageContext.request.contextPath}/assets/images/avatars/用户1.png"
                             alt="User's Photo"/>
                        <span class="user-info">
									<small>Welcome,</small>
									${student.sname}
								</span>

                        <i class="ace-icon fa fa-caret-down"></i>
                    </a>

                    <ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                        <li>
                            <a href="${pageContext.request.contextPath}/student/passwordChange.html">
                                <i class="ace-icon fa fa-cog"></i>
                                修改密码
                            </a>
                        </li>

                        <li>
                            <a href="${pageContext.request.contextPath}/student/userInfo.html">
                                <i class="ace-icon fa fa-user"></i>
                                个人详情
                            </a>
                        </li>

                        <li class="divider"></li>

                        <li>
                            <a href="${pageContext.request.contextPath}/student/logout.html">
                                <i class="ace-icon fa fa-power-off"></i>
                                退出
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div><!-- /.navbar-container -->
</div>

<div class="main-container ace-save-state" id="main-container">
    <script type="text/javascript">
        try {
            ace.settings.loadState('main-container')
        } catch (e) {
        }
    </script>

    <div id="sidebar" class="sidebar                  responsive                    ace-save-state">
        <script type="text/javascript">
            try {
                ace.settings.loadState('sidebar')
            } catch (e) {
            }
        </script>

        <ul class="nav nav-list">
            <li class="">
                <a href="${pageContext.request.contextPath}/student/notice.html">
                    <i class="menu-icon fa fa-newspaper-o"></i>
                    <span class="menu-text"> 通知公告 </span>
                </a>

                <b class="arrow"></b>
            </li>

            <li class="active open">
                <a href="#" class="dropdown-toggle">
                    <i class="menu-icon fa fa-user"></i>
                    <span class="menu-text">
								个人信息
							</span>

                    <b class="arrow fa fa-angle-down"></b>
                </a>

                <b class="arrow"></b>

                <ul class="submenu">
                    <%--<li class="">--%>
                    <%--<a href="#" class="dropdown-toggle">--%>
                    <%--<i class="menu-icon fa fa-caret-right"></i>--%>

                    <%--Layouts--%>
                    <%--<b class="arrow fa fa-angle-down"></b>--%>
                    <%--</a>--%>

                    <%--<b class="arrow"></b>--%>

                    <%--<ul class="submenu">--%>
                    <%--<li class="">--%>
                    <%--<a href="top-menu.html">--%>
                    <%--<i class="menu-icon fa fa-caret-right"></i>--%>
                    <%--Top Menu--%>
                    <%--</a>--%>

                    <%--<b class="arrow"></b>--%>
                    <%--</li>--%>

                    <%--<li class="">--%>
                    <%--<a href="two-menu-1.html">--%>
                    <%--<i class="menu-icon fa fa-caret-right"></i>--%>
                    <%--Two Menus 1--%>
                    <%--</a>--%>

                    <%--<b class="arrow"></b>--%>
                    <%--</li>--%>

                    <%--<li class="">--%>
                    <%--<a href="two-menu-2.html">--%>
                    <%--<i class="menu-icon fa fa-caret-right"></i>--%>
                    <%--Two Menus 2--%>
                    <%--</a>--%>

                    <%--<b class="arrow"></b>--%>
                    <%--</li>--%>

                    <%--<li class="">--%>
                    <%--<a href="mobile-menu-1.html">--%>
                    <%--<i class="menu-icon fa fa-caret-right"></i>--%>
                    <%--Default Mobile Menu--%>
                    <%--</a>--%>

                    <%--<b class="arrow"></b>--%>
                    <%--</li>--%>

                    <%--<li class="">--%>
                    <%--<a href="mobile-menu-2.html">--%>
                    <%--<i class="menu-icon fa fa-caret-right"></i>--%>
                    <%--Mobile Menu 2--%>
                    <%--</a>--%>

                    <%--<b class="arrow"></b>--%>
                    <%--</li>--%>

                    <%--<li class="">--%>
                    <%--<a href="mobile-menu-3.html">--%>
                    <%--<i class="menu-icon fa fa-caret-right"></i>--%>
                    <%--Mobile Menu 3--%>
                    <%--</a>--%>

                    <%--<b class="arrow"></b>--%>
                    <%--</li>--%>
                    <%--</ul>--%>
                    <%--</li>--%>

                    <li class="">
                        <a href="${pageContext.request.contextPath}/student/userInfo.html">
                            <i class="menu-icon fa fa-caret-right"></i>
                            个人详情
                        </a>

                        <b class="arrow"></b>
                    </li>

                    <li class="active">
                        <a href="${pageContext.request.contextPath}/student/passwordChange.html">
                            <i class="menu-icon fa fa-caret-right"></i>
                            修改密码
                        </a>

                        <b class="arrow"></b>
                    </li>

                    <%--<li class="">--%>
                    <%--<a href="buttons.html">--%>
                    <%--<i class="menu-icon fa fa-caret-right"></i>--%>
                    <%--Buttons &amp; Icons--%>
                    <%--</a>--%>

                    <%--<b class="arrow"></b>--%>
                    <%--</li>--%>

                    <%--<li class="">--%>
                    <%--<a href="content-slider.html">--%>
                    <%--<i class="menu-icon fa fa-caret-right"></i>--%>
                    <%--Content Sliders--%>
                    <%--</a>--%>

                    <%--<b class="arrow"></b>--%>
                    <%--</li>--%>

                    <%--<li class="">--%>
                    <%--<a href="treeview.html">--%>
                    <%--<i class="menu-icon fa fa-caret-right"></i>--%>
                    <%--Treeview--%>
                    <%--</a>--%>

                    <%--<b class="arrow"></b>--%>
                    <%--</li>--%>

                    <%--<li class="">--%>
                    <%--<a href="jquery-ui.html">--%>
                    <%--<i class="menu-icon fa fa-caret-right"></i>--%>
                    <%--jQuery UI--%>
                    <%--</a>--%>

                    <%--<b class="arrow"></b>--%>
                    <%--</li>--%>

                    <%--<li class="">--%>
                    <%--<a href="nestable-list.html">--%>
                    <%--<i class="menu-icon fa fa-caret-right"></i>--%>
                    <%--Nestable Lists--%>
                    <%--</a>--%>

                    <%--<b class="arrow"></b>--%>
                    <%--</li>--%>

                    <%--<li class="">--%>
                    <%--<a href="#" class="dropdown-toggle">--%>
                    <%--<i class="menu-icon fa fa-caret-right"></i>--%>

                    <%--Three Level Menu--%>
                    <%--<b class="arrow fa fa-angle-down"></b>--%>
                    <%--</a>--%>

                    <%--<b class="arrow"></b>--%>

                    <%--<ul class="submenu">--%>
                    <%--<li class="">--%>
                    <%--<a href="#">--%>
                    <%--<i class="menu-icon fa fa-leaf green"></i>--%>
                    <%--Item #1--%>
                    <%--</a>--%>

                    <%--<b class="arrow"></b>--%>
                    <%--</li>--%>

                    <%--<li class="">--%>
                    <%--<a href="#" class="dropdown-toggle">--%>
                    <%--<i class="menu-icon fa fa-pencil orange"></i>--%>

                    <%--4th level--%>
                    <%--<b class="arrow fa fa-angle-down"></b>--%>
                    <%--</a>--%>

                    <%--<b class="arrow"></b>--%>

                    <%--<ul class="submenu">--%>
                    <%--<li class="">--%>
                    <%--<a href="#">--%>
                    <%--<i class="menu-icon fa fa-plus purple"></i>--%>
                    <%--Add Product--%>
                    <%--</a>--%>

                    <%--<b class="arrow"></b>--%>
                    <%--</li>--%>

                    <%--<li class="">--%>
                    <%--<a href="#">--%>
                    <%--<i class="menu-icon fa fa-eye pink"></i>--%>
                    <%--View Products--%>
                    <%--</a>--%>

                    <%--<b class="arrow"></b>--%>
                    <%--</li>--%>
                    <%--</ul>--%>
                    <%--</li>--%>
                    <%--</ul>--%>
                    <%--</li>--%>
                </ul>
            </li>

            <li class="">
                <a href="#" class="dropdown-toggle">
                    <i class="menu-icon fa fa-list"></i>
                    <span class="menu-text"> 教室查询 </span>

                    <b class="arrow fa fa-angle-down"></b>
                </a>

                <b class="arrow"></b>

                <ul class="submenu">
                    <li class="">
                        <a href="${pageContext.request.contextPath}/student/ClassroomInfo.html">
                            <i class="menu-icon fa fa-caret-right"></i>
                            教室使用情况
                        </a>

                        <b class="arrow"></b>
                    </li>
                </ul>
            </li>

            <li class="">
                <a href="#" class="dropdown-toggle">
                    <i class="menu-icon fa fa-pencil-square-o"></i>
                    <span class="menu-text"> 教室预订 </span>

                    <b class="arrow fa fa-angle-down"></b>
                </a>

                <b class="arrow"></b>

                <ul class="submenu">
                    <li class="">
                        <a href="${pageContext.request.contextPath}/student/application.html">
                            <i class="menu-icon fa fa-caret-right"></i>
                            教室申请
                        </a>

                        <b class="arrow"></b>
                    </li>

                    <li class="">
                        <a href="${pageContext.request.contextPath}/student/personalOrder.html?page=1">
                            <i class="menu-icon fa fa-caret-right"></i>
                            个人申请情况
                        </a>

                        <b class="arrow"></b>
                    </li>
                </ul>
            </li>

        </ul><!-- /.nav-list -->

        <div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
            <i id="sidebar-toggle-icon" class="ace-icon fa fa-angle-double-left ace-save-state"
               data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
        </div>
    </div>

    <div class="main-content">
        <div class="main-content-inner">
            <div class="breadcrumbs ace-save-state" id="breadcrumbs">
                <ul class="breadcrumb">
                    <li>
                        <i class="ace-icon fa fa-home home-icon"></i>
                        <a href="#">首页</a>
                    </li>

                    <li>
                        <a href="#">个人信息</a>
                    </li>

                    <li class="active">修改密码</li>

                </ul>
                <!-- /.breadcrumb -->

            </div>


            <div class="page-header" style="margin-top: 10px; padding-left: 10px;">
                <h1>
                    修改密码

                </h1>
            </div>
            <!-- /.page-header -->

            <div class="row">
                <div class="col-xs-12">

                    <div class="widget-box">

                        <div class="widget-body">
                            <div class="widget-main">
                                <div id="fuelux-wizard-container">

                                    <hr/>

                                    <div class="step-content pos-rel">
                                        <div class="step-pane active" data-step="1">
                                            <h3 class="lighter block green">修改密码</h3>
                                            <span id="errorMessage" style="color:red;">${errorMessage}</span>

                                            <form class="form-horizontal" role="form"
                                                  action="${pageContext.request.contextPath}/student/updatePassword.html" method="post"
                                                  onsubmit="return validAll()">
                                                <input type="hidden" name="snum" value="${student.snum}"/>
                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right" for="form-field-2"> 原密码 </label>

                                                    <div class="col-sm-9">
                                                        <input type="password" id="form-field-3" name="originalPwd" placeholder="原密码"
                                                               class="col-xs-10 col-sm-5" value="${originalPwd}" required/>
                                                        <span class="help-inline col-xs-12 col-sm-7">
												<span class="middle" style="color: red;">${originalPwdError}</span>
                                    </span>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right" for="form-field-2"> 新密码 </label>

                                                    <div class="col-sm-9">
                                                        <input type="password" id="form-field-4" name="newPwd" placeholder="新密码"
                                                               class="col-xs-10 col-sm-5" value="${newPwd}" required onblur="validnewPwd()"
                                                               onkeyup="validnewPwd()" onkeydown="validnewPwd()"/>
                                                        <span class="help-inline col-xs-12 col-sm-7">
												<span class="middle" id="newPwdValid"
                                                      style="color: red;">${newPwdError}</span>
                                    </span>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right" for="form-field-2"> 再一次输入密码 </label>

                                                    <div class="col-sm-9">
                                                        <input type="password" id="form-field-5" name="newPwdConvinced" placeholder="再次输入密码"
                                                               value="${newPwdConvinced}" required onblur="validPwdConvinced()"
                                                               onkeyup="validPwdConvinced()" onkeydown="validPwdConvinced()"
                                                               class="col-xs-10 col-sm-5"/>
                                                        <span class="help-inline col-xs-12 col-sm-7">
												<span class="middle" id="pwdConvince"
                                                      style="color: red;">${newPwdConvincedError}</span>
                                    </span>
                                                    </div>
                                                </div>
                                                <div class="space-4"></div>


                                                <div class="space-4"></div>


                                                <div class="space-4"></div>

                                                <div class="clearfix form-actions">
                                                    <div class="col-md-offset-3 col-md-9">
                                                        <button class="btn btn-info" type="submit">
                                                            <i class="ace-icon fa fa-check bigger-110"></i>
                                                            确认修改
                                                        </button> &nbsp; &nbsp; &nbsp;
                                                        <button class="btn" type="reset">
                                                            <i class="ace-icon fa fa-undo bigger-110"></i>
                                                            重置信息
                                                        </button>
                                                    </div>
                                                </div>

                                            </form>
                                        </div>
                                    </div>
                                </div>

                                <hr/>
                            </div><!-- /.widget-main -->
                        </div><!-- /.widget-body -->
                    </div>

                    <div id="modal-wizard" class="modal">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div id="modal-wizard-container">
                                    <div class="modal-header">
                                        <ul class="steps">
                                            <li data-step="1" class="active">
                                                <span class="step">1</span>
                                                <span class="title">Validation states</span>
                                            </li>

                                            <li data-step="2">
                                                <span class="step">2</span>
                                                <span class="title">Alerts</span>
                                            </li>

                                            <li data-step="3">
                                                <span class="step">3</span>
                                                <span class="title">Payment Info</span>
                                            </li>

                                            <li data-step="4">
                                                <span class="step">4</span>
                                                <span class="title">Other Info</span>
                                            </li>
                                        </ul>
                                    </div>

                                    <div class="modal-body step-content">
                                        <div class="step-pane active" data-step="1">
                                            <div class="center">
                                                <h4 class="blue">Step 1</h4>
                                            </div>
                                        </div>

                                        <div class="step-pane" data-step="2">
                                            <div class="center">
                                                <h4 class="blue">Step 2</h4>
                                            </div>
                                        </div>

                                        <div class="step-pane" data-step="3">
                                            <div class="center">
                                                <h4 class="blue">Step 3</h4>
                                            </div>
                                        </div>

                                        <div class="step-pane" data-step="4">
                                            <div class="center">
                                                <h4 class="blue">Step 4</h4>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="modal-footer wizard-actions">
                                    <button class="btn btn-sm btn-prev">
                                        <i class="ace-icon fa fa-arrow-left"></i>
                                        Prev
                                    </button>

                                    <button class="btn btn-success btn-sm btn-next" data-last="Finish">
                                        Next
                                        <i class="ace-icon fa fa-arrow-right icon-on-right"></i>
                                    </button>

                                    <button class="btn btn-danger btn-sm pull-left" data-dismiss="modal">
                                        <i class="ace-icon fa fa-times"></i>
                                        Cancel
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div><!-- PAGE CONTENT ENDS -->
                </div><!-- /.col -->
            </div><!-- /.row -->

            <!-- PAGE CONTENT ENDS -->
        </div>
        <!-- /.col -->
    </div><!-- /.main-content -->



    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
    </a>
</div><!-- /.main-container -->

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
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>

<!-- page specific plugin scripts -->

<!--[if lte IE 8]>
<script src="${pageContext.request.contextPath}/assets/js/excanvas.min.js"></script>
<![endif]-->
<script src="${pageContext.request.contextPath}/assets/js/jquery-ui.custom.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.ui.touch-punch.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootbox.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.easypiechart.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.gritter.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/spin.js"></script>

<!-- ace scripts -->
<script src="${pageContext.request.contextPath}/assets/js/ace-elements.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/ace.min.js"></script>

<!-- inline scripts related to this page -->
<script type="text/javascript">

    function validnewPwd() {
        var obj = document.getElementById("form-field-4");
        var newPwd = obj.value;

        if (newPwd.length < 6) {
            document.getElementById("newPwdValid").innerHTML = "<font size='-1' color='red'>密码长度不能低于6位</font>";
            return false;
        } else {
            document.getElementById("newPwdValid").innerHTML = "<font size='-1' color='black'></font>";
            return true;
        }
    }

    function validPwdConvinced() {
        var obj = document.getElementById("form-field-4");
        var obj1 = document.getElementById("form-field-5");

        var pwd = obj.value;
        var pwd1 = obj1.value;

        if (pwd != pwd1) {
            document.getElementById("pwdConvince").innerHTML = "<font size='-1' color='red'>两次密码输入不一致！</font>";
            return false;
        } else {
            document.getElementById("pwdConvince").innerHTML = "<font size='-1' color='black'></font>";
            return true;
        }
    }

    function validAll() {
        return validnewPwd() && validPwdConvinced();
    }
</script>

<script type="text/javascript">
    jQuery(function ($) {
        /**
         $('#myTab a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
				  //console.log(e.target.getAttribute("href"));
				})

         $('#accordion').on('shown.bs.collapse', function (e) {
					//console.log($(e.target).is('#collapseTwo'))
				});
         */

        $('#myTab a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
            //if($(e.target).attr('href') == "#home") doSomethingNow();
        })


        /**
         //go to next tab, without user clicking
         $('#myTab > .active').next().find('> a').trigger('click');
         */


        $('#accordion-style').on('click', function (ev) {
            var target = $('input', ev.target);
            var which = parseInt(target.val());
            if (which == 2) $('#accordion').addClass('accordion-style2');
            else $('#accordion').removeClass('accordion-style2');
        });

        //$('[href="#collapseTwo"]').trigger('click');


        $('.easy-pie-chart.percentage').each(function () {
            $(this).easyPieChart({
                barColor: $(this).data('color'),
                trackColor: '#EEEEEE',
                scaleColor: false,
                lineCap: 'butt',
                lineWidth: 8,
                animate: ace.vars['old_ie'] ? false : 1000,
                size: 75
            }).css('color', $(this).data('color'));
        });

        $('[data-rel=tooltip]').tooltip();
        $('[data-rel=popover]').popover({html: true});


        $('#gritter-regular').on(ace.click_event, function () {
            $.gritter.add({
                title: 'This is a regular notice!',
                text: 'This will fade out after a certain amount of time. Vivamus eget tincidunt velit. Cum sociis natoque penatibus et <a href="#" class="blue">magnis dis parturient</a> montes, nascetur ridiculus mus.',
                image: '${pageContext.request.contextPath}/assets/images/avatars/avatar1.png', //in Ace demo ./dist will be replaced by correct assets path
                sticky: false,
                time: '',
                class_name: (!$('#gritter-light').get(0).checked ? 'gritter-light' : '')
            });

            return false;
        });

        $('#gritter-sticky').on(ace.click_event, function () {
            var unique_id = $.gritter.add({
                title: 'This is a sticky notice!',
                text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus eget tincidunt velit. Cum sociis natoque penatibus et <a href="#" class="red">magnis dis parturient</a> montes, nascetur ridiculus mus.',
                image: '${pageContext.request.contextPath}/assets/images/avatars/avatar.png',
                sticky: true,
                time: '',
                class_name: 'gritter-info' + (!$('#gritter-light').get(0).checked ? ' gritter-light' : '')
            });

            return false;
        });


        $('#gritter-without-image').on(ace.click_event, function () {
            $.gritter.add({
                // (string | mandatory) the heading of the notification
                title: 'This is a notice without an image!',
                // (string | mandatory) the text inside the notification
                text: 'This will fade out after a certain amount of time. Vivamus eget tincidunt velit. Cum sociis natoque penatibus et <a href="#" class="orange">magnis dis parturient</a> montes, nascetur ridiculus mus.',
                class_name: 'gritter-success' + (!$('#gritter-light').get(0).checked ? ' gritter-light' : '')
            });

            return false;
        });


        $('#gritter-max3').on(ace.click_event, function () {
            $.gritter.add({
                title: 'This is a notice with a max of 3 on screen at one time!',
                text: 'This will fade out after a certain amount of time. Vivamus eget tincidunt velit. Cum sociis natoque penatibus et <a href="#" class="green">magnis dis parturient</a> montes, nascetur ridiculus mus.',
                image: '${pageContext.request.contextPath}/assets/images/avatars/avatar3.png', //in Ace demo ./dist will be replaced by correct assets path
                sticky: false,
                before_open: function () {
                    if ($('.gritter-item-wrapper').length >= 3) {
                        return false;
                    }
                },
                class_name: 'gritter-warning' + (!$('#gritter-light').get(0).checked ? ' gritter-light' : '')
            });

            return false;
        });


        $('#gritter-center').on(ace.click_event, function () {
            $.gritter.add({
                title: 'This is a centered notification',
                text: 'Just add a "gritter-center" class_name to your $.gritter.add or globally to $.gritter.options.class_name',
                class_name: 'gritter-info gritter-center' + (!$('#gritter-light').get(0).checked ? ' gritter-light' : '')
            });

            return false;
        });

        $('#gritter-error').on(ace.click_event, function () {
            $.gritter.add({
                title: 'This is a warning notification',
                text: 'Just add a "gritter-light" class_name to your $.gritter.add or globally to $.gritter.options.class_name',
                class_name: 'gritter-error' + (!$('#gritter-light').get(0).checked ? ' gritter-light' : '')
            });

            return false;
        });


        $("#gritter-remove").on(ace.click_event, function () {
            $.gritter.removeAll();
            return false;
        });


        ///////


        $("#bootbox-regular").on(ace.click_event, function () {
            bootbox.prompt("What is your name?", function (result) {
                if (result === null) {

                } else {

                }
            });
        });

        $("#bootbox-confirm").on(ace.click_event, function () {
            bootbox.confirm("Are you sure?", function (result) {
                if (result) {
                    //
                }
            });
        });

        /**
         $("#bootbox-confirm").on(ace.click_event, function() {
					bootbox.confirm({
						message: "Are you sure?",
						buttons: {
						  confirm: {
							 label: "OK",
							 className: "btn-primary btn-sm",
						  },
						  cancel: {
							 label: "Cancel",
							 className: "btn-sm",
						  }
						},
						callback: function(result) {
							if(result) alert(1)
						}
					  }
					);
				});
         **/


        $("#bootbox-options").on(ace.click_event, function () {
            bootbox.dialog({
                message: "<span class='bigger-110'>I am a custom dialog with smaller buttons</span>",
                buttons:
                    {
                        "success":
                            {
                                "label": "<i class='ace-icon fa fa-check'></i> Success!",
                                "className": "btn-sm btn-success",
                                "callback": function () {
                                    //Example.show("great success");
                                }
                            },
                        "danger":
                            {
                                "label": "Danger!",
                                "className": "btn-sm btn-danger",
                                "callback": function () {
                                    //Example.show("uh oh, look out!");
                                }
                            },
                        "click":
                            {
                                "label": "Click ME!",
                                "className": "btn-sm btn-primary",
                                "callback": function () {
                                    //Example.show("Primary button");
                                }
                            },
                        "button":
                            {
                                "label": "Just a button...",
                                "className": "btn-sm"
                            }
                    }
            });
        });


        $('#spinner-opts small').css({display: 'inline-block', width: '60px'})

        var slide_styles = ['', 'green', 'red', 'purple', 'orange', 'dark'];
        var ii = 0;
        $("#spinner-opts input[type=text]").each(function () {
            var $this = $(this);
            $this.hide().after('<span />');
            $this.next().addClass('ui-slider-small').addClass("inline ui-slider-" + slide_styles[ii++ % slide_styles.length]).css('width', '125px').slider({
                value: parseInt($this.val()),
                range: "min",
                animate: true,
                min: parseInt($this.attr('data-min')),
                max: parseInt($this.attr('data-max')),
                step: parseFloat($this.attr('data-step')) || 1,
                slide: function (event, ui) {
                    $this.val(ui.value);
                    spinner_update();
                }
            });
        });


        //CSS3 spinner
        $.fn.spin = function (opts) {
            this.each(function () {
                var $this = $(this),
                    data = $this.data();

                if (data.spinner) {
                    data.spinner.stop();
                    delete data.spinner;
                }
                if (opts !== false) {
                    data.spinner = new Spinner($.extend({color: $this.css('color')}, opts)).spin(this);
                }
            });
            return this;
        };

        function spinner_update() {
            var opts = {};
            $('#spinner-opts input[type=text]').each(function () {
                opts[this.name] = parseFloat(this.value);
            });
            opts['left'] = 'auto';
            $('#spinner-preview').spin(opts);
        }


        $('#id-pills-stacked').removeAttr('checked').on('click', function () {
            $('.nav-pills').toggleClass('nav-stacked');
        });


        ///////////
        $(document).one('ajaxloadstart.page', function (e) {
            $.gritter.removeAll();
            $('.modal').modal('hide');
        });

    });
</script>
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta charset="utf-8"/>
    <title>活动发布展示</title>

    <meta name="description" content="Static &amp; Dynamic Tables"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0"/>

    <!-- bootstrap & fontawesome -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css"/>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/font-awesome/4.5.0/css/font-awesome.min.css"/>

    <!-- page specific plugin styles -->

    <!-- text fonts -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/fonts.googleapis.com.css"/>

    <!-- ace styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace.min.css" class="ace-main-stylesheet"
          id="main-ace-style"/>

    <!--[if lte IE 9]>
    <link rel="stylesheet" href="assets/css/ace-part2.min.css" class="ace-main-stylesheet"/>
    <![endif]-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace-skins.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace-rtl.min.css"/>

    <!--[if lte IE 9]>
    <link rel="stylesheet" href="assets/css/ace-ie.min.css"/>
    <![endif]-->

    <!-- inline styles related to this page -->

    <!-- ace settings handler -->
    <script src="${pageContext.request.contextPath}/assets/js/ace-extra.min.js"></script>

    <!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

    <!--[if lte IE 8]>
    <script src="${pageContext.request.contextPath}/assets/js/html5shiv.min.js"></script>
    <script src="assets/js/respond.min.js"></script>
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
            <a href="${pageContext.request.contextPath}/admin/activity.html" class="navbar-brand">
                <small>
                    <i class="fa fa-leaf"></i>
                    创新楼教室预约系统V1.0
                </small>

            </a>
        </div>
        <div class="navbar-buttons navbar-header pull-right" role="navigation">
            <ul class="nav ace-nav">





                <li class="light-blue dropdown-modal">
                    <a data-toggle="dropdown" href="#" class="dropdown-toggle">
                        <img class="nav-user-photo" src="${pageContext.request.contextPath}/assets/images/avatars/user.jpg" alt="Jason's Photo" />
                        <span class="user-info">
									<small>管理员</small>
								</span>

                        <i class="ace-icon fa fa-caret-down"></i>
                    </a>

                    <ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/changePassword.html">
                                <i class="ace-icon fa fa-cog"></i>
                                修改密码
                            </a>
                        </li>

                        <li class="divider"></li>

                        <li>
                            <a href="${pageContext.request.contextPath}/admin/existAdmin.html">
                                <i class="ace-icon fa fa-power-off"></i>
                                退出账号
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>

    </div>
    <!-- /.navbar-container -->
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
                <a href="${pageContext.request.contextPath}/admin/activity.html">
                    <i class="menu-icon fa fa-tachometer"></i>
                    <span class="menu-text"> 首页 </span>
                </a>

                <b class="arrow"></b>
            </li>
            <li class="">

                <a href="#" class="dropdown-toggle">
                    <i class="menu-icon fa fa-list-alt"></i>
                    <span class="menu-text">
                                信息发布
							</span>

                    <b class="arrow fa fa-angle-down"></b>
                </a>

                <b class="arrow"></b>

                <ul class="submenu">


                    <li class="">
                        <a href="${pageContext.request.contextPath}/admin/noticeSend.html">
                            <i class="menu-icon fa fa-caret-right"></i> 通知信息发布
                        </a>

                        <b class="arrow"></b>
                    </li>

                    <li class="">
                        <a href="${pageContext.request.contextPath}/admin/noticeHistory.html">
                            <i class="menu-icon fa fa-caret-right"></i> 通知历史记录
                        </a>

                        <b class="arrow"></b>
                    </li>
                    <li class="">
                        <a href="${pageContext.request.contextPath}/admin/activity.html">
                            <i class="menu-icon fa fa-caret-right"></i> 活动信息发布
                        </a>

                        <b class="arrow"></b>
                    </li>
                </ul>
            </li>
            <li class="">
                <a href="#" class="dropdown-toggle">
                    <i class="menu-icon fa fa-list"></i>
                    <span class="menu-text"> 信息管理 </span>

                    <b class="arrow fa fa-angle-down"></b>
                </a>

                <b class="arrow"></b>

                <ul class="submenu">


                    <li class="">
                        <a href="${pageContext.request.contextPath}/admin/studentInformation.html">
                            <i class="menu-icon fa fa-caret-right"></i> 学生信息管理
                        </a>

                        <b class="arrow"></b>
                    </li>

                    <li class="">
                        <a href="${pageContext.request.contextPath}/admin/classroomInformation.html">
                            <i class="menu-icon fa fa-caret-right"></i> 教室信息管理
                        </a>

                        <b class="arrow"></b>
                    </li>
                </ul>
            </li>
            <li class="">
                <a href="#" class="dropdown-toggle">
                    <i class="menu-icon fa fa-desktop"></i>
                    <span class="menu-text">
                                预约管理
							</span>

                    <b class="arrow fa fa-angle-down"></b>
                </a>

                <b class="arrow"></b>

                <ul class="submenu">


                    <li class="">
                        <a href="${pageContext.request.contextPath}/admin/orderTable.html">
                            <i class="menu-icon fa fa-caret-right"></i> 学生预约信息查询
                        </a>

                        <b class="arrow"></b>
                    </li>

                    <li class="">
                        <a href="${pageContext.request.contextPath}/admin/reservationClassroom.html">
                            <i class="menu-icon fa fa-caret-right"></i> 教室预约信息查询
                        </a>

                        <b class="arrow"></b>
                    </li>
                </ul>
            </li>
            <li class="">
                <a href="#" class="dropdown-toggle">
                    <i class="menu-icon fa fa-calendar"></i>
                    <span class="menu-text">
                                教室预约
                    </span>

                    <b class="arrow fa fa-angle-down"></b>
                </a>

                <b class="arrow"></b>

                <ul class="submenu">


                    <li class="">
                        <a href="${pageContext.request.contextPath}/admin/adminReservation.html">
                            <i class="menu-icon fa fa-caret-right"></i> 教室预约申请
                        </a>

                        <b class="arrow"></b>
                    </li>

                    <li class="">
                        <a href="${pageContext.request.contextPath}/admin/getAdminOrderList.html">
                            <i class="menu-icon fa fa-caret-right"></i> 教室预约历史
                        </a>

                        <b class="arrow"></b>
                    </li>
                </ul>
            </li>

            <li class="">
                <a href="#" class="dropdown-toggle">
                    <i class="menu-icon fa fa-pencil-square-o"></i>
                    <span class="menu-text"> 个人信息管理</span>
                    <b class="arrow fa fa-angle-down"></b>
                </a>

                <b class="arrow"></b>

                <ul class="submenu">

                    <li class="">
                        <a href="${pageContext.request.contextPath}/admin/changePassword.html">
                            <i class="menu-icon fa fa-caret-right"></i> 修改密码
                        </a>

                        <b class="arrow"></b>
                    </li>

                </ul>
            </li>

        </ul>
        <!-- /.nav-list -->

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
                        <a href="#">信息发布</a>
                    </li>
                    <li>
                        <a href="">活动信息发布</a>
                    <li>
                </ul>
                <!-- /.breadcrumb -->


                <div class="page-content">

                    <div class="col-xs-12">
                        <div class="clearfix">
                            <div class="pull-right tableTools-container"></div>
                        </div>
                        <div class="page-header">
                            <h1>
                                活动信息发布
                            </h1>
                        </div>


                    </div>


                    <div class="row">
                        <div class="col-xs-12">
                            <form class="form-horizontal" role="form" action="${pageContext.request.contextPath}/admin/activity.html">
                                <div class="form-group">
                                    <label class="col-sm-1 control-label no-padding-right no-padding-top" for="datepicker">日期</label>
                                    <div class="col-sm-2">
                                        <div class="input-group ">
                                            <input readonly="readonly" name="nowDate" value="${pageBean.nowDate}"  class="typeahead scrollable date-picker center" id="datepicker" type="text"
                                                   data-date-format="yyyy-mm-dd"/>
                                            <span class="input-group-addon">
									        	<i class="fa fa-calendar bigger-110"></i>
								        	</span>
                                        </div>
                                    </div>
                                    <div class="col-sm-2"></div>
                                    <div class="col-sm-2 no-padding-top">
                                        <button type="submit" class="btn btn-sm btn-primary ">
                                            <span class="ace-icon fa fa-search icon-on-right bigger-150 "></span>
                                            搜索
                                        </button>
                                    </div>

                                </div>


                            </form>

                        </div>

                    </div>

                </div>
                <!-- div.table-responsive

                <!-- div.dataTables_borderWrap -->
                <div>
                    <table id="dynamic-table" class="table table-striped table-bordered table-hover">
                        <thead>
                        <tr>
                            <th class="center">
                                教室编号
                            </th>
                            <th class="center">
                                    开始时间
                            </th>
                            <th class="center">
                                    结束时间
                            </th>
                            <th class="center">
                                活动主题
                            </th>
                            <th class="center">
                               组织单位
                            </th>



                        </tr>
                        </thead>

                        <tbody>

                        <C:forEach items="${pageBean.pageList}" var="order">
                            <tr>
                                <td class="center">
                                    ${order.cid}
                                </td>
                                <td class="center">
                                        ${order.starttime}
                                </td>
                                <td class="center">
                                    ${order.endtime}
                            </td>
                                <td class="center">
                                        ${order.theme}
                                </td>
                                <td class="center">
                                        ${order.groupname}
                                </td>
                            </tr>
                        </C:forEach>
                        </tbody>
                    </table>
                  <div class="message-footer clearfix">
            <div class="pull-right">

                &nbsp; &nbsp;
                <ul class="pagination middle">
                    <li >
                        <a href="${pageContext.request.contextPath}/admin/activity.html?currentPage=1&nowDate=${pageBean.nowDate}">
                            <i class="ace-icon fa fa-step-backward middle"></i>
                        </a>
                    </li>

                    <li >
                        <a href="${pageContext.request.contextPath}/admin/activity.html?currentPage=${pageBean.currentPage-1}&nowDate=${pageBean.nowDate}">
                            <i class="ace-icon fa fa-caret-left bigger-140 middle"></i>
                        </a>
                    </li>

                    <li>
                        <span>
                            <input readonly="readonly"  value="${pageBean.currentPage}" maxlength="3" type="text"/>
                        </span>
                    </li>

                    <li>
                        <a href="${pageContext.request.contextPath}/admin/activity.html?currentPage=${pageBean.currentPage+1}&nowDate=${pageBean.nowDate}">
                            <i class="ace-icon fa fa-caret-right bigger-140 middle"></i>
                        </a>
                    </li>

                    <li>
                        <a href="${pageContext.request.contextPath}/admin/activity.html?currentPage=${pageBean.totalPage}&nowDate=${pageBean.nowDate}">
                            <i class="ace-icon fa fa-step-forward middle"></i>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
</div></div>



<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
    <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
</a>
</div>

<script src="${pageContext.request.contextPath}/assets/js/jquery-2.1.4.min.js"></script>

<!-- <![endif]-->

<!--[if IE]>
<script src="assets/js/jquery-1.11.3.min.js"></script>
<![endif]-->
<script type="text/javascript">
    if ('ontouchstart' in document.documentElement) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
</script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>

<!-- page specific plugin scripts -->
<script src="${pageContext.request.contextPath}/assets/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.dataTables.bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/dataTables.buttons.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/buttons.flash.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/buttons.html5.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/buttons.print.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/buttons.colVis.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/dataTables.select.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap-datepicker.min.js"></script>

<!-- ace scripts -->
<script src="${pageContext.request.contextPath}/assets/js/ace-elements.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/ace.min.js"></script>

<!-- inline scripts related to this page -->
<script type="text/javascript">

    jQuery(function ($) {

        $("#datepicker").datepicker({
            showOtherMonths: true,
            selectOtherMonths: false
        });
    })
</script>
</body>

</html>
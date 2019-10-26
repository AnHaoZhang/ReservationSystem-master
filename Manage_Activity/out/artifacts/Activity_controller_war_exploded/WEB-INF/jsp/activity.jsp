<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html lang="en">

<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta charset="utf-8"/>
    <title>创新创业活动信息</title>

    <meta name="description" content="Static &amp; Dynamic Tables"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0"/>
    <meta http-equiv="refresh" content="900;url='${pageContext.request.contextPath}/admin/activity.html'">
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

    </div>
    <!-- /.navbar-container -->
</div>


    <div class="main-content">
        <div class="main-content-inner">
            <div class="breadcrumbs ace-save-state" id="breadcrumbs">



                <div class="page-content">

                    <div class="col-xs-12">
                        <div class="clearfix">
                            <div class="pull-right tableTools-container">

                            </div>
                        </div>

                        <div class="page-header center">
                            <h1 style="font-size: 60px">
                                创新创业活动信息
                            </h1>
                        </div>
                        <div class="page-header center">
                            <div align="cneter">
                            <font size="6"  color="red">禁止开展娱乐活动、举办晚会、才艺活动等</font>
                            </div>
                            <img src="${pageContext.request.contextPath}/assets/1.png">
                            <h1 style="font-size: 15px;color: #000;">
                                请使用校园网（DLU）扫描二维码访问
                                系统维护电话：18104260073 贾同学
                            </h1>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12">


                                </div>

                        </div>

                    </div>

                </div>
                <!-- div.table-responsive

                 div.dataTables_borderWrap -->
                <div>
                    <table id="dynamic-table" class="table table-striped table-bordered table-hover">
                        <thead>
                        <tr>
                            <th class="center" >
                                教室编号
                            </th>
                            <th class="center">
                                    开始时间
                            </th>
                            <th class="center" >
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
                                <td class="center" >
                                    ${order.cid}
                                </td>
                                <td class="center" >
                                        ${order.starttime}
                                </td>
                                <td class="center">
                                    ${order.endtime}
                            </td>
                                <td class="center" >
                                        ${order.theme}
                                </td>
                                <td class="center" >
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
                        <a id="xia" href="${pageContext.request.contextPath}/admin/activity.html?currentPage=${pageBean.currentPage+1}&nowDate=${pageBean.nowDate}">
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
</div>



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
<script type="text/javascript">
    $(function a(){
        setInterval(function(){
            var buy = document.getElementById('xia');//给你的a标签加一个id :btnBuy
            buy.click();
        },15000)//后面的500是以毫秒为单位。
    });
    a();
</script>
</body>

</html>
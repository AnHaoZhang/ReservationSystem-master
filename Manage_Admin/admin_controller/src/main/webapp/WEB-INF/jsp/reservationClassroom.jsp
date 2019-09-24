<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta charset="utf-8"/>
    <title>教室预约信息查询</title>

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
                    创新楼教室预约系统
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
                        <a href="#">预约信息管理</a>
                    </li>
                    <li>
                        <a href="">教室预约信息查询</a>
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
                                教室预约信息查询
                            </h1>
                        </div>


                    </div>


                    <div class="row">
                        <div class="col-xs-12">
                            <form class="form-horizontal" role="form" action="${pageContext.request.contextPath}/admin/reservationClassroom.html">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label no-padding-right no-padding-top" >
                                        教室
                                    </label>
                                    <div class="col-sm-2">
                                        <C:if test="${pageBean.totalCount eq 1}">
                                            <input onkeyup="value=value.replace(/[^\d]/g,'')" value="${pageBean.pageList[0].cid}" class="typeahead scrollable" name="cid" type="text" placeholder="教室编号" />
                                        </C:if>
                                        <C:if test="${pageBean.totalCount != 1}">
                                            <input onkeyup="value=value.replace(/[^\d]/g,'')" class="typeahead scrollable" name="cid" type="text" placeholder="教室编号" />
                                        </C:if>

                                    </div>
                                    <label class="col-sm-1 control-label no-padding-right no-padding-top" for="datepicker">日期</label>
                                    <div class="col-sm-2">
                                        <div class="input-group ">
                                            <input readonly="readonly" name="orderDate" value="${pageBean.pageList[0].orderDate}"  class="typeahead scrollable date-picker" id="datepicker" type="text"
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
                                <label class="pos-rel">
                                    教室编号
                                </label>
                            </th>
                            <th class="center">
                                <label class="pos-rel">
                                    日期
                                </label>
                            </th>
                            <th> 8:00- 9:00</th>
                            <th> 9:00-10:00</th>
                            <th>10:00-11:00</th>
                            <th>11:00-12:00</th>
                            <th>12:00-13:00</th>
                            <th>13:00-14:00</th>
                            <th>14:00-15:00</th>
                            <th>15:00-16:00</th>
                            <th>16:00-17:00</th>
                            <th>17:00-18:00</th>
                            <th>18:00-19:00</th>
                            <th>19:00-20:00</th>
                            <th>20:00-21:00</th>
                        </tr>
                        </thead>

                        <tbody>

                        <C:forEach items="${pageBean.pageList}" var="order">
                            <tr>
                                <td class="center">
                                    <label class="pos-rel">
                                            ${order.cid}
                                    </label>
                                </td>
                                <td class="center">
                                    <label class="pos-rel">
                                            ${order.orderDate}
                                    </label>
                                </td>
                                <!--8点到9点-->
                                <C:if test="${order.itemDate.dateCount[0] eq 1}">
                                    <td class="btn-danger"></td>
                                </C:if>
                                <C:if test="${order.itemDate.dateCount[0] eq 0}">
                                    <td></td>
                                </C:if>
                                <!-- 9点到10点-->
                                <C:if test="${order.itemDate.dateCount[1] eq 1}">
                                    <td class="btn-danger"></td>
                                </C:if>
                                <C:if test="${order.itemDate.dateCount[1] eq 0}">
                                    <td></td>
                                </C:if>
                                <!-- 10点到11点-->
                                <C:if test="${order.itemDate.dateCount[2] eq 1}">
                                    <td class="btn-danger"></td>
                                </C:if>
                                <C:if test="${order.itemDate.dateCount[2] eq 0}">
                                    <td></td>
                                </C:if>
                                <!-- 11点到12点-->
                                <C:if test="${order.itemDate.dateCount[3] eq 1}">
                                    <td class="btn-danger"></td>
                                </C:if>
                                <C:if test="${order.itemDate.dateCount[3] eq 0}">
                                    <td></td>
                                </C:if>
                                <!-- 12点到13点-->
                                <C:if test="${order.itemDate.dateCount[4] eq 1}">
                                    <td class="btn-danger"></td>
                                </C:if>
                                <C:if test="${order.itemDate.dateCount[4] eq 0}">
                                    <td></td>
                                </C:if>
                                <!-- 13点到14点-->
                                <C:if test="${order.itemDate.dateCount[5] eq 1}">
                                    <td class="btn-danger"></td>
                                </C:if>
                                <C:if test="${order.itemDate.dateCount[5] eq 0}">
                                    <td></td>
                                </C:if>
                                <!-- 14点到15点-->
                                <C:if test="${order.itemDate.dateCount[6] eq 1}">
                                    <td class="btn-danger"></td>
                                </C:if>
                                <C:if test="${order.itemDate.dateCount[6] eq 0}">
                                    <td></td>
                                </C:if>
                                <!-- 15点到16点-->
                                <C:if test="${order.itemDate.dateCount[7] eq 1}">
                                    <td class="btn-danger"></td>
                                </C:if>
                                <C:if test="${order.itemDate.dateCount[7] eq 0}">
                                    <td></td>
                                </C:if>
                                <!-- 16点到17点-->
                                <C:if test="${order.itemDate.dateCount[8] eq 1}">
                                    <td class="btn-danger"></td>
                                </C:if>
                                <C:if test="${order.itemDate.dateCount[8] eq 0}">
                                    <td></td>
                                </C:if>
                                <!-- 17点到18点-->
                                <C:if test="${order.itemDate.dateCount[9] eq 1}">
                                    <td class="btn-danger"></td>
                                </C:if>
                                <C:if test="${order.itemDate.dateCount[9] eq 0}">
                                    <td></td>
                                </C:if>
                                <!-- 18点到19点-->
                                <C:if test="${order.itemDate.dateCount[10] eq 1}">
                                    <td class="btn-danger"></td>
                                </C:if>
                                <C:if test="${order.itemDate.dateCount[10] eq 0}">
                                    <td></td>
                                </C:if>
                                <!-- 19点到20点-->
                                <C:if test="${order.itemDate.dateCount[11] eq 1}">
                                    <td class="btn-danger"></td>
                                </C:if>
                                <C:if test="${order.itemDate.dateCount[11] eq 0}">
                                    <td></td>
                                </C:if>
                                <!-- 20点到21点-->
                                <C:if test="${order.itemDate.dateCount[12] eq 1}">
                                    <td class="btn-danger"></td>
                                </C:if>
                                <C:if test="${order.itemDate.dateCount[12] eq 0}">
                                    <td></td>
                                </C:if>
                            </tr>
                        </C:forEach>
                        </tbody>
                    </table>
                  <div class="message-footer clearfix">
            <div class="pull-right">

                &nbsp; &nbsp;
                <ul class="pagination middle">
                    <li >
                        <a href="${pageContext.request.contextPath}/admin/reservationClassroom.html?currentPage=1&orderDate=${pageBean.pageList[0].orderDate}">
                            <i class="ace-icon fa fa-step-backward middle"></i>
                        </a>
                    </li>

                    <li >
                        <a href="${pageContext.request.contextPath}/admin/reservationClassroom.html?currentPage=${pageBean.currentPage-1}">
                            <i class="ace-icon fa fa-caret-left bigger-140 middle"></i>
                        </a>
                    </li>

                    <li>
                        <span>
                            <input readonly="readonly"  value="${pageBean.currentPage}" maxlength="3" type="text"/>
                        </span>
                    </li>

                    <li>
                        <a href="${pageContext.request.contextPath}/admin/reservationClassroom.html?currentPage=${pageBean.currentPage+1}">
                            <i class="ace-icon fa fa-caret-right bigger-140 middle"></i>
                        </a>
                    </li>

                    <li>
                        <a href="${pageContext.request.contextPath}/admin/reservationClassroom.html?currentPage=${pageBean.totalPage}">
                            <i class="ace-icon fa fa-step-forward middle"></i>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
</div>

    <%--
        <div id="modal-table" class="modal fade" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header no-padding">
                        <div class="table-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                <span class="white">&times;</span>
                            </button>
                            Results for "Latest Registered Domains
                        </div>
                    </div>

                    <div class="modal-body no-padding">
                        <table class="table table-striped table-bordered table-hover no-margin-bottom no-border-top">
                            <thead>
                            <tr>
                                <th>Domain</th>
                                <th>Price</th>
                                <th>Clicks</th>

                                <th>
                                    <i class="ace-icon fa fa-clock-o bigger-110"></i> Update
                                </th>
                            </tr>
                            </thead>

                            <tbody>
                            <tr>
                                <td>
                                    <a href="#">ace.com</a>
                                </td>
                                <td>$45</td>
                                <td>3,330</td>
                                <td>Feb 12</td>
                            </tr>

                            <tr>
                                <td>
                                    <a href="#">base.com</a>
                                </td>
                                <td>$35</td>
                                <td>2,595</td>
                                <td>Feb 18</td>
                            </tr>

                            <tr>
                                <td>
                                    <a href="#">max.com</a>
                                </td>
                                <td>$60</td>
                                <td>4,400</td>
                                <td>Mar 11</td>
                            </tr>

                            <tr>
                                <td>
                                    <a href="#">best.com</a>
                                </td>
                                <td>$75</td>
                                <td>6,500</td>
                                <td>Apr 03</td>
                            </tr>

                            <tr>
                                <td>
                                    <a href="#">pro.com</a>
                                </td>
                                <td>$55</td>
                                <td>4,250</td>
                                <td>Jan 21</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="modal-footer no-margin-top">
                        <button class="btn btn-sm btn-danger pull-left" data-dismiss="modal">
                            <i class="ace-icon fa fa-times"></i>
                            Close
                        </button>

                        <ul class="pagination pull-right no-margin">
                            <li class="prev disabled">
                                <a href="#">
                                    <i class="ace-icon fa fa-angle-double-left"></i>
                                </a>
                            </li>

                            <li class="active">
                                <a href="#">1</a>
                            </li>

                            <li>
                                <a href="#">2</a>
                            </li>

                            <li>
                                <a href="#">3</a>
                            </li>

                            <li class="next">
                                <a href="#">
                                    <i class="ace-icon fa fa-angle-double-right"></i>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>

        <!-- PAGE CONTENT ENDS -->
    </div>
    <!-- /.col -->
</div>

--%>

<!-- /.main-content -->

<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
    <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
</a>
</div>
<!-- /.main-container -->

<!-- basic scripts -->

<!--[if !IE]> -->
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
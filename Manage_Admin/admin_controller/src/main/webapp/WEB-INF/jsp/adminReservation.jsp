<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta charset="utf-8"/>
    <title>管理员预约申请</title>

    <meta name="description" content="Common form elements and layouts"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0"/>

    <!-- bootstrap & fontawesome -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css"/>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/font-awesome/4.5.0/css/font-awesome.min.css"/>

    <!-- page specific plugin styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/jquery-ui.custom.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/chosen.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap-datepicker3.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap-timepicker.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/daterangepicker.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap-datetimepicker.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap-colorpicker.min.css"/>

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
            <a href="${pageContext.request.contextPath}/student/personalOrder.html" class="navbar-brand">
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
                             src="${pageContext.request.contextPath}/assets/images/avatars/user.jpg"
                             alt="User's Photo"/>
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
                        <a href="#">教室预约</a>
                    </li>
                    <li class="active">
                       <a href="#">教室预约申请  </a>
                    </li>
                </ul><!-- /.breadcrumb -->

            </div>

            <div class="page-content">

                <div class="page-header">
                    <h1>
                        教室预约申请
                    </h1>
                </div><!-- /.page-header -->

                <div class="row">
                    <div class="alert alert-warning">
                        <button type="button" class="close" data-dismiss="alert">
                            <i class="ace-icon fa fa-times"></i>
                        </button>
                        <font style="color: red;">${actionMessage}</font>
                    </div>

                    <div class="col-xs-12">
                        <!-- PAGE CONTENT BEGINS -->
                        <form action="${pageContext.request.contextPath}/admin/adminOrder.html"
                              class="form-horizontal" id="stuApplication" role="form" method="post"
                              onsubmit="return validAll()">
                            <input name="aid" value="${admin.aid}" type="hidden"/>
                            <div class="row">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right">教室号</label>
                                    <div class="col-sm-9">
                                        <div class="clearfix">
                                            <select name="cid" id="cid" required>
                                                <option value="">请选择</option>
                                                <c:forEach items="${classroomList}" var="item">
                                                        <option value="${item.cid}">${item.cid}&nbsp;(${item.cnum}人)</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <span id="cidError"></span>
                                    </div>
                                </div>



                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right" for="form-field-5">开始日期</label>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <input class="form-control date-picker" name="startDate" id="startDate"
                                                   type="text"
                                                   value="${startdate}"
                                                   placeholder="(*必填)"
                                                   readonly="readonly"
                                                   required
                                                   onclick="var endDate=$dp.$('endDate');WdatePicker({onpicked:function(){endDate.click();},maxDate:'#F{$dp.$D(\'endDate\')}'})"
                                            />
                                            <span class="input-group-addon">
														<i class="fa fa-calendar bigger-110"></i>
													</span>
                                        </div>
                                    </div>
                                </div>



                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right" for="form-field-5">结束日期</label>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <input class="form-control date-picker" name="endDate" id="endDate"
                                                   type="text"
                                                   value="${startdate}"
                                                   placeholder="(*必填)"
                                                   readonly="readonly"

                                                   onclick="WdatePicker({minDate:'#F{$dp.$D(\'startDate\')}'})"
                                                   required/>
                                            <span class="input-group-addon">
														<i class="fa fa-calendar bigger-110"></i>
													</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right"
                                           for="form-field-5">星期</label>
                                    <div class="col-sm-9">
                                        <div class="clearfix">
                                            <select id="weekDay" name="weekDay" required>
                                                <option value="星期一">星期一</option>
                                                <option value="星期二">星期二</option>
                                                <option value="星期三">星期三</option>
                                                <option value="星期四">星期四</option>
                                                <option value="星期五">星期五</option>
                                                <option value="星期六">星期六</option>
                                                <option value="星期日">星期日</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right"
                                           for="form-field-5">开始时间</label>
                                    <div class="col-sm-9">
                                        <div class="clearfix">
                                            <select  id="startTime" name="startTime" onchange="getEndTime();" required>
                                                <option value="08:00:00">08:00</option>
                                                <option value="09:00:00">09:00</option>
                                                <option value="10:00:00">10:00</option>
                                                <option value="11:00:00">11:00</option>
                                                <option value="12:00:00">12:00</option>
                                                <option value="13:00:00">13:00</option>
                                                <option value="14:00:00">14:00</option>
                                                <option value="15:00:00">15:00</option>
                                                <option value="16:00:00">16:00</option>
                                                <option value="17:00:00">17:00</option>
                                                <option value="18:00:00">18:00</option>
                                                <option value="19:00:00">19:00</option>
                                                <option value="20:00:00">20:00</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <!--</div>-->
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right"
                                           for="form-field-5">结束时间</label>

                                    <div class="col-sm-9">
                                        <div class="clearfix">
                                            <select id="endTime" name="endTime" required>
                                            </select>
                                        </div>
                                        <div class="space-2"></div>
                                    </div>
                                </div>

                                <!--</div>-->

                                <div class="space-4"></div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right" for="form-field-5"
                                    >参加人数</label>

                                    <div class="col-sm-9">
                                        <div class="clearfix">
                                            <input class="col-xs-1" type="text" id="form-field-1" placeholder="(*必填)"
                                                   name="attendcount" value="${ordercr.attendcount}" required
                                                   onkeyup="validAttendcount()" onkeydown="validAttendcount()"
                                                   onblur="validAttendcount()"
                                                   style="width: auto;"/>
                                        </div>
                                        <span id="errorAttendcount"></span>
                                        <div class="space-2"></div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right" for="form-field-5"
                                    >负责人</label>

                                    <div class="col-sm-9">
                                        <div class="clearfix">
                                            <input class="col-xs-1" type="text" name="sname" id="form-field-5"
                                                   placeholder="" value="${admin.aid}" required readonly
                                                   style="width: auto;"/>
                                        </div>

                                        <div class="space-2"></div>

                                    </div>
                                </div>


                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right" for="form-field-5">学号</label>

                                    <div class="col-sm-9">
                                        <div class="clearfix">
                                            <input class="col-xs-1" type="text" name="snum" id="form-field-5"
                                                   placeholder="" value="${admin.aid}" required readonly
                                                   style="width: auto;"/>
                                        </div>

                                        <div class="space-2"></div>

                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right" for="form-field-tags"
                                    >联系电话</label>

                                    <div class="col-sm-9">
                                        <div class="inline">
                                            <input type="text" name="stelephone" id="form-field-tags-1"
                                                   value="" placeholder="填自己在用的电话"
                                                   title="填自己在用的电话，以便于老师临时通知" style="width: auto;"
                                                   onblur="validStelephone()" onkeydown="validStelephone()"
                                                   onkeyup="validStelephone()"/>
                                        </div>
                                        <span id="errorStelephone"></span>
                                        <div class="space-2"></div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right" for="form-field-tags"
                                    >活动主题</label>

                                    <div class="col-sm-9">
                                        <div class="inline">
                                            <input type="text" id="form-field-tags" placeholder="不超过25字(*必填)"
                                                   name="theme" value="${ordercr.theme}" required maxlength="25"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right" for="form-field-tags"
                                    >活动详情</label>

                                    <div class="col-sm-9">
                                        <div class="inline">
                                            <textarea name="details" id="form-field-tags-3"
                                                      placeholder="活动详情介绍（50-150字）" maxlength="150"
                                                      style="width: 299px; height: 121px; resize: none;"
                                                      onblur="validDetails()"
                                                      onkeydown="validDetails()"
                                                      onkeyup="validDetails()" required>${ordercr.details}</textarea>
                                        </div>
                                        <br/>
                                        <span id="errorDetails"></span>
                                        <div class="space-2"></div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right"
                                           for="form-field-tags">活动组织学院</label>
                                    <div class="col-sm-9">
                                        <div class="clearfix" id="facultySelect">
                                            <select name="faculty" required>
                                                <option value="">请选择</option>
                                                <c:forEach items="${facultyList}" var="item">
                                                    <option value="${item.id}">${item.facultyname}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right" for="form-field-5"
                                    >活动团体名称</label>

                                    <div class="col-sm-9">
                                        <div class="clearfix">
                                            <input class="col-xs-1" type="text" id="form-field-5" placeholder="(*必填)"
                                                   name="groupname" required value="${ordercr.groupname}"
                                                   style="width: auto;"
                                            />
                                        </div>

                                        <div class="space-2"></div>

                                    </div>
                                </div>

                                <div class="space-4"></div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right" for="form-field-6"
                                    >指导老师</label>

                                    <div class="col-sm-9">
                                        <input class="col-xs-1" type="text" id="form-field-5" placeholder="教师姓名(*必填)"
                                               name="teacher" value="${ordercr.teacher}" required style="width: auto;"/>
                                    </div>
                                </div>

                                <div class="space-4"></div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right" for="form-field-tags"
                                    >指导老师联系电话</label>

                                    <div class="col-sm-9">
                                        <div class="inline">
                                            <input type="text" name="ttelephone" id="form-field-tags-2"
                                                   value="" placeholder="填指导老师电话"
                                                   style="width: auto;" title="填指导老师的电话，以便于临时通知老师"
                                                   onblur="validTtelephone()" onkeydown="validTtelephone()"
                                                   onkeyup="validTtelephone()"/>
                                        </div>
                                        <span id="errorTtelephone"></span>
                                        <div class="space-2"></div>
                                    </div>
                                </div>

                                <div class="space-4"></div>

                                <div class="col-xs-12"><!--右-->

                                    <div class="clearfix form-actions">
                                        <div class="col-md-offset-3 col-md-9">
                                            <button class="btn btn-info" type="submit">
                                                <i class="ace-icon fa fa-check bigger-110"></i>
                                                提交
                                            </button>

                                            &nbsp; &nbsp; &nbsp;
                                            <button class="btn" type="reset">
                                                <i class="ace-icon fa fa-undo bigger-110"></i>
                                                重置
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div><!-- /.main-content -->
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
<script src="${pageContext.request.contextPath}/assets/js/chosen.jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/spinbox.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap-datepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap-timepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/daterangepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap-datetimepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap-colorpicker.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.knob.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/autosize.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.inputlimiter.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.maskedinput.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap-tag.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.validate.min.js"></script>

<!-- ace scripts -->
<script src="${pageContext.request.contextPath}/assets/js/ace-elements.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/ace.min.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/calendar/WdatePicker.js"></script>

<!-- inline scripts related to this page -->
<script type="text/javascript">
    function validDetails() {
        var obj = document.getElementById("form-field-tags-3");
        var details = obj.value;
        if (details.length < 50 || details.length > 150) {
            document.getElementById("errorDetails").innerHTML = "<font size='-1' color='red'>描述字数必须在50到150字之间</font>";
            return false;
        } else {
            document.getElementById("errorDetails").innerHTML = "<font size='-1'></font>";
            return true;
        }
    }
    $(document).ready(function(){
        getEndTime();
    });
    Date.prototype.Format = function (fmt) {
        var o = {
            "M+": this.getMonth() + 1, //月份
            "d+": this.getDate(), //日
            "H+": this.getHours(), //小时
            "m+": this.getMinutes(), //分
            "s+": this.getSeconds(), //秒
            "q+": Math.floor((this.getMonth() + 3) / 3), //季度
            "S": this.getMilliseconds() //毫秒
        };
        if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
        for (var k in o)
            if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        return fmt;
    };
    function getEndTime() {
        var minEndTime=$("#startTime").val().substr(0,2);
        ++minEndTime;
        var options="";
        while (minEndTime<=21)
        {
            if(minEndTime==9)
            {
                options+="<option value='09:00:00'>09:00</option>";
            }
            else
            {
                options+="<option value='"+minEndTime.toString()+":00:00'>"+minEndTime+":00</option>";
            }

            ++minEndTime;
        }
        $("#endTime").html(options);
    }
    function checknum(value) {
        var Regx = /^[0-9]*$/;
        if (Regx.test(value)) {
            return true;
        }
        else {
            return false;
        }
    }

    function validAttendcount() {
        var obj = document.getElementById("form-field-1");
        var attendcount = obj.value;
        if (!checknum(attendcount)) {
            document.getElementById("errorAttendcount").innerHTML = "<font size='-1' color='red'>人数必须为纯数字</font>";
            return false;
        } else {
            document.getElementById("errorAttendcount").innerHTML = "<font size='-1'></font>";
            return true;
        }
    }

    function validStelephone() {
        var obj = document.getElementById("form-field-tags-1");
        var stelephone = obj.value;
        if (stelephone.length != 11 || !checknum(stelephone)) {
            document.getElementById("errorStelephone").innerHTML = "<font size='-1' color='red'>手机号必须为11位纯数字</font>";
            return false;
        } else {
            document.getElementById("errorStelephone").innerHTML = "<font size='-1'></font>";
            return true;
        }
    }

    function validTtelephone() {
        var obj = document.getElementById("form-field-tags-2");
        var ttelephone = obj.value;
        if (ttelephone.length != 11 || !checknum(ttelephone)) {
            document.getElementById("errorTtelephone").innerHTML = "<font size='-1' color='red'>手机号必须为11位纯数字</font>";
            return false;
        } else {
            document.getElementById("errorTtelephone").innerHTML = "<font size='-1'></font>";
            return true;
        }
    }

    function validAll() {
        return validAttendcount() && validTtelephone() && validStelephone();
    }
</script>



</body>
</html>

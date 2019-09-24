<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>学生预约信息查询</title>

    <meta name="description" content="Static &amp; Dynamic Tables" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

    <!-- bootstrap & fontawesome -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/font-awesome/4.5.0/css/font-awesome.min.css" />

    <!-- page specific plugin styles -->

    <!-- text fonts -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/fonts.googleapis.com.css" />

    <!-- ace styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />

    <!--[if lte IE 9]>
			<link rel="stylesheet" href="assets/css/ace-part2.min.css" class="ace-main-stylesheet" />
		<![endif]-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace-skins.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace-rtl.min.css" />

    <!--[if lte IE 9]>
		  <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
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
            } catch (e) {}
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
                            <a href="#">预约管理</a>
                        </li>
                        <li>
                            <a href="">学生预约信息</a>
                        <li>
                    </ul>
                    <!-- /.breadcrumb -->


                    <!-- /.nav-search -->
                </div>




                <div class="hr hr-18 dotted hr-double"></div>



                <div class="row">
                    <div class="col-xs-12">


                        <div class="clearfix">
                            <div class="pull-right tableTools-container"></div>
                        </div>
                        <div class="table-header">
                            学生预约列表
                        </div>

                        <!-- div.table-responsive -->

                        <!-- div.dataTables_borderWrap -->
                        <div>
                            <table id="dynamic-table" class="table table-striped table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th class="center">
                                            房间号
                                        </th>
                                        <th>负责人</th>
                                        <th>学号</th>
                                        <th class="hidden-480">联系电话</th>
                                        <th>申请时间</th>
                                        <th>
                                            <i class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i> 开始时间

                                        </th>
                                        <th class="hidden-480">结束时间</th>
                                        <th>活动团体</th>
                                        <th>活动主题</th>
                                        <th>状态</th>
                                        <th class="hidden-480">操作</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <C:forEach items="${orderList}" var="order">
                                        <tr>
                                            <td class="center">
                                                <label class="pos-rel">
                                                    ${order.cid}
                                                </label>
                                            </td>

                                            <td>
                                               ${order.sname}
                                            </td>
                                            <td>${order.snum}</td>
                                            <td class="hidden-480">${order.stelephone}</td>
                                            <td>${order.createtime}</td>
                                            <td>${order.starttime}</td>
                                            <td>${order.endtime}</td>
                                            <td>${order.groupname}</td>
                                            <td>${order.theme}</td>
                                            <td class="hidden-480">
                                                <C:if test="${order.orderstatus eq 0}">
                                                    <span class="label label-sm label-warning">申请中</span>
                                                </C:if>
                                                <C:if test="${order.orderstatus eq 1}">
                                                    <span class="label label-sm label-success">同意</span>
                                                </C:if>
                                                <C:if test="${order.orderstatus eq 2}">
                                                    <span class="label label-sm label-inverse arrowed-in">拒绝</span>
                                                </C:if>
                                                <C:if test="${order.orderstatus eq 3}">
                                                    <span class="label label-sm label-danger arrowed-in">撤销</span>
                                                </C:if>
                                                <C:if test="${order.orderstatus eq 4}">
                                                    <span class="label label-sm label-info">已使用</span>
                                                </C:if>
                                            </td>

                                            <td>
                                                <C:if test="${order.orderstatus==0}">
                                                    <div class="hidden-sm hidden-xs action-buttons">
                                                        <a class="blue" href="${pageContext.request.contextPath}/admin/optionStatus.html?oid=${order.orderid}&option=1">
                                                            <span class="label label-sm label-success">同意</span>
                                                        </a>
                                                        <C:if test="${order.snum==admin.aid}">
                                                            <a class="blue" href="${pageContext.request.contextPath}/admin/optionStatus.html?oid=${order.orderid}&option=2">
                                                                <span class="label label-sm label-danger arrowed-in">撤销</span>
                                                            </a>
                                                        </C:if>
                                                        <C:if test="${order.snum != admin.aid}">
                                                            <a class="blue" href="${pageContext.request.contextPath}/admin/optionStatus.html?oid=${order.orderid}&option=2">
                                                                <span class="label label-sm label-inverse arrowed-in">拒绝</span>
                                                            </a>
                                                        </C:if>
                                                    </div>
                                                </C:if>
                                                <C:if test="${order.orderstatus == 1}">
                                                    <C:if test="${order.snum == admin.aid}">
                                                        <a class="blue" href="${pageContext.request.contextPath}/admin/adminOptionStatus.html?orderid=${order.orderid}&option=3">
                                                            <span class="label label-sm label-danger arrowed-in">撤销</span>
                                                        </a>
                                                    </C:if>
                                                    <C:if test="${order.snum!=admin.aid}">
                                                        <a class="blue" href="${pageContext.request.contextPath}/admin/optionStatus.html?oid=${order.orderid}&option=2">
                                                            <span class="label label-sm label-inverse arrowed-in">拒绝</span>
                                                        </a>
                                                    </C:if>
                                                </C:if>
                                            </td>
                                        </tr>
                                    </C:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.col -->
        </div>
        <!-- /.row -->
    </div>

    <!-- /.main-content -->


    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
    </a>
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

    <!-- ace scripts -->
    <script src="${pageContext.request.contextPath}/assets/js/ace-elements.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/ace.min.js"></script>

    <!-- inline scripts related to this page -->
    <script type="text/javascript">
        /**页面加载完成访问 getStudentList得到学生列表
         * 
        */
        jQuery(function($) {
            //  initiate dataTables plugin
            var myTable =
                $('#dynamic-table')
                //.wrap("<div class='dataTables_borderWrap' />")   //if you are applying horizontal scrolling (sScrollX)
                .DataTable({
                    bAutoWidth: false,
                    "aoColumns": [{

                        },
                        null, null, null, null, null, null, null, null, null,{
                            "bSortable": false
                        }
                    ],
                    "aaSorting": []
                });



            $.fn.dataTable.Buttons.defaults.dom.container.className = 'dt-buttons btn-overlap btn-group btn-overlap';

            new $.fn.dataTable.Buttons(myTable, {
                buttons: [{
                    "extend": "copy",
                    "text": "<i class='fa fa-copy bigger-110 pink'></i> <span class='hidden'>复制</span>",
                    "className": "btn btn-white btn-primary btn-bold"
                }, {
                    "extend": "csv",
                    "text": "<i class='fa fa-database bigger-110 orange'></i> <span class='hidden'>导出excle</span>",
                    "className": "btn btn-white btn-primary btn-bold"
                }
                ]
            });
            myTable.buttons().container().appendTo($('.tableTools-container'));

            //style the message box
            var defaultCopyAction = myTable.button(1).action();
            myTable.button(1).action(function(e, dt, button, config) {
                defaultCopyAction(e, dt, button, config);
                $('.dt-button-info').addClass('gritter-item-wrapper gritter-info gritter-center white');
            });


            var defaultColvisAction = myTable.button(0).action();
            myTable.button(0).action(function(e, dt, button, config) {

                defaultColvisAction(e, dt, button, config);


                if ($('.dt-button-collection > .dropdown-menu').length == 0) {
                    $('.dt-button-collection')
                        .wrapInner('<ul class="dropdown-menu dropdown-light dropdown-caret dropdown-caret" />')
                        .find('a').attr('href', '#').wrap("<li />")
                }
                $('.dt-button-collection').appendTo('.tableTools-container .dt-buttons')
            });

            //

            setTimeout(function() {
                $($('.tableTools-container')).find('a.dt-button').each(function() {
                    var div = $(this).find(' > div').first();
                    if (div.length == 1) div.tooltip({
                        container: 'body',
                        title: div.parent().text()
                    });
                    else $(this).tooltip({
                        container: 'body',
                        title: $(this).text()
                    });
                });
            }, 500);





            $('[data-rel="tooltip"]').tooltip({
                placement: tooltip_placement
            });


            function tooltip_placement(context, source) {
                var $source = $(source);
                var $parent = $source.closest('table')
                var off1 = $parent.offset();
                var w1 = $parent.width();

                var off2 = $source.offset();
                //var w2 = $source.width();

                if (parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2)) return 'right';
                return 'left';
            }

            $('.show-details-btn').on('click', function(e) {
                e.preventDefault();
                $(this).closest('tr').next().toggleClass('open');
                $(this).find(ace.vars['.icon']).toggleClass('fa-angle-double-down').toggleClass('fa-angle-double-up');
            });


        })
    </script>
</body>

</html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta charset="utf-8"/>
    <title>账号激活 - 创新楼教室预约系统</title>

    <meta name="description" content="and Validation"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0"/>

    <link rel="shortcut icon"  href="${pageContext.request.contextPath}/assets/images/logo/favicon.ico" type="image/x-icon" />

    <!-- bootstrap & fontawesome -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css"/>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/font-awesome/4.5.0/css/font-awesome.min.css"/>

    <!-- page specific plugin styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/select2.min.css"/>

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
            <a href="${pageContext.request.contextPath}/student/activeAccount.html" class="navbar-brand">
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
									<small>Hello, <br/>welcome!</small>
								</span>

                        <i class="ace-icon fa fa-caret-down"></i>
                    </a>

                    <ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                        <li>
                            <a href="${pageContext.request.contextPath}/student/activeAccount.html">
                                <i class="ace-icon fa fa-cog"></i>
                                修改密码
                            </a>
                        </li>

                        <li>
                            <a href="${pageContext.request.contextPath}/student/activeAccount.html">
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
                <li class="active">账号激活</li>
            </ul><!-- /.breadcrumb -->

        </div>

        <div class="page-content">

            <div class="page-header">
                <h1>
                    账号激活
                </h1>
            </div><!-- /.page-header -->

            <div class="row">
                <div class="col-xs-12">

                    <div class="hr hr-18 hr-double dotted"></div>

                    <div class="widget-box">


                        <div class="widget-body">
                            <div class="widget-main">
                                <div id="fuelux-wizard-container">

                                    <hr/>

                                    <div class="step-content pos-rel">
                                        <div class="step-pane active" data-step="1">
                                            <h3 class="lighter block green">激活账户</h3>
                                            <span id="errorMessage" style="color:red;">${errorMessage}</span>

                                            <form class="form-horizontal" id="sample-form"
                                                  action="${pageContext.request.contextPath}/student/doActive.html"
                                                  method="post" onsubmit="return validAll()">
                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right"
                                                           for="form-field-tags">学号</label>

                                                    <div class="col-sm-9">
                                                        <div class="inline">
                                                            <input type="text" id="form-field-tags-1" placeholder=""
                                                                   name="snum"
                                                                   value="${snum}" readonly="readonly"/>
                                                        </div>
                                                    </div>
                                                </div>


                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right"
                                                           for="form-field-tags">姓名</label>

                                                    <div class="col-sm-9">
                                                        <div class="inline">
                                                            <input type="text" id="form-field-tags-2"
                                                                   placeholder="请输入姓名"
                                                                   name="sname"
                                                                   value="${sname}" required/>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right"
                                                           for="form-field-tags">身份证号</label>

                                                    <div class="col-sm-9">
                                                        <div class="inline">
                                                            <input type="text" id="form-field-tags-3"
                                                                   placeholder="请输入18位身份证号"
                                                                   name="sid"
                                                                   value="${sid}" required onblur="validSid()"
                                                                   onkeyup="validSid()" onkeydown="validSid()"/>
                                                        </div>
                                                        <span id="sidError"></span>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right"
                                                           for="form-field-tags">电话号码</label>

                                                    <div class="col-sm-9">
                                                        <div class="inline">
                                                            <input type="text" id="form-field-tags-4"
                                                                   placeholder="请填写你的电话号码"

                                                                   name="stelphone"
                                                                   value="${stelphone}" required
                                                                   onblur="validStelephone()"
                                                                   onkeydown="validStelephone()"
                                                                   onkeyup="validStelephone()"/>
                                                        </div>
                                                        <span id="stelephoneError"></span>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right"
                                                           for="form-field-tags">修改密码</label>

                                                    <div class="col-sm-9">
                                                        <div class="inline">
                                                            <input type="password" id="form-field-tags-5"
                                                                   placeholder="请修改你的密码"

                                                                   name="spwd"
                                                                   value="${spwd}" required onblur="validSpwd()"
                                                                   onkeyup="validSpwd()" onkeydown="validSpwd()"/>
                                                        </div>
                                                        <span id="spwdError"></span>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right"
                                                           for="form-field-tags">确认密码</label>

                                                    <div class="col-sm-9">
                                                        <div class="inline">
                                                            <input type="password" id="form-field-tags-6"
                                                                   placeholder="请再输入一次密码"

                                                                   name="spwdConvinced"
                                                                   value="${spwdConvinced}" required
                                                                   onblur="validSpwdConvinced()"
                                                                   onkeyup="validSpwdConvinced()"
                                                                   onkeydown="validSpwdConvinced()"/>
                                                        </div>
                                                        <span id="spwdConvincedError"></span>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <div class="col-md-offset-3 col-md-9">
                                                        <!--<div class="inline">-->
                                                        <button type="submit" class="btn btn-lg btn-success">
                                                            <i class="ace-icon fa fa-check"></i>
                                                            激活
                                                        </button>
                                                        <!--</div>-->
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
        </div><!-- /.page-content -->
    </div>
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
<script src="${pageContext.request.contextPath}/assets/js/wizard.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery-additional-methods.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootbox.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.maskedinput.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/select2.min.js"></script>

<!-- ace scripts -->
<script src="${pageContext.request.contextPath}/assets/js/ace-elements.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/ace.min.js"></script>

<!-- inline scripts related to this page -->
<script type="text/javascript">
    function checknum(value) {
        var Regx = /^[0-9]*$/;
        if (Regx.test(value)) {
            return true;
        }
        else {
            return false;
        }
    }

    function validSid() {
        var obj = document.getElementById("form-field-tags-3");
        var sid = obj.value;

        if (sid.length != 18) {
            document.getElementById("sidError").innerHTML = "<font size='-1' color='red'>身份证号码长度为18位</font>";
            return false;
        } else {
            document.getElementById("sidError").innerHTML = "<font size='-1' color='black'></font>";
            return true;
        }
    }

    function validStelephone() {
        var obj = document.getElementById("form-field-tags-4");
        var stelephone = obj.value;

        if (stelephone.length != 11 || !checknum(stelephone)) {
            document.getElementById("stelephoneError").innerHTML = "<font size='-1' color='red'>手机号码长度为11位纯数字</font>";
            return false;
        } else {
            document.getElementById("stelephoneError").innerHTML = "<font size='-1' color='black'></font>";
            return true;
        }
    }

    function validSpwd() {
        var obj = document.getElementById("form-field-tags-5");
        var spwd = obj.value;

        if (spwd.length < 6) {
            document.getElementById("spwdError").innerHTML = "<font size='-1' color='red'>密码长度小于6位</font>";
            return false;
        } else if (spwd == document.getElementById("form-field-tags-1").value) {
            document.getElementById("spwdError").innerHTML = "<font size='-1' color='red'>密码不能与初始密码重复</font>";
            return false;
        } else {
            document.getElementById("spwdError").innerHTML = "<font size='-1' color='black'></font>";
            return true;
        }
    }

    function validSpwdConvinced() {
        var obj1 = document.getElementById("form-field-tags-6");
        var obj = document.getElementById("form-field-tags-5");

        var spwd = obj.value;
        var spwdConvinced = obj1.value;

        if (spwdConvinced != spwd) {
            document.getElementById("spwdConvincedError").innerHTML = "<font size='-1' color='red'>两次密码输入不一致</font>";
            return false;
        } else {
            document.getElementById("spwdConvincedError").innerHTML = "<font size='-1' color='black'></font>";
            return true;
        }
    }

    function validAll() {
        return validSid() && validStelephone() && validSpwd() && validSpwdConvinced();
    }
</script>

<script type="text/javascript">
    jQuery(function ($) {

        $('[data-rel=tooltip]').tooltip();

        $('.select2').css('width', '200px').select2({allowClear: true})
            .on('change', function () {
                $(this).closest('form').validate().element($(this));
            });


        var $validation = false;
        $('#fuelux-wizard-container')
            .ace_wizard({
                //step: 2 //optional argument. wizard will jump to step "2" at first
                //buttons: '.wizard-actions:eq(0)'
            })
            .on('actionclicked.fu.wizard', function (e, info) {
                if (info.step == 1 && $validation) {
                    if (!$('#validation-form').valid()) e.preventDefault();
                }
            })
            //.on('changed.fu.wizard', function() {
            //})
            .on('finished.fu.wizard', function (e) {
                bootbox.dialog({
                    message: "Thank you! Your information was successfully saved!",
                    buttons: {
                        "success": {
                            "label": "OK",
                            "className": "btn-sm btn-primary"
                        }
                    }
                });
            }).on('stepclick.fu.wizard', function (e) {
            //e.preventDefault();//this will prevent clicking and selecting steps
        });


        //jump to a step
        /**
         var wizard = $('#fuelux-wizard-container').data('fu.wizard')
         wizard.currentStep = 3;
         wizard.setState();
         */

        //determine selected step
        //wizard.selectedItem().step


        //hide or show the other form which requires validation
        //this is for demo only, you usullay want just one form in your application
        $('#skip-validation').removeAttr('checked').on('click', function () {
            $validation = this.checked;
            if (this.checked) {
                $('#sample-form').hide();
                $('#validation-form').removeClass('hide');
            }
            else {
                $('#validation-form').addClass('hide');
                $('#sample-form').show();
            }
        })


        //documentation : http://docs.jquery.com/Plugins/Validation/validate


        $.mask.definitions['~'] = '[+-]';
        $('#phone').mask('(999) 999-9999');

        jQuery.validator.addMethod("phone", function (value, element) {
            return this.optional(element) || /^\(\d{3}\) \d{3}\-\d{4}( x\d{1,6})?$/.test(value);
        }, "Enter a valid phone number.");

        $('#validation-form').validate({
            errorElement: 'div',
            errorClass: 'help-block',
            focusInvalid: false,
            ignore: "",
            rules: {
                email: {
                    required: true,
                    email: true
                },
                password: {
                    required: true,
                    minlength: 5
                },
                password2: {
                    required: true,
                    minlength: 5,
                    equalTo: "#password"
                },
                name: {
                    required: true
                },
                phone: {
                    required: true,
                    phone: 'required'
                },
                url: {
                    required: true,
                    url: true
                },
                comment: {
                    required: true
                },
                state: {
                    required: true
                },
                platform: {
                    required: true
                },
                subscription: {
                    required: true
                },
                gender: {
                    required: true,
                },
                agree: {
                    required: true,
                }
            },

            messages: {
                email: {
                    required: "Please provide a valid email.",
                    email: "Please provide a valid email."
                },
                password: {
                    required: "Please specify a password.",
                    minlength: "Please specify a secure password."
                },
                state: "Please choose state",
                subscription: "Please choose at least one option",
                gender: "Please choose gender",
                agree: "Please accept our policy"
            },


            highlight: function (e) {
                $(e).closest('.form-group').removeClass('has-info').addClass('has-error');
            },

            success: function (e) {
                $(e).closest('.form-group').removeClass('has-error');//.addClass('has-info');
                $(e).remove();
            },

            errorPlacement: function (error, element) {
                if (element.is('input[type=checkbox]') || element.is('input[type=radio]')) {
                    var controls = element.closest('div[class*="col-"]');
                    if (controls.find(':checkbox,:radio').length > 1) controls.append(error);
                    else error.insertAfter(element.nextAll('.lbl:eq(0)').eq(0));
                }
                else if (element.is('.select2')) {
                    error.insertAfter(element.siblings('[class*="select2-container"]:eq(0)'));
                }
                else if (element.is('.chosen-select')) {
                    error.insertAfter(element.siblings('[class*="chosen-container"]:eq(0)'));
                }
                else error.insertAfter(element.parent());
            },

            submitHandler: function (form) {
            },
            invalidHandler: function (form) {
            }
        });


        $('#modal-wizard-container').ace_wizard();
        $('#modal-wizard .wizard-actions .btn[data-dismiss=modal]').removeAttr('disabled');


        /**
         $('#date').datepicker({autoclose:true}).on('changeDate', function(ev) {
					$(this).closest('form').validate().element($(this));
				});

         $('#mychosen').chosen().on('change', function(ev) {
					$(this).closest('form').validate().element($(this));
				});
         */


        $(document).one('ajaxloadstart.page', function (e) {
            //in ajax mode, remove remaining elements before leaving page
            $('[class*=select2]').remove();
        });
    })
</script>
</body>
</html>

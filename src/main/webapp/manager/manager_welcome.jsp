<%@ page contentType="text/html;charset=UTF-8" language="java" %>   <%--jsp--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    <%--jstl--%>
<%
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + request.getContextPath() + "/";
%>  <%--取base--%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <title>管理员首页</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="layuimini/lib/layui-v2.6.3/css/layui.css" media="all">
    <link rel="stylesheet" href="layuimini/lib/font-awesome-4.7.0/css/font-awesome.min.css" media="all">
    <link rel="stylesheet" href="layuimini/css/public.css" media="all">
    <script src="layuimini/lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
    <script src="layuimini/js/lay-config.js?v=1.0.4" charset="utf-8"></script>

    <style>
        .layui-card {border:1px solid #f2f2f2;border-radius:5px;}
        .icon {margin-right:10px;color:#1aa094;}
        .icon-cray {color:#ffb800!important;}
        .icon-blue {color:#1e9fff!important;}
        .icon-tip {color:#ff5722!important;}
        .layuimini-qiuck-module {text-align:center;margin-top: 10px}
        .layuimini-qiuck-module a i {display:inline-block;width:100%;height:60px;line-height:60px;text-align:center;border-radius:2px;font-size:30px;background-color:#F8F8F8;color:#333;transition:all .3s;-webkit-transition:all .3s;}
        .layuimini-qiuck-module a cite {position:relative;top:2px;display:block;color:#666;text-overflow:ellipsis;overflow:hidden;white-space:nowrap;font-size:14px;}
        .welcome-module {width:100%;height:210px;}
        .panel {background-color:#fff;border:1px solid transparent;border-radius:3px;-webkit-box-shadow:0 1px 1px rgba(0,0,0,.05);box-shadow:0 1px 1px rgba(0,0,0,.05)}
        .panel-body {padding:10px}
        .panel-title {margin-top:0;margin-bottom:0;font-size:12px;color:inherit}
        .label {display:inline;padding:.2em .6em .3em;font-size:75%;font-weight:700;line-height:1;color:#fff;text-align:center;white-space:nowrap;vertical-align:baseline;border-radius:.25em;margin-top: .3em;}
        .layui-red {color:red}
        .main_btn > p {height:40px;}
        .layui-bg-number {background-color:#F8F8F8;}
        .layuimini-notice:hover {background:#f6f6f6;}
        .layuimini-notice {padding:7px 16px;clear:both;font-size:12px !important;cursor:pointer;position:relative;transition:background 0.2s ease-in-out;}
        .layuimini-notice-title,.layuimini-notice-label {
            padding-right: 70px !important;text-overflow:ellipsis!important;overflow:hidden!important;white-space:nowrap!important;}
        .layuimini-notice-title {line-height:28px;font-size:14px;}
        .layuimini-notice-extra {position:absolute;top:50%;margin-top:-8px;right:16px;display:inline-block;height:16px;color:#999;}
    </style>
</head>
<body>
<div class="layuimini-container">
    <div class="layuimini-main">
        <div class="layui-row layui-col-space15">
            <div class="layui-col-md8">
                <div class="layui-row layui-col-space15">
                    <div class="layui-col-md12">
                        <%--数据统计--%>
                        <div class="layui-card">
                            <div class="layui-card-header"><i class="fa fa-warning icon"></i>数据统计</div>
                            <div class="layui-card-body">
                                <div class="welcome-module" style="height: 105px">
                                    <div class="layui-row layui-col-space10">
                                        <div class="layui-col-xs3">
                                            <div class="panel layui-bg-number">
                                                <div class="panel-body">
                                                    <div class="panel-title">
                                                        <span class="label pull-right layui-bg-blue">实时</span>
                                                        <h5>学生统计</h5>
                                                    </div>
                                                    <div class="panel-content">
                                                        <h1 class="no-margins" id="student_count">等待加载</h1>
                                                        <small>当前学生数量</small>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="layui-col-xs3">
                                            <div class="panel layui-bg-number">
                                                <div class="panel-body">
                                                    <div class="panel-title">
                                                        <span class="label pull-right layui-bg-cyan">实时</span>
                                                        <h5>教师统计</h5>
                                                    </div>
                                                    <div class="panel-content">
                                                        <h1 class="no-margins" id="teacher_count">等待加载</h1>
                                                        <small>当前教师数量</small>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="layui-col-xs3">
                                            <div class="panel layui-bg-number">
                                                <div class="panel-body">
                                                    <div class="panel-title">
                                                        <span class="label pull-right layui-bg-orange">实时</span>
                                                        <h5>开课统计</h5>
                                                    </div>
                                                    <div class="panel-content">
                                                        <h1 class="no-margins" id="open_course_count">等待加载</h1>
                                                        <small>当前开课数量</small>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="layui-col-xs3">
                                            <div class="panel layui-bg-number">
                                                <div class="panel-body">
                                                    <div class="panel-title">
                                                        <span class="label pull-right layui-bg-green">实时</span>
                                                        <h5>审批统计</h5>
                                                    </div>
                                                    <div class="panel-content">
                                                        <h1 class="no-margins" id="approval_untreated_count">等待加载</h1>
                                                        <small>未处理的审批</small>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="layui-col-md12">
                        <!-- 系统公告 -->
                        <div class="layui-card" style="height: 730px;">
                            <div class="layui-card-header"><i class="fa fa-bullhorn icon icon-tip"></i>系统公告</div>
                            <div style="margin: 15px;">

                                <table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>

                            </div>
                        </div>
                    </div>


                </div>
            </div>

            <div class="layui-col-md4">
                <%--快捷入口--%>
                <div class="layui-card">
                    <div class="layui-card-header"><i class="fa fa-credit-card icon icon-blue"></i>快捷入口</div>
                    <div class="layui-card-body">
                        <div class="welcome-module">
                            <div class="layui-row layui-col-space10 layuimini-qiuck">
                                <div class="layui-col-xs3 layuimini-qiuck-module">
                                    <a href="javascript:;" layuimini-content-href="manager/student_list.jsp" data-title="学生管理" data-icon="fa fa-pencil">
                                        <i class="fa fa-pencil"></i>
                                        <cite>学生管理</cite>
                                    </a>
                                </div>
                                <div class="layui-col-xs3 layuimini-qiuck-module">
                                    <a href="javascript:;" layuimini-content-href="manager/teacher_list.jsp" data-title="教师管理" data-icon="fa fa-briefcase">
                                        <i class="fa fa-briefcase"></i>
                                        <cite>教师管理</cite>
                                    </a>
                                </div>
                                <div class="layui-col-xs3 layuimini-qiuck-module">
                                    <a href="javascript:;" layuimini-content-href="manager/clazz_list.jsp" data-title="班级管理" data-icon="fa fa-window-maximize">
                                        <i class="fa fa-window-maximize"></i>
                                        <cite>班级管理</cite>
                                    </a>
                                </div>
                                <div class="layui-col-xs3 layuimini-qiuck-module">
                                    <a href="javascript:;" layuimini-content-href="manager/room_list.jsp" data-title="教室管理" data-icon="fa fa-bank">
                                        <i class="fa fa-bank"></i>
                                        <cite>教室管理</cite>
                                    </a>
                                </div>
                                <div class="layui-col-xs3 layuimini-qiuck-module">
                                    <a href="javascript:;" layuimini-content-href="manager/open_course_list.jsp" data-title="开课管理" data-icon="fa fa-calendar">
                                        <i class="fa fa-calendar"></i>
                                        <cite>开课管理</cite>
                                    </a>
                                </div>
                                <div class="layui-col-xs3 layuimini-qiuck-module">
                                    <a href="javascript:;" layuimini-content-href="manager/approval_list.jsp" data-title="审批管理" data-icon="fa fa-book">
                                        <i class="fa fa-book"></i>
                                        <cite>审批管理</cite>
                                    </a>
                                </div>
                                <div class="layui-col-xs3 layuimini-qiuck-module">
                                    <a href="javascript:;" layuimini-content-href="manager/manager_list.jsp" data-title="管理员管理" data-icon="fa fa-cloud">
                                        <i class="fa fa-cloud"></i>
                                        <cite>管理员管理</cite>
                                    </a>
                                </div>
                                <div class="layui-col-xs3 layuimini-qiuck-module">
                                    <a href="javascript:;" layuimini-content-href="common/password.jsp" data-title="修改密码" data-icon="fa fa-key">
                                        <i class="fa fa-key"></i>
                                        <cite>修改密码</cite>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%--版本信息--%>
<%--                <div class="layui-card">--%>
<%--                    <div class="layui-card-header"><i class="fa fa-fire icon"></i>版本信息</div>--%>
<%--                    <div class="layui-card-body layui-text">--%>
<%--                        <table class="layui-table">--%>
<%--                            <colgroup>--%>
<%--                                <col width="100">--%>
<%--                                <col>--%>
<%--                            </colgroup>--%>
<%--                            <tbody>--%>
<%--                            <tr>--%>
<%--                                <td>项目名称</td>--%>
<%--                                <td>--%>
<%--                                    StudentManager学生管理系统 V1.0.1--%>
<%--                                </td>--%>
<%--                            </tr>--%>
<%--                            <tr>--%>
<%--                                <td>作者</td>--%>
<%--                                <td>江苏第二师范学院 数学与信息技术学院 王鹏</td>--%>
<%--                            </tr>--%>
<%--                            <tr>--%>
<%--                                <td>演示地址</td>--%>
<%--                                <td>--%>
<%--                                    在线演示：<a href="http://47.97.104.230:8098/StudentManager/index.jsp" target="_blank">点击查看</a><br>--%>
<%--                                    管理员账号：admin       密码：admin<br>--%>
<%--                                    教师端账号：15001       密码：123456<br>--%>
<%--                                    学生端账号：2020710001  密码：123456<br>--%>
<%--                                </td>--%>
<%--                            </tr>--%>
<%--                            <tr>--%>
<%--                                <td>下载地址</td>--%>
<%--                                <td>--%>
<%--                                    <a href="https://github.com/huanfenz/StudentManager" target="_blank">github</a> / <a href="https://gitee.com/huanfenz/StudentManager" target="_blank">gitee</a><br>--%>
<%--                                    喜欢此项目的可以给我的GitHub和Gitee加个Star支持一下--%>
<%--                                </td>--%>
<%--                            </tr>--%>
<%--                            <tr>--%>
<%--                                <td>联系方式</td>--%>
<%--                                <td>--%>
<%--                                    QQ 894176237--%>
<%--                                </td>--%>
<%--                            </tr>--%>
<%--                            </tbody>--%>
<%--                        </table>--%>
<%--                    </div>--%>
<%--                </div>--%>

            </div>
        </div>
    </div>
</div>

<script>
    layui.use(['layer', 'miniTab', 'table'], function () {
        var $ = layui.jquery,
            layer = layui.layer,
            miniTab = layui.miniTab,
            table = layui.table;

        miniTab.listen();

        // 获取数据
        $.ajax({
            url: 'welcome/getAllCount.do',
            type: 'get',
            datatype: 'json',
            success: function (res) {
                console.log(res);
                $("#student_count").html(res.studentCount);
                $("#teacher_count").html(res.teacherCount);
                $("#open_course_count").html(res.openCourseCount);
                $("#approval_untreated_count").html(res.approvalCount);
            }
        });

        // 加载数据表格
        table.render({
            elem: '#currentTableId',
            url: 'article/queryArticles.do',
            cols: [[
                {field: 'id', width: 50, title: '序号', type: 'numbers'},
                {field: 'title', width: 500, title: '文章标题', event: 'show', style:'cursor: pointer;'}, /*手形状*/
                {field: 'people', title: '添加人'},
                {field: 'date', title: '日期', sort: true}
            ]],
            limits: [10, 15, 20, 25, 50, 100],
            limit: 15,
            page: {
                prev: '上一页',
                next: '下一页',
            }
        });

        // 监听单元格事件
        table.on('tool(currentTableFilter)', function(obj){
            if(obj.event === 'show') {
                var mdata = obj.data;
                layer.open({
                    title: mdata.title,
                    type: 2,    //iframe
                    shadeClose: true,
                    area: ['95%', '95%'],
                    scrollbar: false,
                    content: mdata.url
                })
            }
        });

    });
</script>
</body>
</html>

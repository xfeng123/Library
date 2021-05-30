<%@ page import="com.shy.pojo.Book" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>图书管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../layui/css/layui.css" media="all">
    <style>
        .wrap-div {
            display: -webkit-box;
            -webkit-box-orient: vertical;
            -webkit-line-clamp: 3;
            overflow: hidden;
            float: left;
            width: 100%;
            word-break: break-all;
            text-overflow: ellipsis;
        }
    </style>
</head>
<body>

<div class="layui-nav-item demoTable" style="display: flex;justify-content: flex-end;">
    <input id="keyword" type="text" class="layui-input"
           style="padding: 0;display: inline;width: 300px;"
           placeholder="请输入搜索信息..."/>
    <button id="search" class="layui-btn" data-type="getCheckLength" style="margin-left: 20px;">搜索</button>
</div>

<div class="layui-form" id="content">
    <button 	class="layui-btn layui-btn-normal" id="addBooksBtn">添加图书</button>
    <table class="layui-table" style="table-layout:fixed">
        <colgroup>
            <col width="150">
            <col width="150">
            <col width="200">
            <col>
            <col width="180">
        </colgroup>
        <thead>
        <tr>
            <th>书名</th>
            <th>作者</th>
            <th>分类</th>
            <th>描述</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="book" items="${sessionScope.books}" varStatus="status">
            <tr>
                <td>${book.name}</td>
                <td>${book.author}</td>
                <td>${book.sort}</td>
                <td class="wrap-td">
                    <div class="wrap-div">${book.description}</div>
                </td>
                <td>
                    <button class="layui-btn layui-btn-primary layui-btn-xs detail" id="info" index="${status.index}">
                        查看
                    </button>
                    <button class="layui-btn layui-btn-xs borrow" id="update" index="${book.id}">
                        修改
                    </button>
                    <button class="layui-btn layui-btn-xs borrow" id="delete" index="${book.id}">
                        删除
                    </button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<div id="page" style="display: flex;justify-content: center;"></div>

<%--添加图书页面--%>
<form class="layui-form" method="post" action="/book/add"  id="addBooksPanel"  style="display: none;">
    <div class="layui-form-item">
        <label class="layui-form-label">书名</label>
        <div class="layui-input-block">
            <input type="text" name="name" required  lay-verify="required" placeholder="请输入书名" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">作者</label>
        <div class="layui-input-block">
            <input type="text" name="author" required  lay-verify="required" placeholder="请输入作者" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">分类</label>
        <div class="layui-input-block">
            <select name="sort" lay-verify="required">
                <option value="1">未分类</option>
                <option value="2">护理</option>
                <option value="3">编程</option>
                <option value="4">艺术</option>
                <option value="5">管理</option>
                <option value="6">法律</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">描述</label>
        <div class="layui-input-block">
            <textarea name="description" placeholder="请输入内容" class="layui-textarea"></textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="*">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>

<script src="../layui/layui.js" charset="utf-8"></script>
<%
    String message = request.getParameter("message");

    if (message != null && !message.equals("")) {
%>
<script src="/layui/layui.all.js"></script>
<script>
    layer.msg("<%=message%>");
</script>
<%
    }
%>
<script>
    layui.use(['laypage', 'layer', 'element'], function () {
            var laypage = layui.laypage, layer = layui.layer, element = layui.element;
            var $ = layui.$;
            var count = 0, current = 1, limit = 5;

            //查看按钮的点击事件
            $(document).on('click', '#info', function () {
                //可以获取第一列的内容，也就是name的值
                var name = $(this).parents("tr").find("td").eq(0).text();
                layer.msg(name)
            });

            //添加图书按钮的点击事件
            $(document).on('click', '#addBooksBtn', function () {
                const addBooksPanel = document.getElementById("addBooksPanel");
                addBooksPanel.style.visibility= "visible"
                layer.open({
                    title: '添加图书',
                    content: $('#addBooksPanel'),
                    area:'600px'
                });
            });

            //新增图书



            $('#search').click(function () {
                var keyword = $('#keyword').val();
                alert(keyword)
            });

            $(document).ready(function () {
                //进入页面先加载数据
                getContent(1, limit);
                //得到数量count后，渲染表格
                laypage.render({
                    elem: 'page',
                    count: count,
                    curr: current,
                    limits: [5, 10, 15, 20],
                    limit: limit,
                    layout: ['count', 'prev', 'page', 'next', 'limit'],
                    jump: function (obj, first) {
                        if (!first) {
                            getContent(obj.curr, obj.limit);
                            //更新当前页码和当前每页显示条数
                            current = obj.curr;
                            limit = obj.limit;
                        }
                    }
                });
            });

            function getContent(page, size) {
                $.ajax({
                    type: 'POST',
                    url: "/book/search",
                    async: false, //开启同步请求，为了保证先得到count再渲染表格
                    data: JSON.stringify({
                        pageNum: page,
                        pageSize: size
                    }),
                    contentType: "application/json;charset=utf-8",
                    success: function (data) {
                        $('#content').load(location.href + " #content");
                        //count从Servlet中得到
                        count = data;
                    }
                });
            }
        }
    );
    //添加图书表单提交
    layui.use('form', function(){
        var form = layui.form;
        form.render();
        //监听提交
        form.on('submit(formDemo)', function(data){
            layer.msg(JSON.stringify(data.field));
            // $.ajax({
            //     type: 'post',
            //     url: "/book/add",
            //     data: JSON.stringify({
            //         name:"",
            //         author:"",
            //         sort:"",
            //         description:"",
            //     }),
            //     contentType: "application/json;charset=utf-8",
            //     success: function (res) {
            //         if (res.code==0) {
            //             layer.close(layer.index);
            //             window.parent.location.reload();
            //         } else {
            //             layer.alert(res.msg, {icon: 5}, function () {
            //             });
            //         }
            //     }
            // });
            console.log(data)
            return false;
        });
    });
</script>

</body>
</html>
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
<<<<<<< HEAD
    <button 	class="layui-btn layui-btn-normal" id="addBooksBtn">添加图书</button>
=======
    <button class="layui-btn layui-btn-normal" id="addBooksBtn">添加图书</button>
>>>>>>> 40de1819055201ab802e4dc95b8565e398528416
    <table class="layui-table" style="table-layout:fixed">
        <colgroup>
            <col width="150">
            <col width="150">
            <col width="200">
<<<<<<< HEAD
            <col>
            <col width="180">
        </colgroup>
        <thead>
        <tr>
=======
            <col width="180">
            <col >
        </colgroup>
        <thead>
        <tr>
            <th>序号</th>
>>>>>>> 40de1819055201ab802e4dc95b8565e398528416
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
<<<<<<< HEAD
=======
                <td>${book.id}</td>
>>>>>>> 40de1819055201ab802e4dc95b8565e398528416
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
<<<<<<< HEAD
<form class="layui-form" method="post" action="/book/add"  id="addBooksPanel"  style="display: none;">
    <div class="layui-form-item">
        <label class="layui-form-label">书名</label>
        <div class="layui-input-block">
            <input type="text" name="name" required  lay-verify="required" placeholder="请输入书名" autocomplete="off" class="layui-input">
=======
<form class="layui-form" name="addBooksPanel" id="addBooksPanel" style="display: none;">
    <div class="layui-form-item">
        <label class="layui-form-label">书名</label>
        <div class="layui-input-block">
            <input type="text" name="bookName" required lay-verify="required" placeholder="请输入书名" autocomplete="off"
                   class="layui-input">
>>>>>>> 40de1819055201ab802e4dc95b8565e398528416
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">作者</label>
        <div class="layui-input-block">
<<<<<<< HEAD
            <input type="text" name="author" required  lay-verify="required" placeholder="请输入作者" autocomplete="off" class="layui-input">
=======
            <input type="text" name="bookAuthor" required lay-verify="required" placeholder="请输入作者" autocomplete="off"
                   class="layui-input">
>>>>>>> 40de1819055201ab802e4dc95b8565e398528416
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">分类</label>
        <div class="layui-input-block">
<<<<<<< HEAD
            <select name="sort" lay-verify="required">
=======
            <select name="bookSort" lay-verify="required">
>>>>>>> 40de1819055201ab802e4dc95b8565e398528416
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
<<<<<<< HEAD
            <textarea name="description" placeholder="请输入内容" class="layui-textarea"></textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="*">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
=======
            <textarea name="bookDescription" placeholder="请输入内容" class="layui-textarea"></textarea>
>>>>>>> 40de1819055201ab802e4dc95b8565e398528416
        </div>
    </div>
</form>

<script src="../layui/layui.js" charset="utf-8"></script>
<<<<<<< HEAD
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
=======

<script>
    layui.use(['laypage', 'layer', 'element', 'form'], function () {
            var laypage = layui.laypage, layer = layui.layer, element = layui.element;
            var $ = layui.$;
            var count = 0, current = 1, limit = 5;
            var form = layui.form;
            form.render();
>>>>>>> 40de1819055201ab802e4dc95b8565e398528416

            //查看按钮的点击事件
            $(document).on('click', '#info', function () {
                //可以获取第一列的内容，也就是name的值
<<<<<<< HEAD
                var name = $(this).parents("tr").find("td").eq(0).text();
                layer.msg(name)
=======
                var bookName = $(this).parents("tr").find("td").eq(1).text();
                layer.msg(bookName )
>>>>>>> 40de1819055201ab802e4dc95b8565e398528416
            });

            //添加图书按钮的点击事件
            $(document).on('click', '#addBooksBtn', function () {
<<<<<<< HEAD
                const addBooksPanel = document.getElementById("addBooksPanel");
                addBooksPanel.style.visibility= "visible"
                layer.open({
                    title: '添加图书',
                    content: $('#addBooksPanel'),
                    area:'600px'
                });
            });

            //新增图书

=======
                layer.open({
                    title: '添加图书',
                    content: $('#addBooksPanel'),
                    area: '600px',
                    btn: ['确认添加', '取消'],
                    yes: function (index, layero) {
                        const bookName = document.getElementsByName('bookName')[0].value;
                        const bookAuthor = document.getElementsByName('bookAuthor')[0].value;
                        const bookSort = document.getElementsByName('bookSort')[0].value;
                        const bookDescription = document.getElementsByName('bookDescription')[0].value;
                        $.ajax({
                            type: 'post',
                            url: "/book/add",
                            data: JSON.stringify({
                                name: bookName,
                                author: bookAuthor,
                                sort: bookSort,
                                description: bookDescription
                            }),
                            contentType: "application/json;charset=utf-8",
                            success: function (res) {
                                layer.alert("添加成功", {icon: 1})
                                queryBooks()
                                location.reload() //刷新页面
                            },
                            error: function (e) {
                                layer.msg("添加失败！" ,{icon: 2})
                                console.log(e)
                            }
                        });
                    }
                });
            });

            //删除图书事件
            $(document).on('click','#delete',function () {
                var bookId = $(this).attr("index");
                console.log(bookId);
                $.ajax({
                    type: 'POST',
                    url: "/book/delete",
                    data:JSON.stringify({
                        id:bookId
                    }),
                    contentType: "application/json;charset=utf-8",
                    success: function () {
                        layer.alert("删除成功", {icon: 1})
                        queryBooks()
                        location.reload()
                    },
                    error: function (e) {
                        layer.msg("删除失败！" + e)
                        console.log(e)
                    }
                });
            });

            // 更新图书
            $(document).on('click', '#update', function () {
                const bookId = $(this).attr("index");
                console.log(bookId)
                layer.open({
                    title: '修改图书',
                    content: $('#addBooksPanel'),
                    area: '600px',
                    btn: ['确认修改', '取消'],
                    yes: function (index, layero) {
                        const bookName = document.getElementsByName('bookName')[0].value;
                        const bookAuthor = document.getElementsByName('bookAuthor')[0].value;
                        const bookSort = document.getElementsByName('bookSort')[0].value;
                        const bookDescription = document.getElementsByName('bookDescription')[0].value;
                        $.ajax({
                            type: 'post',
                            url: "/book/update",
                            data: JSON.stringify({
                                id: bookId,
                                name: bookName,
                                author: bookAuthor,
                                sort: bookSort,
                                description: bookDescription
                            }),
                            contentType: "application/json;charset=utf-8",
                            success: function (res) {
                                layer.alert("修改成功", {icon: 1})
                                queryBooks()
                                location.reload() //刷新页面
                            },
                            error: function (e) {
                                layer.msg("修改失败！", {icon: 2})
                                console.log(e)
                            }
                        });
                    }
                });
            });
>>>>>>> 40de1819055201ab802e4dc95b8565e398528416


            $('#search').click(function () {
                var keyword = $('#keyword').val();
                alert(keyword)
            });

<<<<<<< HEAD
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
=======
            //查询图书
            function queryBooks() {
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
            }

            queryBooks()
>>>>>>> 40de1819055201ab802e4dc95b8565e398528416

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
<<<<<<< HEAD
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
=======
>>>>>>> 40de1819055201ab802e4dc95b8565e398528416
</script>

</body>
</html>
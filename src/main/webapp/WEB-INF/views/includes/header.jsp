<%--
  Created by IntelliJ IDEA.
  User: i
  Date: 25. 10. 1.
  Time: 오후 4:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1" name="viewport">
    <title>ToDo Service</title>
    <link crossorigin="anonymous" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
          integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" rel="stylesheet">
</head>
<body>
    <nav class="navbar bg-body-tertiary">
        <div class="container-fluid justify-content-start">
            <a class="navbar-brand" href="/todo/list"><img src="/resources/images/logo.png" width="40"></a>
            <div class="navbar">
                <div class="nav">
                    <a aria-current="page" class="nav-link active" href="/todo/list">목록보기</a>
                    <a class="nav-link" href="/todo/register">글 등록</a>
                </div>
            </div>
        </div>
    </nav>
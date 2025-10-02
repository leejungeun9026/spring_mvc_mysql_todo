<%--
  Created by IntelliJ IDEA.
  User: i
  Date: 25. 10. 1.
  Time: 오후 2:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../includes/header.jsp"%>
<div class="container-fluid py-3">
    <div class="row content">
        <div class="col">
            <div class="card">
                <div class="card-header">
                    <h2 class="mb-0">목록보기</h2>
                </div>
                <div class="card-body">
                    <table class="table">
                        <thead>
                        <tr>
                            <th scope="col">번호</th>
                            <th scope="col">제목</th>
                            <th scope="col">작성자</th>
                            <th scope="col">DueDate</th>
                            <th scope="col">Finished</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${todoList}" var="todo">
                            <tr>
                                <th scope="row">${todo.tno}</th>
                                <td><a href="/todo/view?tno=${todo.tno}">${todo.title}</a></td>
                                <td>${todo.writer}</td>
                                <td>${todo.duedate}</td>
                                <td>${todo.finished}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <button type="button" class="btn btn-primary" onclick="location.href='/todo/register'">등록하기</button>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="../includes/footer.jsp"%>

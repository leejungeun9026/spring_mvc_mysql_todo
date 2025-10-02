<%--
  Created by IntelliJ IDEA.
  User: i
  Date: 25. 10. 1.
  Time: 오후 2:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../includes/header.jsp" %>
<div class="container-fluid py-3">
  <div class="row content">
    <div class="col">
      <div class="card">
        <div class="card-header">
          <h2 class="mb-0">Todo 상세보기</h2>
        </div>
        <div class="card-body">
          <div class="mb-3">
            <label for="title" class="form-label">번호</label>
            <input name="title" type="text" class="form-control" id="title" value="${todo.tno}">
          </div>
          <div class="mb-3">
            <label for="title" class="form-label">제목</label>
            <input name="title" type="text" class="form-control" id="title" value="${todo.title}">
          </div>
          <div class="mb-3">
            <label for="content" class="form-label">내용</label>
            <textarea name="content" class="form-control" id="content" cols="30" rows="5"
                      id="content">${todo.content}</textarea>
          </div>
          <div class="mb-3">
            <label for="duedate" class="form-label">duedate</label>
            <input name="duedate" type="text" class="form-control" id="duedate" value="${todo.duedate}">
          </div>
          <div class="mb-3">
            <label for="writer" class="form-label">작성자</label>
            <input name="writer" type="text" class="form-control" id="writer" value="${todo.writer}">
          </div>
          <div class="mb-3">
            <label for="" class="form-label">Finishied</label>
            <div class="form-check">
              <input class="form-check-input" type="checkbox" value="" id="checkDefault" ${todo.finished? "checked":""} disabled>
              <label class="form-check-label" for="checkDefault">
                완료
              </label>
            </div>
          </div>
          <div class="text-end">
            <button type="button" class="btn btn-secondary" onclick="location.href='/todo/list'">목록으로</button>
            <button type="button" class="btn btn-success" onclick="location.href='/todo/list'">수정</button>
            <button type="reset" class="btn btn-danger">삭제하기</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<%@ include file="../includes/footer.jsp" %>
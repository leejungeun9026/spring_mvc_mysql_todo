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
          <h5 class="mb-0">Todo 수정하기</h5>
        </div>
        <div class="card-body">
          <form method="post" action="/todo/modify" class="mb-0">
            <div class="mb-3">
              <label for="tno" class="form-label">번호</label>
              <input name="tno" type="text" class="form-control bg-light" id="tno" value="${todo.tno}" readonly>
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
              <input name="duedate" type="date" class="form-control" id="duedate" value="${todo.duedate}">
            </div>
            <div class="mb-3">
              <label for="writer" class="form-label">작성자</label>
              <input name="writer" type="text" class="form-control bg-light" id="writer" value="${todo.writer}" readonly>
            </div>
            <div class="mb-3">
              <div class="form-check">
                <input class="form-check-input" type="checkbox" name="finished"
                       id="finishedchk" ${todo.finished ? "checked" : ""}>
                <label class="form-check-label" for="finishedchk">
                  완료
                </label>
              </div>
            </div>
            <div class="d-flex justify-content-start gap-2">
              <button type="button" class="btn btn-secondary">목록으로</button>
              <button type="submit" class="ms-auto btn btn-primary">저장하기</button>
            </div>
          </form>
          <script>
              document.querySelector(".btn-secondary").addEventListener("click", function(e){
                  self.location=`/todo/list?${pageRequestDTO.link}`
              }, false)
          </script>
        </div>
      </div>
    </div>
  </div>
</div>
<%@ include file="../includes/footer.jsp" %>
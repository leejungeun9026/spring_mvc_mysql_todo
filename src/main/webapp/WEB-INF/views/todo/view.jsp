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
          <h5 class="mb-0">Todo 상세보기</h5>
        </div>
        <div class="card-body">
          <div class="mb-3">
            <label for="tno" class="form-label">번호</label>
            <input name="tno" type="text" class="form-control" id="tno" value="${todo.tno}" readonly>
          </div>
          <div class="mb-3">
            <label for="title" class="form-label">제목</label>
            <input name="title" type="text" class="form-control" id="title" value="${todo.title}" readonly>
          </div>
          <div class="mb-3">
            <label for="content" class="form-label">내용</label>
            <textarea name="content" class="form-control" id="content" cols="30" rows="5"
                      id="content" readonly>${todo.content}</textarea>
            <img src="/resources/images/hellokitty.jpg" width="200">
          </div>
          <div class="mb-3">
            <label for="duedate" class="form-label">duedate</label>
            <input name="duedate" type="text" class="form-control" id="duedate" value="${todo.duedate}" readonly>
          </div>
          <div class="mb-3">
            <label for="writer" class="form-label">작성자</label>
            <input name="writer" type="text" class="form-control" id="writer" value="${todo.writer}" readonly>
          </div>
          <div class="mb-3">
            <div class="form-check">
              <input name="finished" class="form-check-input" type="checkbox" value="${todo.finished}" id="finished" ${todo.finished ? "checked" : ""} disabled>
              <label class="form-check-label" for="finished">
                완료
              </label>
            </div>
          </div>
          <div class="d-flex justify-content-start gap-2">
            <button type="button" class="btn btn-secondary">목록으로</button>
            <button type="button" class="ms-auto btn btn-success">수정</button>
            <button type="reset" class="btn btn-danger">삭제</button>
          </div>
          <script>
            document.querySelector(".btn-success").addEventListener("click", function(e) {
                self.location=`/todo/modify?tno=${todo.tno}&${pageRequestDTO.link}`
            }, false)
            document.querySelector(".btn-danger").addEventListener("click", function(e){
                self.location="/todo/remove?tno="+${todo.tno}
            }, false)
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
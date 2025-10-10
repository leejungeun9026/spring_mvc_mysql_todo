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
          <h5 class="mb-0">Todo 등록하기</h5>
        </div>
        <div class="card-body">
          <form action="/todo/register" method="post" class="mb-0">
            <div class="mb-3">
              <label for="title" class="form-label">제목</label>
              <input name="title" type="text" class="form-control" id="title" placeholder="제목을 입력해 주세요.">
            </div>
            <div class="mb-3">
              <label for="content" class="form-label">내용</label>
              <textarea name="content" class="form-control" id="content" cols="30" rows="5" id="content"
                        placeholder="내용을 입력해 주세요."></textarea>
            </div>
            <div class="mb-3">
              <label for="duedate" class="form-label">duedate</label>
              <input name="duedate" type="date" class="form-control" id="duedate">
            </div>
            <div class="mb-3">
              <label for="writer" class="form-label">작성자</label>
              <input name="writer" type="text" class="form-control" id="writer">
            </div>
            <div class="text-end">
              <button type="submit" class="btn btn-primary">저장하기</button>
              <button type="reset" class="btn btn-secondary">다시작성</button>
              <button type="button" class="btn btn-secondary" onclick="location.href='/todo/list'">목록으로</button>
            </div>
          </form>
          <script>
            const serverValidResult={}
            <c:forEach items="${errors}" var="error">
              serverValidResult['${error.getField()}']='${error.defaultMessage}'
            </c:forEach>
            console.log(serverValidResult);
          </script>
        </div>
      </div>
    </div>
  </div>
</div>
<%@ include file="../includes/footer.jsp" %>
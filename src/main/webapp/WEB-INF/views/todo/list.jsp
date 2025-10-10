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
          <h5 class="mb-0">목록보기</h5>
        </div>
        <div class="card-body">
          <table class="table">
            <thead>
              <tr>
                <th style="width: 10%;">번호</th>
                <th style="width: *%;">제목</th>
                <th style="width: 15%;">작성자</th>
                <th style="width: 20%;">DueDate</th>
                <th style="width: 15%;">Finished</th>
              </tr>
            </thead>
            <tbody>
            <c:forEach items="${responseDTO.dtoList}" var="todo">
              <tr>
                <th scope="row">${todo.tno}</th>
                <td><a href="/todo/view?tno=${todo.tno}&${pageRequestDTO.link}">${todo.title}</a></td>
                <td>${todo.writer}</td>
                <td>${todo.duedate}</td>
                <td>${todo.finished}</td>
              </tr>
            </c:forEach>
            </tbody>
          </table>
          <div class="d-flex justify-content-between align-items-center">
            <nav aria-label="Page navigation ">
              <ul class="pagination mb-0">
                <li class="page-item ${responseDTO.prev ? "" : "disabled"}">
                  <a class="page-link" href="#" aria-label="Previous" data-num="${responseDTO.start - 1}">&lt;
                  </a>
                </li>
                <c:forEach begin="${responseDTO.start}" end="${responseDTO.end}" var="num">
                  <li class="page-item ${responseDTO.page==num?"active":""}"><a class="page-link" href="#" data-num="${num}">${num}</a>
                  </li>
                </c:forEach>
                <li class="page-item ${responseDTO.next ? "" : "disabled"}">
                  <a class="page-link" href="#" aria-label="Next" data-num="${responseDTO.end + 1}">&gt;
                  </a>
                </li>
              </ul>
            </nav>
            <script>
              document.querySelector(".pagination").addEventListener("click", function(e){
                  e.preventDefault()
                  e.stopPropagation()
                  const target = e.target

                  if(target.tagName !== 'A'){
                      return
                  }
                  const num = target.getAttribute("data-num")
                  self.location=`/todo/list?page=\${num}`
              }, false)
            </script>

            <button type="button" class="btn btn-primary" onclick="location.href='/todo/register'">등록하기</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<%@ include file="../includes/footer.jsp" %>

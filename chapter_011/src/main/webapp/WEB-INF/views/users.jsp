<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="ru.job4j.crud.model.User" %>
<%@ page import="ru.job4j.crud.logic.ValidateService" %><%--
  Created by IntelliJ IDEA.
  User: abramov_av.sit
  Date: 08.10.2019
  Time: 10:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
    <div class="col-5 offset-3">
        <h2>Users</h2>
        <table class="table table-striped" id="datatable">
            <thead>
            <tr>
                <th>id</th>
                <th>name</th>
                <th>login</th>
                <th>email</th>
                <th>createDate</th>
                <th>edit</th>
                <th>delete</th>
            </tr>
            </thead>
            <c:forEach var="user" items="${users}">
            <tr>
                <td><c:out value="${user.id}"/>
                </td>
                <td><c:out value="${user.name}"/>
                </td>
                <td><c:out value="${user.login}"/>
                </td>
                <td><c:out value="${user.email}"/>
                </td>
                <td><c:out value="${user.createDate}"/>
                </td>
                <td><a href="<c:out value="${pageContext.servletContext.contextPath}" />/users/edit?id=<c:out value="${user.id}"/>" class="btn btn-link" role="button"
                       aria-pressed="true">edit</a></td>
                <td><a href="<c:out value="${pageContext.servletContext.contextPath}" />/users/delete?id=<c:out value="${user.id}"/>" class="btn btn-danger"
                       role="button"
                       aria-pressed="true">delete</a></td>
            </tr>
            </c:forEach>
        </table>
        <a href="<c:out value="${pageContext.servletContext.contextPath}" />/users/create" class="btn btn-success" role="button" aria-pressed="true">Add
            user</a>
    </div>
</div>
</body>
</html>
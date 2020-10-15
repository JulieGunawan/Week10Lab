<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Notes</title>
    </head>
    <body>

        <h1>Notes for ${email}</h1>
        <p>
            <a href="login">Log out</a>
        </p>
        
        <p>
            <c:if test="${message eq 'create'}">Note created</c:if>
            <c:if test="${message eq 'update'}">Note updated</c:if>
            <c:if test="${message eq 'delete'}">Note deleted</c:if>
            <c:if test="${message eq 'error'}">Sorry, something went wrong.</c:if>
            </p>
            <ul>
            <c:forEach items="${notes}" var="note">
                <li><a href="notes?action=view&amp;noteId=${note.noteId}">${note.title} (${note.owner.firstName})</a><br></li>
            </c:forEach>
        </ul>
        <c:if test="${selectedNote eq null}">
            <h2>Create a New Note</h2>
            <form action="notes" method="post">
                Title: <input type="text" name="title" value=""><br>
                Contents:<br>
                <textarea name="contents" rows="10" cols="40"></textarea><br>
                <input type="hidden" name="action" value="create">
                <input type="submit" value="Create">
            </form>
        </c:if>
        <c:if test="${selectedNote ne null}">
            <h2>Edit Note</h2>
            <form action="notes" method="post">
                Title: <input type="text" name="title" value="${selectedNote.title}"><br>
                Contents:<br>
                <textarea name="contents" rows="10" cols="40">${selectedNote.contents}</textarea><br>
                <input type="hidden" name="noteId" value="${selectedNote.noteId}">
                <input type="hidden" name="action" value="update">
                <input type="submit" value="Save">
            </form>

            <form action="notes" method="post">
                <input type="hidden" name="action" value="delete">
                <input type="hidden" name="noteId" value="${selectedNote.noteId}">
                <input type="submit" value="Delete">
            </form>
            <a href="notes">cancel edit</a>
        </c:if>
    </body>
</html>

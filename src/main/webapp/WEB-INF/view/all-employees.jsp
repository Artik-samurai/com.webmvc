<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<body>
<h2>
    All Employees
</h2>
<br>

<%--Создание таблицы--%>
<table>
    <%--    Создание строки таблицы--%>
    <tr>
        <%--        Создание шапки таблицы--%>
        <th>Name</th>
        <th>Surname</th>
        <th>Department</th>
        <th>Salary</th>
        <th>Operations</th>
    </tr>

    <%--    Прописываем значение столбцов через fot ech loop должна добавиться автоматически ссылка--%>
    <c:forEach var="emp" items="${allEmps}">

        <%--        Добавляем ссылку на id для каждого работника в саму кнопку--%>
        <%--        updateInfo - метод в контроллере--%>
        <%--        Так добавляются линки куда потом ссылаются кнопки--%>
        <c:url var="updateButton" value="/updateInfo">
            <%--            Добавляем информацию об id работника в кнопку uodate--%>
            <c:param name="empId" value="${emp.id}"/>
        </c:url>

        <%--        Добавляем информацию об id работника в кнопку delete--%>
        <c:url var="deleteButton" value="/deleteEmployee">
            <c:param name="empId" value="${emp.id}"/>
        </c:url>

        <tr>
                <%--            Создание ячейки в таблице--%>
            <td>${emp.name}</td>
            <td>${emp.surname}</td>
            <td>${emp.department}</td>
            <td>${emp.salary}</td>
            <td> <input type="button" value="Update" onclick="window.location.href = '${updateButton}'"/>
                <input type="button" value="Delete" onclick="window.location.href = '${deleteButton}'"/></td>
        </tr>
    </c:forEach>

</table>
<br>
<input type="button" value="Add"
       onclick="window.location.href = 'addNewEmployee'"/>
</body>
</html>
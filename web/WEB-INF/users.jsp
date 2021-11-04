<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Users</title>
    </head>
    <body>
        <h1>Users</h1>
        <form method="post" action="">
            <h2>Add User</h2>
            <input id="add_email" type="email" name="add_email" placeholder="Email" value="${add_email}"><br>
            Active: 
                <input id="add_active_yes" type="radio" name="add_active[]" value="true"><label for="add_active_yes">Yes</label>
                <input id="add_active_no" type="radio" name="add_active[]" value="false"><label for="add_active_no">No</label><br>
            <input id="add_first_name" type="text" name="add_first_name" placeholder="First Name" value="${add_first_name}"><br>
            <input id="add_last_name" type="text" name="add_last_name" placeholder="Last Name" value="${add_last_name}"><br>
            <input id="add_password" type="password" name="add_password" placeholder="Password" value="${add_password}"><br>
            <select name="add_role">
                <option value="">--choose--</option>
                <c:forEach var="role" items="${roles}">
                    <option ${add_role=="${role.role_name}"?"selected":""} value="${role.role_name}">${role.role_name}</option>
                </c:forEach>
            </select><br>
            <input type="submit" value="Save">
            <input type="hidden" name="action" value="add">
        </form>

        <form method="post" action="">
            <h2>Edit User</h2>
            <input id="edit_email" type="email" name="edit_email" value="${edit_email}" readonly><br>
            Active: 
                <input id="edit_active_yes" type="radio" name="edit_active[]" value="true"><label for="edit_active_yes">Yes</label>
                <input id="edit_active_no" type="radio" name="edit_active[]" value="false"><label for="edit_active_no">No</label><br>
            <input id="edit_first_name" type="text" name="edit_first_name" placeholder="First Name" value="${edit_first_name}"><br>
            <input id="edit_last_name" type="text" name="edit_last_name" placeholder="Last Name" value="${edit_last_name}"><br>
            <input id="edit_password" type="password" name="edit_password" placeholder="Password" value="${edit_password}"><br>
            <select name="edit_role">
                <option value="">--choose--</option>
                <c:forEach var="role" items="${roles}">
                    <option ${edit_role=="${role.role_name}"?"selected":""} value="${role.role_name}">${role.role_name}</option>
                </c:forEach>
            </select><br>
            <input type="submit" value="Update">
            <input type="hidden" name="action" value="edit">
        </form>

        <div>
            <h2>Manage Users</h2>
            <table>
                <tr>
                    <th>Email</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
                <c:forEach var="user" items="${users}">
                    <tr>
                        <td>${user.email}</td>
                        <td>${user.first_name}</td>
                        <td>${user.last_name}</td>
                        <td><a href="user?action=edit&amp;email=${user.email}">Edit</a></td>
                        <td><a href="user?action=delete&amp;email=${user.email}">Delete</a></td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </body>
</html>

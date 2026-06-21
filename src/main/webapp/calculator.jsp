<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Calculator</title>
</head>
<body>

        <form action="calculate" method="post">

    <input type="text" name="arg1" placeholder="First Number"/>
    <input type="text" name="arg2" placeholder="Second Number"/>
    <input type="text" name="arg3" placeholder="Third Number (optional)"/>

    <select name="operation">
        <option value="add">Add</option>
        <option value="mul">Multiply</option>
        <option value="sub">Subtract</option>
        <option value="div">Divide</option>
        <option value="add3">Add (3 numbers)</option>
        <option value="mul3">Multiply (3 numbers)</option>
    </select>

    <input type="submit" value="Calculate"/>

    <!-- 👇 THIS LINE (must be just before </form>) -->
    <span id="result">${result}</span>

</form>


        <ul>
<%
List<String> history = (List<String>)request.getAttribute("history");
if (history != null) {
for (String item : history) {
%>
        <li><%= item %></li>
<%
}
}
 %>
        </ul>
</body>
</html>
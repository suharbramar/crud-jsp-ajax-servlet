<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Corework</title>
</head>
<body>
  <%-- <jsp:forward page="/jsp/home.jsp"/> --%>
<%
RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/home.jsp");
dispatcher.forward(request, response); 
%>  
</body>
</html>   
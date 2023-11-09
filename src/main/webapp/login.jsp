<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
</head>
<body>
	<form method="post" action="">
		<input type="text" name="username"> <input type="password"
			name="password"> <input type="submit" value="submit">
	</form>
	<c:choose>
		<c:when test="${not empty param.username}">
			<sql:setDataSource driver="net.sourceforge.jtds.jdbc.Driver"
				url="jdbc:jtds:sqlserver://localhost/DVAS" user="sa"
				password="p@ssw0rd" var="ds" />
			<sql:query var="SQLresult" dataSource="${ds}">
		SELECT * FROM login WHERE username=? AND password=?
		<sql:param value="${param.username}" />
				<sql:param value="${param.password}" />
			</sql:query>
			<c:choose>
				<c:when test="${SQLresult.rowCount != 0}">
					<c:set var="namaPengguna" value="${param.username}" scope="session"></c:set>
					<c:redirect url="welcome.jsp" /> 
				</c:when>
				<c:when test="${SQLresult.rowCount == 0}">
		No Result
		</c:when>
			</c:choose>
			<c:if test="${not empty Pengguna }">
				<c:redirect url="welcome.jsp">

				</c:redirect>
			</c:if>
		</c:when>
	</c:choose>
</body>
</html>
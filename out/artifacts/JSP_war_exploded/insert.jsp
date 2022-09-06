<%--
  Created by IntelliJ IDEA.
  User: 이송희
  Date: 2022-09-06
  Time: 오후 5:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>

<%
    request.setCharacterEncoding("utf-8");

    String memberID = request.getParameter("memberID");
    String password = request.getParameter("password");
    String name = request.getParameter("name");
    String email = request.getParameter("email");

    Class.forName("oracle.jdbc.driver.OracleDriver");

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        String jdbcDriver = "jdbc:oracle:thin:@192.168.25.6:1521:orcl";
        String dbUser = "system";
        String dbPass = "1234";

        conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
        pstmt = conn.prepareStatement("insert into MEMBER values (?,?,?,?)");
        pstmt.setString(1, memberID);
        pstmt.setString(2, password);
        pstmt.setString(3, name);
        pstmt.setString(4, email);

        pstmt.executeUpdate();
    }finally {
        if(pstmt != null) try { pstmt.close(); } catch (SQLException ex) {}
        if(conn != null) try { conn.close(); } catch (SQLException ex) {}
    }
%>
<html>
<head>
    <title>삽입</title>
</head>
<body>
MEMBER 테이블에 새로운 레코드를 삽입했습니다.
</body>
</html>

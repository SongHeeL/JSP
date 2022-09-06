<%--
  Created by IntelliJ IDEA.
  User: 이송희
  Date: 2022-09-06
  Time: 오전 1:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>

<html>
<head>
    <title>회원목록</title>
</head>
<body>

MEMBER 테이블의 내용
<table width="100%" border="1">
    <tr>
        <td>이름</td><td>아이디</td><td>이메일</td>
    </tr>
    <%
        Class.forName("oracle.jdbc.driver.OracleDriver");

        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            String jdbcDriver = "jdbc:oracle:thin:@192.168.25.6:1521:orcl";
            String dbUser = "system";
            String dbPass = "1234";

            String query = "select * from MEMBER";

            conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
            stmt = conn.createStatement();
            rs = stmt.executeQuery(query);

            while (rs.next()){
    %>
    <tr>
        <td><%= rs.getString("NAME")%></td>
        <td><%= rs.getString("MEMBERID")%></td>
        <td><%= rs.getString("EMAIL")%></td>
    </tr>
    <%
            }
        }catch (SQLException ex){
            System.out.println(ex.getMessage());
            ex.printStackTrace();
        }finally {
            if(rs != null) try{ rs.close(); } catch (SQLException ex){}
            if(stmt != null) try{ stmt.close(); } catch (SQLException ex){}

            if(conn != null) try{ conn.close(); } catch (SQLException ex){}
        }
    %>
</table>
</body>
</html>

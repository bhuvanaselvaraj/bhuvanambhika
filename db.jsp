<%@page import="java.sql.*"%><%!
     Connection conn=null;
%><%     
     Class.forName("oracle.jdbc.driver.OracleDriver");
     conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "tiger");
%>
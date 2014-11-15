<%--
  Created by IntelliJ IDEA.
  User: ling
  Date: 2014/11/12
  Time: 14:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.util.Date" %>

<%
    //系统的名称，用于每个系统中的页面
    String title = "网上论坛";
    //得到当前系统的日期时间，字符串格式
    java.util.Date currentTime = new Date();
    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-mm-dd HH:mm:ss");
    String dateStr = formatter.format(currentTime);
    //得到当前系统的日期时间，Timestamp格式
    long completedTime = System.currentTimeMillis();
    java.sql.Date sqldate = new java.sql.Date(completedTime);
    java.sql.Timestamp Tsp = new java.sql.Timestamp(completedTime);

%>
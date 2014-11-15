<%@ page import="java.beans.Statement" %>
<%@ page import="java.sql.*" %>
<%--
  Created by IntelliJ IDEA.
  User: ling
  Date: 2014/11/12
  Time: 14:18
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html;charset=UTF-8" language="java"%>

<%

    //@ page contentType="text/html;charset=UTF-8" language="java"

    //装载JDBC驱动程序
    //Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
    try {
        //Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        System.out.println("驱动程序加载");
        System.out.println("即将连接到数据库");
    } catch (ClassNotFoundException e) {
        System.out.println("数据库驱动错误");
        e.printStackTrace();
    }

    //设定连接字符串
    String url = "jdbc:sqlserver://EE-LAB; DatabaseName=Fantastic FourMen";
    //获得数据库连接

    Connection con = DriverManager.getConnection(url, "user", "123456");

    //得到Statement对象，用于发送Sql语句


     java.sql.Statement smt1 = (java.sql.Statement)con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
     java.sql.Statement smt2 = (java.sql.Statement)con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
     java.sql.Statement smt3 = (java.sql.Statement)con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
     java.sql.Statement smt4 = (java.sql.Statement)con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);


    //用来保存Sql执行结果
    ResultSet rs1,rs2,rs3,rs4;
    //声明SQL语句字符串变量
    String sql_1,sql_2,sql_3,sql_4;

%>


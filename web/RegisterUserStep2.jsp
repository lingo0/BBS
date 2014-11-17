<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Date" %>
<%--
  Created by IntelliJ IDEA.
  User: ling
  Date: 2014/11/17
  Time: 19:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="public module/ConnectDB.jsp"%>
<%
    //定义变量，用来保存用户名、密码和性别
    String UserName, UserPassword, Sex;

    //获得表单提交过来的用户注册必填项，并存入相应变量中
    UserName = new String(request.getParameter("username").getBytes("ISO8859_1"), "UTF-8");
    UserPassword = new String(request.getParameter("userpassword").getBytes("ISO8859_1"), "UTF-8");
    Sex = new String(request.getParameter("sex").getBytes("ISO8859_1"), "UTF-8");

    String Email, MobilePhone, Birthday, NoteSign;
    Email = request.getParameter("email");
    if (Email == null)
        Email = " ";
    else
        Email = new String(Email.getBytes("ISO8859_1"),"UTF-8");

    MobilePhone = request.getParameter("mobilephone");
    if (MobilePhone == null)
        MobilePhone = " ";
    else
        MobilePhone = new String(MobilePhone.getBytes("ISO8859_1"),"UTF-8");

    Birthday = request.getParameter("birthday");
    if (Birthday == null)
        Birthday = " ";
    else
        Birthday = new String(Email.getBytes("ISO8859_1"),"UTF-8");

    NoteSign = request.getParameter("notesign");
    if (NoteSign == null)
        NoteSign = " ";
    else
        NoteSign = new String(Email.getBytes("ISO8859_1"),"UTF-8");

    sql_1 = "select UserID from Users where UserName='"+UserName+"'";
    rs1 = smt1.executeQuery(sql_1);
    rs1.last();
    if (rs1.getRow()>0)
    {
        response.sendRedirect("public module/error.jsp?id=4");
        return;
    }

    sql_2 = "insert into Users(UserName,UserPassword,Sex,Email,MobliePhone,Address,QQ,Birthday,Picture,NoteSign,TotalNews,LoginNum,RightID,RegisterDate,Status) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
    PreparedStatement prepstmt = null;
    prepstmt =con.prepareStatement(sql_2);
    prepstmt.setBytes(1, UserName.getBytes("GB2312"));
    prepstmt.setBytes(2, UserPassword.getBytes("GB2312"));
    prepstmt.setBytes(3, Sex.getBytes("GB2312"));
    prepstmt.setBytes(4, Email.getBytes("GB2312"));
    prepstmt.setBytes(5, MobilePhone.getBytes("GB2312"));
    prepstmt.setString(6, " ");
    prepstmt.setString(7, " ");
    prepstmt.setBytes(8, Birthday.getBytes("GB2312"));
    prepstmt.setString(9, " ");
    prepstmt.setBytes(10, NoteSign.getBytes("GB2312"));
    prepstmt.setInt(11,0);
    prepstmt.setInt(12,0);
    prepstmt.setInt(13,2);
    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
    prepstmt.setString(14,df.format(new Date()));
    prepstmt.setString(15,"ON");
    prepstmt.executeUpdate();

    sql_3 = "update Users set LoginNum = LoginNum+1 where UserName='"+UserName+"'";
    smt3.executeUpdate(sql_3);

    request.getSession(true);
    session.putValue("UserName",UserName);
    session.putValue("RightID","2");
    out.println("<span style=\"color: #3ccfff\">正在处理您的用户信息，请稍后</span><meta http-equiv='refresh' content='2;url=index.jsp'>");
%>


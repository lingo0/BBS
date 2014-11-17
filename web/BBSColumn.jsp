<%--
  Created by IntelliJ IDEA.
  User: ling
  Date: 2014/11/14
  Time: 10:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="public module/Common.jsp"%>
<%@ include file="public module/ConnectDB.jsp"%>

<%
    //页面中传递参数的方法
    String cid = request.getParameter("cid"); //获取在页面index.jsp传递的参数cid。
    //根据传递过来的cid，在数据表中查询，结果集保存在rs1中
    sql_1 = "select * from BBSColumn where ColumnID='"+cid+"'";
    rs1 = smt1.executeQuery(sql_1);
    rs1.next();
%>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    <title><%=title%></title>
    <link rel="stylesheet" href="css/style.css" type="text/css" media="screen">
</head>
<%@ include file="public module/Header.jsp"%>
<body>
    <!--//显示版块的标题和版主-->
    <table width="780" height="39" align="center" cellspacing="0" cellpadding="0">
        <tr>
            <td bgcolor="#ffffff" width="501"><br>
                <a href="index.jsp">首页</a>&gt;&gt;<%=rs1.getString("ColumnName")%>
            </td>
            <td bgcolor="#ffffff" width="230"><br>论 坛 版 主 ：<%=rs1.getString("ManagerName")%></td>
            <td bgcolor="#ffffff" class="post" align="right" width="230">
                <div align="center">
                    <a href="AddNewsStep1.jsp?cid=<%=cid%>">发新贴</a>
                </div>
            </td>
        </tr>
    </table>


    <!--显示版块下的所有主题帖子-->
    <table width="780" align="center" border="1" cellpadding="1" cellspacing="0" bgcolor="#ffffff" style="border:1px #8cc9ff solid;">
        <tr bgcolor="#9ccfff">
            <td width="35" height="19" align="center">图标</td>
            <td width="287" align="center">帖子标题</td>
            <td width="89" align="center">作者</td>
            <td width="52" align="center">回复数量</td>
            <td width="68" align="center">浏览数量</td>
            <td width="223" align="center">最后回复</td>
        </tr>

        <%
            //在News表中，当Topic为null时，该帖子是主题帖
            sql_2 = "select * from News where ColumnID='"+cid+"' and TopicID is null";
            rs2 = smt2.executeQuery(sql_2);
            while (rs2.next())
            {
                String AnswerData = rs2.getString("AnswerData");
        %>
                <tr>
                    <td height="29" valign="top">
                        <div align="center">♥</div>
                    </td>
                    <td align="center">
                        <a href="ViewNews.jsp?nid=<%=rs2.getString("NewsID")%>&cid=<%=cid%>">
                            <%=rs2.getString("NewsName")%>
                        </a>
                    </td>
                    <td align="center">
                        <a href="ViewUserInfo.jsp?username=<%=rs2.getString("UserName")%>">
                            <%=rs2.getString("UserName")%>
                        </a>
                    </td>
                    <td align="center">
                        <%=rs2.getString("AnswerNum")%>
                    </td>
                    <td align="center">
                        <%=rs2.getString("HitsNum")%>
                    </td>
                    <td align="center">
                        时间： <%=AnswerData.substring(0,19)%> 回复者： <a href="ViewUserInfo.jsp?username=<%=rs2.getString("AnswerUser")%>"><%=rs2.getString("AnswerUser")%></a>
                    </td>
                </tr>
        <%
            }
        %>
    </table>

    <%@ include file="public module/Footer.jsp"%>

</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: ling
  Date: 2014/11/12
  Time: 21:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="Common.jsp"%>
<%@ include file="ConnectDB.jsp"%>
<html>
<head>
    <title><%=title%>></title>
    <meta http-equiv="Content-Type" content="text/html" charset="utf-8">
    <link rel="stylesheet" type="text/css" href="../css/style.css">
</head>
<body>
    <form method="post" action="" name="form1">
    <table width="350" height="78" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td>&nbsp;</td>
        </tr>
    </table>

    <table width="350" border="0" align="center" cellpadding="2" cellspacing="0" bgcolor="#00ccff">
        <tr>
            <td width="342"><%=title%>错误提示</td>
            <td width="18">
                <table border="1" bordercolorlight="666666" bordercolordark = "ffffff" cellpadding="0" bgcolor="E0E0E0" cellspacing="0" width="18">
                <tr>
                    <td width="16">
                        <b>
                            <a href="javascript:history.go(-1)" onmouseover="window.status='';return true" onmouseout="window.status='';return true"title="关闭">
                                <font color="000000">
                                </font>
                            </a>
                        </b>
                    </td>
                </tr>
                </table>

                <table width="350" border="1" align="center" cellspacing="0" bordercolorlight="000000" bordercolordark="FFFFFF" bgcolor="#c0effe">
                    <tr>
                        <td>
                            <table border="0" width="338" cellpadding="4">
                                <tr>
                                    <td width="59" align="center" valign="top">&nbsp;</td>
                                    <td width="257">
                                        <%
                                            String strErrID=request.getParameter("id");

                                            if (strErrID != null)
                                            {
                                                int ErrID =Integer.parseInt(strErrID);
                                                if(ErrID == 1)
                                                    System.out.println("<P>你输入的用户名和密码不正确，请重输！</p>");
                                                else if(ErrID==2)
                                                    System.out.println("<p>你的用户名已被禁用，请速与管理员联系</p>");
                                                else if(ErrID==3)
                                                    System.out.println("<p>你的权限不够");
                                                else if(ErrID==4)
                                                    System.out.println("<p>该用户名已经存在，请重新输入</p>");
                                                else if(ErrID==5)
                                                    System.out.println("<p>你还没有登录，如果你还没有注册，请注册</p>");
                                                else if(ErrID==6)
                                                    System.out.println("<p>你的权限不够，只有系统管理员和本版主才能删除帖子</p>");
                                                else if(ErrID==7)
                                                    System.out.println("<p>你的权限不够，只有系统管理员和本版主和发帖人才能删除帖子</p>");
                                            }
                                            else
                                                System.out.println("<p>非法操作！请稍后操作</p>");
                                        %>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="center" valign="top">
                                        <input type="button" name="ok" value="确 定" onclick="javascript:history.go(-1)">
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>

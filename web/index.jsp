<%--
  Created by IntelliJ IDEA.
  User: ling
  Date: 2014/11/12
  Time: 13:33

  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="public module/Common.jsp"%>
<%@ include file="public module/ConnectDB.jsp"%>


<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    <title><%=title%></title>
    <link rel="stylesheet" href="css/style.css" type="text/css" media="screen">
  </head>
<%@ include file="public module/Header.jsp"%>
  <% //列出公告栏内容。%>
  <body>
      <table width="780" height="35" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
              <td width="12%">
                  <span style="color: #333399">
                      <b>
                          论坛公告：
                      </b>
                  </span>
              </td>
              <td width="88%">
                  <marquee width="648" height="22" direction="left">
                      <%
                          sql_1="select BulletinTitle,BulletinBody,AddDate from Bulletin ORDER BY BulletinID DESC";
                          //ORDER BY 语句用于根据指定的列对结果集进行排序。语句默认按照升序对记录进行排序。可以使用 DESC 关键字，按照降序对记录进行排序。
                          String Notic=" ";
                          int i=0;
                          rs1 = smt1.executeQuery(sql_1);
                          while ((rs1.next()) && (i<5))
                          {
                              String Time=rs1.getString("AddDate");
                              Time = Time.substring(0,19);
                              Notic="<B>"+rs1.getString("BulletinTItle")+"</B>&nbsp;&nbsp;" +
                                      "<span style=\"color: #000000\">" +rs1.getString("BulletinBody") + "</span>" +
                                      "<span style=\"color: #808080\">&nbsp;"+Time +"</span>&nbsp;&nbsp;&nbsp;"+ Notic;
                              i++;
                          }
                          out.println(Notic);
                      %>
                  </marquee>
              </td>
          </tr>
      </table>

      <table width="780" border="1" align="center" cellpadding="1" cellspacing="0" bgcolor="white">
          <tr bgcolor="#9cffff">
              <td width="39" height="19" align="center">图标</td>
              <td width="177" align="center">论坛版块</td>
              <td width="100" align="center">帖子总数</td>
              <td width="330" align="center">最后回复</td>
              <td width="112" align="center">版主</td>
          </tr>
          <%
              sql_2 = "select * from BBSColumn ORDER BY ColumnName";
              rs2 = smt2.executeQuery(sql_2);
              while (rs2.next())
              {
                  String LastPublishDate =rs2.getString("LastPublishDate");
                  String LastPublisher = rs2.getString("LastPublisher");
                  String ColumnID = rs2.getString("ColumnID");
                  String ManagerName = rs2.getString("ManagerName");

                  if (LastPublisher == null)
                      LastPublisher = "无";
                  else LastPublisher = "<a href='ViewUserInfo.jsp?username=" +LastPublisher+"'>"+LastPublisher+"</a>";

                  if ((ManagerName == null) || (ManagerName.equals(" ")))
                    ManagerName = "招聘中";
                  else
                      ManagerName = "<a href = ViewUserInfo.jsp?username="+ManagerName+">"+ManagerName+"</a>";

          %>
          <tr>
              <td height="29" valign="top">
                  <div align="center"></div>
              </td>
              <td align="center">
                  <a href="BBSColumn.jsp?cid=<%=ColumnID%>"><%=rs2.getString("ColumnName")%></a>
              </td>
              <td align="center">
                  <%=rs2.getString("TopicNum")%>
              </td>
              <td align="center">
                  时间：<%=LastPublishDate.substring(0,19)%>  作者：<%=LastPublisher%>
              </td>
              <td align="center">
                  <%=ManagerName%>
              </td>
          </tr>

          <%
              }
          %>
      </table>
  <%@ include file="public module/Footer.jsp"%>
  </body>
</html>

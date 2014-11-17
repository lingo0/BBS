<%--
  Created by IntelliJ IDEA.
  User: ling
  Date: 2014/11/17
  Time: 9:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="public module/Common.jsp"%>

<script language="JavaScript">
    function chlinput2(theForm)
    {
        if(theForm.username.value.length < 1 || theForm.username.value.length > 15)
        {
            alert("请输入正确的用户名！")
            theForm.username.focus();
            return false;
        }

        if(theForm.userpassword.value.length < 1 || heForm.userpassword.value.length > 15)
        {
            alert("请输入正确的密码！")
            theForm.username.focus();
            return false;
        }
    }
</script>

<link rel="stylesheet" href="css/calender-win2k-1.css" type="text/css" media="screen">
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calendar-en.js"></script>
<script type="text/javascript" src="js/calendar-setup.js"></script>

<!--//设置显示的日期格式-->
<script language="JavaScript" type="text/JavaScript">
    Calender.Setup(
    {
        inputField:"birthday", //文本框的ID
        ifFormat:"%y-%m-%d",    //日期格式
        button:"bthdy"      //按钮的ID
    }
    );

</script>


<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    <title><%=title%></title>
    <link rel="stylesheet" href="css/style.css" type="text/css" media="screen">
</head>
<body>
    <%@ include file="public module/Header.jsp"%>
    <table width="780" border="1" align="center" cellpadding="3" cellspacing="0" bgcolor="#9da796">
        <form method="post" name="form2" action="RegisterUserStep2.jsp" onsubmit="return chkinput2(this)">
        <tr bgcolor="#ffffff" height="30">
            <td colspan="2" height="30" bgcolor="#9ccfff">注册资料-必填的项目:</td>
        </tr>

        <tr bgcolor="#ffffff">
            <td width="239" class="tablerow" height="25">用户名称</td>
            <td class="tablerow" height="25" width="526">
                <input name="username" type="text" id="username" size="17" maxlength="15"><span style="color: #ff0000">***不能含有非法字符，长度不能大于15</span>
            </td>
        </tr>

        <tr bgcolor="#ffffff">
            <td class="tablerow" height="25" width="239" bgcolor="#c6efff">用户密码</td>
            <td class="tablerow" height="25" width="526" bgcolor="#c6efff">
                <input name="userpassword" type="text" size="17" maxlength="15"><span style="color: #ff0000">***长度不能大于15</span>
            </td>
        </tr>

        <tr bgcolor="#ffffff">
            <td class="tablerow" height="25" width="239" bgcolor="#ffffff">用户性别</td>
            <td class="tablerow" height="25" width="526" bgcolor="ffffff">
                <input type="radio" name="sex" checked value="男"> 男&nbsp;
                <input type="radio" name="sex" checked value="女"> 女&nbsp;
            </td>
        </tr>

        <!--
        <tr bgcolor="#ffffff">
            <td class="tablerow" hidden="25" bgcolor="#ffffff">用户性别</td>
            <td class="tablerow" height="25" bgcolor="#ffffff">
                <input type="radio" name="sex" checked value="男"> 男&nbsp;
                <input type="radio" name="sex" checked value="女"> 女&nbsp;
            </td>
        </tr>
        -->

        <tr bgcolor="#ffffff">
            <td colspan="2" height="30" bgcolor="#9ccfff">注册资料-可选项目</td>
        </tr>

        <tr bgcolor="#ffffff">
            <td class="tablerow" height="1">E-Mail</td>
            <td class="tablerow" height="1">
                <input type="text" name="email" size="30">
            </td>
        </tr>

        <tr bgcolor="#ffffff">
            <td class="tablerow" height="1" width="239" bgcolor="#c0effe">手机号码</td>
            <td class="tablerow" height="1" width="526" bgcolor="#c0effe">
                <input type="text" name="mobilephone" size="30">
            </td>
        </tr>

        <tr bgcolor="#ffffff">
            <td class="tablerow" height="1">出生日期</td>
            <td class="tablerow" height="1">
                <input type="text" name="birthday" class="data" id="birthday" value="1980-01-01" size="10" maxlength="8" readonly="true">
                <input name="bthdy" type="button" id="bthdy" value="...">
            </td>
        </tr>

        <tr bgcolor="#ffffff">
            <td class="tablerow" height="0" width="239">个人签名<br /></td>
            <td class="tablerow" height="0" width="526">
                <textarea rows="4" cols="45" name="notesign"></textarea>
            </td>
        </tr>

        <tr bgcolor="#ffffff">
            <td class="tablerow" height="54" colspan="2" bgcolor="#c6effe">
                <div align="center">
                    <input type="submit" name="submit" value="免费注册">
                </div>
            </td>
        </tr>
       </form>
    </table>

    <%@ include file="public module/Footer.jsp"%>

</body>
</html>

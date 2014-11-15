<%--
  Created by IntelliJ IDEA.
  User: ling
  Date: 2014/11/12
  Time: 19:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script language="javascript">
    //Showtime函数用来显示当前的日期时间，而且时间不停变化，以秒为单位，是一个时钟显示功能
    function ShowTime()
    {
        if(!document.all) return;

        var Digtial=new Date();
        var year = Digtial.getYear();
        var month = Digtial.getMonth();
        var day = Digtial.getDate();
        var hours = Digtial.getHours();
        var minutes = Digtial.getMinutes();
        var seconds = Digtial.getSeconds();
        var dn = "上午";
        if (hours>12) {
            dn = "下午";
            hours = hours - 12;
        }
        if(hours == 0) hours = 12;
        if(minutes<=9) minutes = "0" + minutes;
        if(seconds<=9) seconds = "0" + seconds;

        var ctime = year +"-" + month +"-"+day+" "+hours+":"+minutes+":"+seconds;
        tick1.innerHTML = "<b style='font-famliy: Arial; font - size:10pt; color:#990000;'>现在时间："+ctime+"</b>"
        setTimeout("ShowTime()",1000);
    }
    window.onload=ShowTime

    function chkinput1(theForm)
    {
        if(theForm.username.value.length<1 || theForm.username.value.length > 15)
        {
            alert("请输入用户名！")
            theForm.username.focus();
            return false;
        }

        if(theForm.password.value.length<1 || theForm.password.value.length > 15)
        {
            alert("请输入密码！")
            theForm.password.focus();
            return false;
        }
    }

    //OpenRegister函数用来进入用户注册界面，当前用户点击【注册】按钮时执行此函数
    function OpenRegister()
    {
        self.location="RegisterUserStep1.jsp"
    }
</script>

<body>
    <table bgcolor="#336699" border=0 cellpadding=0 cellspacing=1 width=780 align=CENTER>
        <tr>
            <td align=middle height=10> </td>
        </tr>
    </table>

    <table width="780" height="48" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td height="25" bgcolor="#336699">
                <div align="center">
                    <a class="title">
                        <%=title%>
                    </a>
                </div>
            </td>
        </tr>
    </table>

    <table width="780" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#D4D4D4">
        <tr>
            <form name="forml" method="post" action="Chkogin.jsp" onsubmit="return chkinput1(this)">
                <td width="484">
                    <%
                        if(session.getValue("UserName")==null)
                        {
                    %>
                            用户名：
                            <input name="username" type="text" size="15" maxlength="15">
                            密码：
                            <input name="password" type="password" size="15" maxlength="15">
                            <input type="submit" name="Submit" value="登陆">
                            <input type="button" name="reg" value="注册" onclick="OpenRegister()">
                    <%
                        }
                        else
                        {
                            System.out.print("<font color = '#000000'>【"+session.getValue("UserName")+"】</font>&nbsp;欢迎您！");
                            System.out.print("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
                                    "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='BulletinMain.jsp'><strong>【管理】</strong></a>");
                            System.out.print("&nbsp;&nbsp;<a href='Logout.jsp'><strong>【退出】</strong></a>");
                        }
                    %>

                </td>
                <td width="296">
                    <a id=tick1></a>
                </td>
            </form>
        </tr>
    </table>
</body>


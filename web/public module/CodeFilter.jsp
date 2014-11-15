<%--
  Created by IntelliJ IDEA.
  User: ling
  Date: 2014/11/12
  Time: 20:40
  To change this template use File | Settings | File Templates.
--%>

<%!
    String Replace(String str_source,String str_original,String str_new) {
        if (str_source == null) return null;
        StringBuffer output = new StringBuffer();
        int lengOfsource = str_source.length();
        int lengOfold = str_original.length();
        int posStart = 0;
        int pos;
        while ((pos = str_source.indexOf(str_original,posStart)) >=0) {
            output.append(str_source.substring(posStart,pos));
            output.append(str_new);
            posStart = pos + lengOfold;
        }
        if(posStart < lengOfsource) {
            output.append(str_source.substring(posStart));
        }
        return output.toString();
    }

    String toHrml(String s)
    {
        s=Replace(s,"<","&lt;");
        s=Replace(s,">","&gt;");
        s=Replace(s,"&","&amp;");
        s=Replace(s,"\t","    ");
        s=Replace(s,"\r\n","\n");
        s=Replace(s,"\n","<br>");
        s=Replace(s," ","&nbsp;");
        s=Replace(s,"'","&#39;");
        s=Replace(s,"\\","#92;");
        return s;
    }

    String unHtml(String s)
    {
        s=Replace(s,"&nbsp"," ");
        s=Replace(s,"<br>","\n");
        return s;
    }

%>
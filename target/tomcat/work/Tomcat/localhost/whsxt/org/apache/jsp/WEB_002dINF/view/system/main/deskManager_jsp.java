/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2018-09-14 01:02:26 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.view.system.main;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class deskManager_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("\t<meta charset=\"utf-8\">\r\n");
      out.write("\t<title>首页---仓库管理系统</title>\r\n");
      out.write("\t<meta name=\"renderer\" content=\"webkit\">\r\n");
      out.write("\t<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge,chrome=1\">\r\n");
      out.write("\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1, maximum-scale=1\">\r\n");
      out.write("\t<meta name=\"apple-mobile-web-app-status-bar-style\" content=\"black\">\r\n");
      out.write("\t<meta name=\"apple-mobile-web-app-capable\" content=\"yes\">\r\n");
      out.write("\t<meta name=\"format-detection\" content=\"telephone=no\">\r\n");
      out.write("\t<link rel=\"stylesheet\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/resources/layui/css/layui.css\" media=\"all\" />\r\n");
      out.write("\t<link rel=\"stylesheet\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/resources/css/public.css\" media=\"all\" />\r\n");
      out.write("</head>\r\n");
      out.write("<body class=\"childrenBody\">\r\n");
      out.write("\t<blockquote class=\"layui-elem-quote layui-bg-green\">\r\n");
      out.write("\t\t<div id=\"nowTime\"></div>\r\n");
      out.write("\t</blockquote>\r\n");
      out.write("\t<div class=\"layui-row layui-col-space10\">\r\n");
      out.write("\t\t<div class=\"layui-col-lg6 layui-col-md6\">\r\n");
      out.write("\t\t\t<blockquote class=\"layui-elem-quote title\">最新公告 <i class=\"layui-icon layui-red\">&#xe756;</i>\r\n");
      out.write("\t\t\t<span style=\"float: right;\">\r\n");
      out.write("\t\t\t\t\t<a href=\"#\">\r\n");
      out.write("\t\t\t\t\t\t更多>>\r\n");
      out.write("\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t</span>\r\n");
      out.write("\t\t\t</blockquote>\r\n");
      out.write("\t\t\t<table class=\"layui-table mag0\" lay-skin=\"line\">\r\n");
      out.write("\t\t\t\t<colgroup>\r\n");
      out.write("\t\t\t\t\t<col>\r\n");
      out.write("\t\t\t\t\t<col width=\"110\">\r\n");
      out.write("\t\t\t\t</colgroup>\r\n");
      out.write("\t\t\t\t<tbody class=\"hot_news\"></tbody>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div class=\"layui-col-lg6 layui-col-md6\">\r\n");
      out.write("\t\t\t<blockquote class=\"layui-elem-quote title\">库存预警 <i class=\"layui-icon layui-red\">&#xe756;</i>\r\n");
      out.write("\t\t\t<span style=\"float: right;\">\r\n");
      out.write("\t\t\t\t\t<a href=\"#\">\r\n");
      out.write("\t\t\t\t\t\t更多>>\r\n");
      out.write("\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t</span>\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t</blockquote>\r\n");
      out.write("\t\t\t<table class=\"layui-table mag0\" lay-skin=\"line\">\r\n");
      out.write("\t\t\t\t<colgroup>\r\n");
      out.write("\t\t\t\t\t<col>\r\n");
      out.write("\t\t\t\t\t<col width=\"110\">\r\n");
      out.write("\t\t\t\t</colgroup>\r\n");
      out.write("\t\t\t\t<tbody class=\"hot_yujing\">\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td>旺旺雪饼1</td>\r\n");
      out.write("\t\t\t\t\t<td align=\"center\">10[包]</td>\r\n");
      out.write("\t\t\t\t\t<td align=\"center\">\r\n");
      out.write("\t\t\t\t\t\t <button class=\"layui-btn layui-btn-danger layui-btn-sm\">进货</button>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td>旺旺雪饼2</td>\r\n");
      out.write("\t\t\t\t\t<td align=\"center\">10[包]</td>\r\n");
      out.write("\t\t\t\t\t<td align=\"center\">\r\n");
      out.write("\t\t\t\t\t\t <button class=\"layui-btn layui-btn-danger layui-btn-sm\">进货</button>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td>旺旺雪饼3</td>\r\n");
      out.write("\t\t\t\t\t<td align=\"center\">10[包]</td>\r\n");
      out.write("\t\t\t\t\t<td align=\"center\">\r\n");
      out.write("\t\t\t\t\t\t <button class=\"layui-btn layui-btn-danger layui-btn-sm\">进货</button>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t</tbody>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div class=\"layui-row layui-col-space10\">\r\n");
      out.write("\t\t<div class=\"layui-col-lg6 layui-col-md6\">\r\n");
      out.write("\t\t\t<blockquote class=\"layui-elem-quote title\">我的待办任务 <i class=\"layui-icon layui-red\">&#xe756;</i>\r\n");
      out.write("\t\t\t<span style=\"float: right;\">\r\n");
      out.write("\t\t\t\t\t<a href=\"#\">\r\n");
      out.write("\t\t\t\t\t\t更多>>\r\n");
      out.write("\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t</span>\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t</blockquote>\r\n");
      out.write("\t\t\t<table class=\"layui-table mag0\" lay-skin=\"line\">\r\n");
      out.write("\t\t\t\t<colgroup>\r\n");
      out.write("\t\t\t\t\t<col>\r\n");
      out.write("\t\t\t\t\t<col width=\"110\">\r\n");
      out.write("\t\t\t\t</colgroup>\r\n");
      out.write("\t\t\t\t<tbody class=\"hot_news\"></tbody>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div class=\"layui-col-lg6 layui-col-md6\">\r\n");
      out.write("\t\t\t<blockquote class=\"layui-elem-quote title\">我的申请任务 <i class=\"layui-icon layui-red\">&#xe756;</i>\r\n");
      out.write("\t\t\t<span style=\"float: right;\">\r\n");
      out.write("\t\t\t\t\t<a href=\"#\">\r\n");
      out.write("\t\t\t\t\t\t更多>>\r\n");
      out.write("\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t</span>\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t</blockquote>\r\n");
      out.write("\t\t\t<table class=\"layui-table mag0\" lay-skin=\"line\">\r\n");
      out.write("\t\t\t\t<colgroup>\r\n");
      out.write("\t\t\t\t\t<col>\r\n");
      out.write("\t\t\t\t\t<col width=\"110\">\r\n");
      out.write("\t\t\t\t</colgroup>\r\n");
      out.write("\t\t\t\t<tbody class=\"hot_news\"></tbody>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\r\n");
      out.write("\t<script type=\"text/javascript\" src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/resources/layui/layui.js\"></script>\r\n");
      out.write("\t<script type=\"text/javascript\">\r\n");
      out.write("\t//获取系统时间\r\n");
      out.write("\tvar newDate = '';\r\n");
      out.write("\tgetLangDate();\r\n");
      out.write("\t//值小于10时，在前面补0\r\n");
      out.write("\tfunction dateFilter(date){\r\n");
      out.write("\t    if(date < 10){return \"0\"+date;}\r\n");
      out.write("\t    return date;\r\n");
      out.write("\t}\r\n");
      out.write("\tfunction getLangDate(){\r\n");
      out.write("\t    var dateObj = new Date(); //表示当前系统时间的Date对象\r\n");
      out.write("\t    var year = dateObj.getFullYear(); //当前系统时间的完整年份值\r\n");
      out.write("\t    var month = dateObj.getMonth()+1; //当前系统时间的月份值\r\n");
      out.write("\t    var date = dateObj.getDate(); //当前系统时间的月份中的日\r\n");
      out.write("\t    var day = dateObj.getDay(); //当前系统时间中的星期值\r\n");
      out.write("\t    var weeks = [\"星期日\",\"星期一\",\"星期二\",\"星期三\",\"星期四\",\"星期五\",\"星期六\"];\r\n");
      out.write("\t    var week = weeks[day]; //根据星期值，从数组中获取对应的星期字符串\r\n");
      out.write("\t    var hour = dateObj.getHours(); //当前系统时间的小时值\r\n");
      out.write("\t    var minute = dateObj.getMinutes(); //当前系统时间的分钟值\r\n");
      out.write("\t    var second = dateObj.getSeconds(); //当前系统时间的秒钟值\r\n");
      out.write("\t    var timeValue = \"\" +((hour >= 12) ? (hour >= 18) ? \"晚上\" : \"下午\" : \"上午\" ); //当前时间属于上午、晚上还是下午\r\n");
      out.write("\t    newDate = dateFilter(year)+\"年\"+dateFilter(month)+\"月\"+dateFilter(date)+\"日 \"+\" \"+dateFilter(hour)+\":\"+dateFilter(minute)+\":\"+dateFilter(second);\r\n");
      out.write("\t    document.getElementById(\"nowTime\").innerHTML = \"亲爱的boss，\"+timeValue+\"好！ 欢迎使用仓库系统。当前时间为： \"+newDate+\"　\"+week;\r\n");
      out.write("\t    setTimeout(\"getLangDate()\",1000);\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\tlayui.use(['form','element','layer','jquery'],function(){\r\n");
      out.write("\t    var form = layui.form,\r\n");
      out.write("\t        layer = parent.layer === undefined ? layui.layer : top.layer,\r\n");
      out.write("\t        element = layui.element;\r\n");
      out.write("\t        $ = layui.jquery;\r\n");
      out.write("\t    //上次登录时间【此处应该从接口获取，实际使用中请自行更换】\r\n");
      out.write("\t    $(\".loginTime\").html(newDate.split(\"日\")[0]+\"日</br>\"+newDate.split(\"日\")[1]);\r\n");
      out.write("\t    //icon动画\r\n");
      out.write("\t    $(\".panel a\").hover(function(){\r\n");
      out.write("\t        $(this).find(\".layui-anim\").addClass(\"layui-anim-scaleSpring\");\r\n");
      out.write("\t    },function(){\r\n");
      out.write("\t        $(this).find(\".layui-anim\").removeClass(\"layui-anim-scaleSpring\");\r\n");
      out.write("\t    })\r\n");
      out.write("\t    $(\".panel a\").click(function(){\r\n");
      out.write("\t        parent.addTab($(this));\r\n");
      out.write("\t    })\r\n");
      out.write("\r\n");
      out.write("\t    //最新文章列表\r\n");
      out.write("\t    $.post(\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/notice/queryAllNotice.action\",{limit : 10,page:1},function(data){\r\n");
      out.write("\t        var hotNewsHtml = '';\r\n");
      out.write("\t        if(data.data.length<5){\r\n");
      out.write("\t        \t for(var i=0;i<data.data.length;i++){\r\n");
      out.write("\t \t            hotNewsHtml += '<tr>'\r\n");
      out.write("\t \t                +'<td align=\"left\"><a href=\"javascript:;\"> '+data.data[i].title+'</a></td>'\r\n");
      out.write("\t \t                +'<td>'+data.data[i].createtime.substring(0,10)+'</td>'\r\n");
      out.write("\t \t                +'</tr>';\r\n");
      out.write("\t \t        }\r\n");
      out.write("\t        }else {\r\n");
      out.write("\t        \t for(var i=0;i<5;i++){\r\n");
      out.write("\t\t \t            hotNewsHtml += '<tr>'\r\n");
      out.write("\t\t \t                +'<td align=\"left\"><a href=\"javascript:;\"> '+data.data[i].title+'</a></td>'\r\n");
      out.write("\t\t \t                +'<td>'+data.data[i].createtime.substring(0,10)+'</td>'\r\n");
      out.write("\t\t \t                +'</tr>';\r\n");
      out.write("\t\t \t        }\r\n");
      out.write("\t        }\r\n");
      out.write("\t        $(\".hot_news\").html(hotNewsHtml);\r\n");
      out.write("\t        $(\".userAll span\").text(data.length);\r\n");
      out.write("\t    })\r\n");
      out.write("\r\n");
      out.write("\t})\r\n");
      out.write("\r\n");
      out.write("\t</script>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}

/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2018-09-25 01:05:17 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.view.system.workFlow;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class taskManager_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\t<title>任务列表---仓库管理系统 2.0</title>\r\n");
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
      out.write("\t<table id=\"taskList\" lay-filter=\"taskList\"></table>\r\n");
      out.write("\t<!--操作-->\r\n");
      out.write("\t<script type=\"text/html\" id=\"taskListBar\">\r\n");
      out.write("\t\t<a class=\"layui-btn layui-btn-xs layui-btn-danger\" lay-event=\"toDoTask\">办理任务</a>\r\n");
      out.write("\t\t<a class=\"layui-btn layui-btn-xs\" lay-event=\"toViewProcessImage\">查看任务图</a>\r\n");
      out.write("\t</script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/resources/layui/layui.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("layui.use(['form','layer','laydate','table','laytpl'],function(){\r\n");
      out.write("    var form = layui.form,\r\n");
      out.write("        layer = parent.layer === undefined ? layui.layer : top.layer,\r\n");
      out.write("        $ = layui.jquery,\r\n");
      out.write("        laytpl = layui.laytpl,\r\n");
      out.write("        table = layui.table;\r\n");
      out.write("    //待办任务列表\r\n");
      out.write("   var  tableIns = table.render({\r\n");
      out.write("        elem: '#taskList',\r\n");
      out.write("        url : '");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/task/queryCurrentUserTask.action',\r\n");
      out.write("        cellMinWidth : 95,\r\n");
      out.write("        toolbar: true,\r\n");
      out.write("        defaultToolbar: ['filter'],\r\n");
      out.write("        page : true,\r\n");
      out.write("        height : \"full-125\",\r\n");
      out.write("        limit : 10,\r\n");
      out.write("        limits : [10,15,20,25],\r\n");
      out.write("        id : \"taskListTable\",\r\n");
      out.write("        cols : [[\r\n");
      out.write("            {field: 'id', title: '任务ID', width:80, align:\"center\"},\r\n");
      out.write("            {field: 'title', title: '任务标题', width:200, align:\"center\"},\r\n");
      out.write("            {field: 'content', title: '任务详情',width:200, align:\"center\"},\r\n");
      out.write("            {field: 'days', title: '请假天数', align:\"center\"},\r\n");
      out.write("            {field: 'leavetime', title: '请假时间', align:'center'},\r\n");
      out.write("            {field: 'username', title: '请假人', align:'center'},\r\n");
      out.write("            {title: '操作', width:170, templet:'#taskListBar',fixed:\"right\",align:\"center\"}\r\n");
      out.write("        ]]\r\n");
      out.write("    });\r\n");
      out.write("    //办理任务\r\n");
      out.write("    function toDoTask(data){\r\n");
      out.write("        var index = layui.layer.open({\r\n");
      out.write("            title : \"办理任务\",\r\n");
      out.write("            //area设置弹出层大小\r\n");
      out.write("            area:[\"800px\",\"600px\"],\r\n");
      out.write("            type : 2,\r\n");
      out.write("            content : \"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/task/toUpdateTask.action?id=\"+id,\r\n");
      out.write("            success : function(layero, index){\r\n");
      out.write("                var body = layui.layer.getChildFrame('body', index);\r\n");
      out.write("                \r\n");
      out.write("                setTimeout(function(){\r\n");
      out.write("                    layui.layer.tips('点击此处返回任务列表', '.layui-layer-setwin .layui-layer-close', {\r\n");
      out.write("                        tips: 3\r\n");
      out.write("                    });\r\n");
      out.write("                },500)\r\n");
      out.write("            }\r\n");
      out.write("        })\r\n");
      out.write("       // layui.layer.full(index);//最大化窗口\r\n");
      out.write("        //改变窗口大小时，重置弹窗的宽高，防止超出可视区域（如F12调出debug的操作）\r\n");
      out.write("        $(window).on(\"resize\",function(){\r\n");
      out.write("            layui.layer.full(index);\r\n");
      out.write("        })\r\n");
      out.write("    }\r\n");
      out.write("    //列表操作\r\n");
      out.write("    table.on('tool(taskList)', function(obj){\r\n");
      out.write("        var layEvent = obj.event,\r\n");
      out.write("            data = obj.data;\r\n");
      out.write("        if(layEvent === 'toDoTask'){ //办理任务\r\n");
      out.write("        \ttoDoTask(data);\r\n");
      out.write("        }else if(layEvent === 'toViewProcessImage'){ //查看任务图\r\n");
      out.write("        \ttoViewProcessImage(data.id);\r\n");
      out.write("        } \r\n");
      out.write("    });\r\n");
      out.write("})\r\n");
      out.write("</script>\r\n");
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

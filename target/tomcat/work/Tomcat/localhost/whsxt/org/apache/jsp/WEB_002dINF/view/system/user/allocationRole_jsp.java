/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2018-09-16 10:10:03 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.view.system.user;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class allocationRole_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\t<title>用户分配角色列表---仓库管理系统 2.0</title>\r\n");
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
      out.write("<form class=\"layui-form\">\r\n");
      out.write("\t<table id=\"roleList\" lay-filter=\"roleList\"></table>\r\n");
      out.write("\t<script type=\"text/html\"  id=\"userToolBar\">\r\n");
      out.write("\t<a class=\"layui-btn layui-btn layui-btn-normal\" lay-event=\"saveRole\">保存</a>\r\n");
      out.write("\t</script>\r\n");
      out.write("</form>\r\n");
      out.write("<script type=\"text/javascript\" src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/resources/layui/layui.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/resources/zTree/js/jquery-1.4.4.min.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("var tableIns;\r\n");
      out.write("layui.use(['form','layer','laydate','table'],function(){\r\n");
      out.write("    var form = layui.form,\r\n");
      out.write("        layer = parent.layer === undefined ? layui.layer : top.layer,\r\n");
      out.write("        $ = layui.jquery,\r\n");
      out.write("        table = layui.table;\r\n");
      out.write("   \r\n");
      out.write("    //角色列表\r\n");
      out.write("    tableIns = table.render({\r\n");
      out.write("        elem: '#roleList',\r\n");
      out.write("        url : '");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/user/queryUserAllRole.action?id=");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${userVo.id}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("',\r\n");
      out.write("        cellMinWidth : 95,\r\n");
      out.write("        toolbar: '#userToolBar',\r\n");
      out.write("        defaultToolbar: [],\r\n");
      out.write("        id : \"roleListTable\",\r\n");
      out.write("        cols : [[\r\n");
      out.write("            {type: \"checkbox\", fixed:\"left\", width:50},\r\n");
      out.write("            {field: 'id', title: '角色ID', width:80, align:\"center\"},\r\n");
      out.write("            {field: 'name', title: '角色名称', width:230, align:\"center\"},\r\n");
      out.write("            {field: 'remark', title: '角色备注',  align:\"center\"}\r\n");
      out.write("        ]]\r\n");
      out.write("    });\r\n");
      out.write("    //监听头工具栏事件\r\n");
      out.write("    table.on('toolbar(roleList)', function(obj){\r\n");
      out.write("      var checkStatus = table.checkStatus(obj.config.id)\r\n");
      out.write("      ,data = checkStatus.data; //获取选中的数据\r\n");
      out.write("      switch(obj.event){\r\n");
      out.write("        case 'saveRole':\r\n");
      out.write("        \t  //批量保存角色\r\n");
      out.write("              userId = [];\r\n");
      out.write("              for (var i in data) {\r\n");
      out.write("                  userId.push(data[i].id);\r\n");
      out.write("              }\r\n");
      out.write("              layer.confirm('确定保存角色？', {icon: 3, title: '提示信息'}, function (index) {\r\n");
      out.write("              \t //将需要批量保存角色的rid作为json参数传入 \r\n");
      out.write("                  $.post(\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/user/saveUserRole.action\",{id:'");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${userVo.id}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("',userIds : JSON.stringify(userId) },function(data){\r\n");
      out.write("              \t   layer.msg(data.msg);\r\n");
      out.write("                  tableIns.reload();\r\n");
      out.write("                  })\r\n");
      out.write("              })\r\n");
      out.write("        break;\r\n");
      out.write("      };\r\n");
      out.write("    });\r\n");
      out.write("})\r\n");
      out.write("  \r\n");
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

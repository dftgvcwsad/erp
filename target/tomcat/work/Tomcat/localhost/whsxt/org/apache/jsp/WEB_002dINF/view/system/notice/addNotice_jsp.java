/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2018-09-15 11:51:24 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.view.system.notice;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class addNotice_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>添加公告</title>\r\n");
      out.write("<link rel=\"stylesheet\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/resources/layui/css/layui.css\" media=\"all\">\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t<form id=\"layuiFm\" class=\"layui-form\" action=\"#\" method=\"post\" \r\n");
      out.write("\t\tlay-filter=\"doAddNotice\">\r\n");
      out.write("\t\t<div class=\"layui-form-item\">\r\n");
      out.write("\t\t\t<div class=\"layui-inline\">\r\n");
      out.write("\t\t\t\t<label class=\"layui-form-label\">标题</label>\r\n");
      out.write("\t\t\t\t<div class=\"layui-input-inline\">\r\n");
      out.write("\t\t\t\t\t<input type=\"text\" name=\"title\" id=\"title\" lay-verify=\"required\"\r\n");
      out.write("\t\t\t\t\t\tautocomplete=\"off\" placeholder=\"请输入标题\" class=\"layui-input\">\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<div class=\"layui-form-item layui-form-text\">\r\n");
      out.write("\t\t\t\t<label class=\"layui-form-label\">公告内容</label>\r\n");
      out.write("\t\t\t\t<div class=\"layui-input-block\">\r\n");
      out.write("\t\t\t\t\t<textarea class=\"layui-textarea layui-hide\" name=\"content\"  lay-verify=\"content\" id=\"LAY_demo_editor\"></textarea>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div class=\"layui-form-item\" align=\"center\">\r\n");
      out.write("\t\t\t<div>\r\n");
      out.write("\t\t\t\t<button class=\"layui-btn\" lay-submit=\"\" lay-filter=\"doAdd\">提交</button>\r\n");
      out.write("\t\t\t\t<button type=\"reset\" class=\"layui-btn layui-btn-warm\" >重置</button>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</form>\r\n");
      out.write("\t<script src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/resources/layui/layui.js\" charset=\"utf-8\"></script>\r\n");
      out.write("\t<script>\r\n");
      out.write("\t\tlayui.use([ 'form', 'layedit',  'jquery','layer' ],function() {\r\n");
      out.write("\t\t\t\t\t\t\tvar form = layui.form, $ = layui.jquery, layedit = layui.layedit;\r\n");
      out.write("\t\t\t\t\t\t\tvar layer = parent.layer === undefined ? layui.layer : parent.layer;\r\n");
      out.write("\t\t\t\t\t\t\t//创建一个编辑器\r\n");
      out.write("\t\t\t\t\t\t\tvar editIndex = layedit.build('LAY_demo_editor');\r\n");
      out.write("\t\t\t\t\t\t\t//监听提交\r\n");
      out.write("\t\t\t\t\t\t\tform.on('submit(doAdd)', function(data) {\r\n");
      out.write("\t\t\t\t\t\t\t\t//同步数据\r\n");
      out.write("\t\t\t\t\t\t\t\tlayedit.sync(editIndex);\r\n");
      out.write("\t\t\t\t\t\t\t\tvar params=$(\"#layuiFm\").serialize();\r\n");
      out.write("\t\t\t\t\t\t\t\t$.post(\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/notice/addNotice.action?\"+params,function(obj){\r\n");
      out.write("\t\t\t\t\t\t\t\t\tlayer.msg(obj.msg);//弹出添加成功或失败\r\n");
      out.write("\t\t\t\t\t\t\t\t\tparent.tableIns.reload();//刷新表格\r\n");
      out.write("\t\t\t\t\t\t\t\t\t//关闭窗口\r\n");
      out.write("\t\t\t\t\t\t\t\t\tvar index=layer.getFrameIndex(window.name);\r\n");
      out.write("\t\t\t\t\t\t\t\t\tlayer.close(index);\r\n");
      out.write("\t\t\t\t\t\t\t\t})\r\n");
      out.write("\t\t\t\t\t\t\t\treturn false;\r\n");
      out.write("\t\t\t\t\t\t\t});\r\n");
      out.write("\t\t\t\t\t\t});\r\n");
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
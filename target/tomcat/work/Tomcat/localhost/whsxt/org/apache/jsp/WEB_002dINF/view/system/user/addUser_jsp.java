/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2018-09-15 12:30:59 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.view.system.user;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class addUser_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<title>添加用户</title>\r\n");
      out.write("<link rel=\"stylesheet\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/resources/layui/css/layui.css\"\r\n");
      out.write("\tmedia=\"all\">\r\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/resources/zTree/css/metroStyle/metroStyle.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/resources/plugin/css/index.css\">\r\n");
      out.write("    <script type=\"text/javascript\" src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/resources/zTree/js/jquery-1.4.4.min.js\"></script>\r\n");
      out.write("    <script type=\"text/javascript\" src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/resources/zTree/js/jquery.ztree.all.js\"></script>\r\n");
      out.write("    <script type=\"text/javascript\" src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/resources/plugin/js/selectTree.js\"></script>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t<form id=\"layuiFm\" class=\"layui-form\" action=\"#\" method=\"post\" \r\n");
      out.write("\t\tlay-filter=\"doAddUser\">\r\n");
      out.write("\t\t<div class=\"layui-form-item\">\r\n");
      out.write("\t\t\t<div class=\"layui-inline\">\r\n");
      out.write("\t\t\t\t<label class=\"layui-form-label\">所在部门</label>\r\n");
      out.write("\t\t\t\t<div class=\"layui-input-inline\">\r\n");
      out.write("\t\t\t\t\t<div id=\"deptid\" name=\"deptid\" class=\"select-tree layui-form-select\"></div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<div class=\"layui-inline\">\r\n");
      out.write("\t\t\t\t<label class=\"layui-form-label\">排序码</label>\r\n");
      out.write("\t\t\t\t<div class=\"layui-input-inline\">\r\n");
      out.write("\t\t\t\t\t<input type=\"text\" name=\"ordernum\" id=\"ordernum\" lay-verify=\"number\"\r\n");
      out.write("\t\t\t\t\t\tautocomplete=\"off\" placeholder=\"请输入排序码\" class=\"layui-input\">\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<div class=\"layui-form-item\">\r\n");
      out.write("\t\t\t<div class=\"layui-inline\">\r\n");
      out.write("\t\t\t\t<label class=\"layui-form-label\">领导部门</label>\r\n");
      out.write("\t\t\t\t<div class=\"layui-input-inline\">\r\n");
      out.write("\t\t\t\t\t<div id=\"leaderdeptid\" name=\"leaderdeptid\" class=\"select-tree layui-form-select\"></div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<div class=\"layui-inline\">\r\n");
      out.write("\t\t\t\t<label class=\"layui-form-label\">领导名称</label>\r\n");
      out.write("\t\t\t\t<div class=\"layui-input-inline\">\r\n");
      out.write("\t\t\t\t\t<select id=\"mgr\" name=\"mgr\" class=\"layui-form-select\">\r\n");
      out.write("\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<div class=\"layui-form-item\">\r\n");
      out.write("\t\t\t<div class=\"layui-inline\">\r\n");
      out.write("\t\t\t\t<label class=\"layui-form-label\">用户姓名</label>\r\n");
      out.write("\t\t\t\t<div class=\"layui-input-inline\">\r\n");
      out.write("\t\t\t\t\t<input type=\"text\" name=\"name\" id=\"name\"  lay-verify=\"required\" autocomplete=\"off\"\r\n");
      out.write("\t\t\t\t\t\tplaceholder=\"请输入用户姓名\" class=\"layui-input\">\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t </div>\r\n");
      out.write("\t\t\t\t <div class=\"layui-inline\">\r\n");
      out.write("\t\t\t\t<label class=\"layui-form-label\">登录名</label>\r\n");
      out.write("\t\t\t\t<div class=\"layui-input-inline\">\r\n");
      out.write("\t\t\t\t\t<input type=\"text\" name=\"loginname\" id=\"loginname\"  lay-verify=\"required\" autocomplete=\"off\" class=\"layui-input\">\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t </div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<div class=\"layui-form-item\">\r\n");
      out.write("\t\t\t\t<div class=\"layui-block\">\r\n");
      out.write("\t\t\t\t<label class=\"layui-form-label\">用户地址</label>\r\n");
      out.write("\t\t\t\t<div class=\"layui-input-block\">\r\n");
      out.write("\t\t\t\t<input type=\"text\" name=\"address\" id=\"address\"  autocomplete=\"off\" class=\"layui-input\">\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t<div class=\"layui-form-item layui-form-text\">\r\n");
      out.write("\t\t\t\t<label class=\"layui-form-label\">用户备注</label>\r\n");
      out.write("\t\t\t\t<div class=\"layui-input-block\">\r\n");
      out.write("\t\t\t\t\t<textarea placeholder=\"请输入内容\" name=\"remark\"  id=\"remark\"  class=\"layui-textarea\"></textarea>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<div class=\"layui-form-item\">\r\n");
      out.write("\t\t\t\t<div class=\"layui-inline\">\r\n");
      out.write("\t\t\t\t\t<label class=\"layui-form-label\">性别</label>\r\n");
      out.write("\t\t\t\t\t<div class=\"layui-input-inline\">\r\n");
      out.write("\t\t\t\t\t\t<input type=\"radio\" name=\"sex\" value=\"1\" title=\"男\"  checked=\"\">\r\n");
      out.write("\t\t\t\t\t\t<input type=\"radio\" name=\"sex\" value=\"0\" title=\"女\" >\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<div class=\"layui-inline\">\r\n");
      out.write("\t\t\t\t\t<label class=\"layui-form-label\">是否可用</label>\r\n");
      out.write("\t\t\t\t\t<div class=\"layui-input-inline\">\r\n");
      out.write("\t\t\t\t\t\t<input type=\"radio\" name=\"available\" value=\"1\" title=\"是\"\r\n");
      out.write("\t\t\t\t\t\t\tchecked=\"\"> <input type=\"radio\" name=\"available\"\r\n");
      out.write("\t\t\t\t\t\t\tvalue=\"0\" title=\"否\">\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<div class=\"layui-form-item\">\r\n");
      out.write("\t\t\t\t<div class=\"layui-inline\">\r\n");
      out.write("\t\t\t\t\t\t<label class=\"layui-form-label\">入职日期</label>\r\n");
      out.write("\t\t\t\t\t\t<div class=\"layui-input-inline\">\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"text\" name=\"hiredate\" id=\"hiredate\"  placeholder=\"yyyy-MM-dd HH:mm:ss\"\r\n");
      out.write("\t\t\t\t\t\t\t\t autocomplete=\"off\" class=\"layui-input \">\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
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
      out.write("\tvar from;\r\n");
      out.write("\t\tlayui.use([ 'form', 'layedit', 'laydate', 'jquery','layer' ],function() {\r\n");
      out.write("\t\t\tform = layui.form;\r\n");
      out.write("\t\t\t  var layer = parent.layer === undefined ? layui.layer : top.layer,\r\n");
      out.write("\t\t        $ = layui.jquery,\r\n");
      out.write("\t\t        laydate = layui.laydate,\r\n");
      out.write("\t\t        laytpl = layui.laytpl,\r\n");
      out.write("\t\t        table = layui.table;\r\n");
      out.write("\t\t\t  //日期\r\n");
      out.write("\t\t\t    laydate.render({\r\n");
      out.write("\t\t\t      elem: '#hiredate'\r\n");
      out.write("\t\t\t    \t  ,type: 'datetime'\r\n");
      out.write("\t\t\t    });\r\n");
      out.write("\t\t\t\t\t\t\t//监听提交\r\n");
      out.write("\t\t\t\t\t\t\tform.on('submit(doAdd)', function(data) {\r\n");
      out.write("\t\t\t\t\t\t\t\tvar params=$(\"#layuiFm\").serialize();\r\n");
      out.write("\t\t\t\t\t\t\t\t$.post(\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/user/addUser.action?\"+params,function(obj){\r\n");
      out.write("\t\t\t\t\t\t\t\t\tlayer.msg(obj.msg);//弹出添加成功或失败\r\n");
      out.write("\t\t\t\t\t\t\t\t\tparent.tableIns.reload();//刷新表格\r\n");
      out.write("\t\t\t\t\t\t\t\t\t//关闭窗口\r\n");
      out.write("\t\t\t\t\t\t\t\t\t var index = parent.layer.getFrameIndex(window.name);\r\n");
      out.write("\t\t\t\t\t\t             parent.layer.close(index);\r\n");
      out.write("\t\t\t\t\t\t\t\t}) \r\n");
      out.write("\t\t\t\t\t\t\t\treturn false;\r\n");
      out.write("\t\t\t\t\t\t\t});\r\n");
      out.write("\t\t\t\t\t\t\t $(\"#name\").on(\"blur\",function(){\r\n");
      out.write("\t\t\t\t\t\t\t\t var name=$('#name').val();\r\n");
      out.write("\t\t\t\t\t\t\t\t $.post(\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/user/getLoginnamePinyinByName.action\",{name:name},function(data){\r\n");
      out.write("\t\t\t\t\t\t\t\t\t$('#loginname').val(data);\r\n");
      out.write("\t\t\t\t\t\t\t\t })\r\n");
      out.write("\t\t\t\t\t\t\t })\r\n");
      out.write("\t\t\t\t\t\t});\r\n");
      out.write("\t\t$(document).ready(function () {\r\n");
      out.write("\t\t\t $.post(\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/dept/loadDeptTree.action?available=1\",function(zNodes){\r\n");
      out.write("\t\t\t\t initSelectTree(\"deptid\",zNodes, false);\r\n");
      out.write("\t\t\t\t initSelectTree(\"leaderdeptid\",zNodes, false);\r\n");
      out.write("\t\t\t        $(\".layui-nav-item a\").bind(\"click\", function () {\r\n");
      out.write("\t\t\t            if (!$(this).parent().hasClass(\"layui-nav-itemed\") && !$(this).parent().parent().hasClass(\"layui-nav-child\")) {\r\n");
      out.write("\t\t\t                $(\".layui-nav-tree\").find(\".layui-nav-itemed\").removeClass(\"layui-nav-itemed\")\r\n");
      out.write("\t\t\t            }\r\n");
      out.write("\t\t\t        })\r\n");
      out.write("\t\t\t });\r\n");
      out.write("\t    });\r\n");
      out.write("\t\t //根据部门id查询部门下面的所有员工\r\n");
      out.write("\t\t function getUserBydeptId(deptid) {\r\n");
      out.write("\t\t\t$.post(\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/user/getUserBydeptId.action\",{deptid:deptid},function(data){\r\n");
      out.write("\t\t\t\tvar html=\"\";\r\n");
      out.write("\t\t\t\tif(data.length>0){\r\n");
      out.write("\t\t\t\t\tfor(var i=0;i<data.length;i++){\r\n");
      out.write("\t\t\t\t\thtml+=\"<option value=\"+data[i].id+\">\"+data[i].name+\"</option>\"\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t$(\"#mgr\").html(html);\r\n");
      out.write("\t\t\t\t}else{\r\n");
      out.write("\t\t\t\t\t$(\"#mgr\").html(html);\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\tform.render(\"select\");//重新渲染\r\n");
      out.write("\t\t\t},'json');\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t\r\n");
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

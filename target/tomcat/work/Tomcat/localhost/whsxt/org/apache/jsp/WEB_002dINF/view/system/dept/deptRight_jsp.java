/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2018-09-26 14:35:00 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.view.system.dept;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class deptRight_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\t<title>部门列表---仓库管理系统 2.0</title>\r\n");
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
      out.write("\t<blockquote class=\"layui-elem-quote quoteBox\">\r\n");
      out.write("\t\t<form class=\"layui-form\">\r\n");
      out.write("\t\t\t<div class=\"layui-form-item\">\r\n");
      out.write("\t\t\t\t<div class=\"layui-inline\">\r\n");
      out.write("\t\t\t\t\t\t<label class=\"layui-form-label\">部门名称</label>\r\n");
      out.write("\t\t\t\t\t\t<div class=\"layui-input-inline\">\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"text\" name=\"name\" id=\"name\" autocomplete=\"off\" class=\"layui-input \" />\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<div class=\"layui-inline\">\r\n");
      out.write("\t\t\t\t\t\t<label class=\"layui-form-label\">部门地址</label>\r\n");
      out.write("\t\t\t\t\t\t<div class=\"layui-input-inline\">\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"text\" name=\"loc\" id=\"loc\" autocomplete=\"off\" class=\"layui-input \" />\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<div class=\"layui-inline\">\r\n");
      out.write("\t\t\t\t\t\t<label class=\"layui-form-label\">部门备注</label>\r\n");
      out.write("\t\t\t\t\t\t<div class=\"layui-input-inline\">\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"text\" name=\"remark\" id=\"remark\" autocomplete=\"off\" class=\"layui-input \" />\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<div class=\"layui-form-item\" align=\"center\">\r\n");
      out.write("\t\t\t<a class=\"layui-btn search_btn\" data-type=\"reload\">搜索</a>\r\n");
      out.write("\t\t\t<button type=\"reset\" class=\"layui-btn layui-btn-warm\" >重置</button>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</form>\r\n");
      out.write("\t</blockquote>\r\n");
      out.write("\t<script type=\"text/html\"  id=\"deptToolBar\">\r\n");
      out.write("\t<a class=\"layui-btn layui-btn-xs layui-btn layui-btn-normal\" lay-event=\"add\">添加</a>\r\n");
      out.write("\t<a class=\"layui-btn layui-btn-xs layui-btn-danger\" lay-event=\"delete\">批量删除</a>\r\n");
      out.write("\t</script>\r\n");
      out.write("\t<table id=\"deptList\" lay-filter=\"deptList\"></table>\r\n");
      out.write("\t<!--操作-->\r\n");
      out.write("\t<script type=\"text/html\" id=\"deptListBar\">\r\n");
      out.write("\t\t<a class=\"layui-btn layui-btn-xs\" lay-event=\"edit\">编辑</a>\r\n");
      out.write("\t\t<a class=\"layui-btn layui-btn-xs layui-btn-danger\" lay-event=\"del\">删除</a>\r\n");
      out.write("\t</script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/resources/layui/layui.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/resources/zTree/js/jquery-1.4.4.min.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("var tableIns;\r\n");
      out.write("\tfunction reloadTable(id) {\r\n");
      out.write("\t\ttableIns.reload({\r\n");
      out.write("            page: {\r\n");
      out.write("                curr: 1 //重新从第 1 页开始\r\n");
      out.write("            },\r\n");
      out.write("            where: {\r\n");
      out.write("            \tname: $(\"#name\").val(),//搜索的关键字\r\n");
      out.write("            \tloc: $(\"#loc\").val(),\r\n");
      out.write("       \t\t remark: $(\"#remark\").val(),\r\n");
      out.write("       \t\t id:id\r\n");
      out.write("            }\r\n");
      out.write("        })\r\n");
      out.write("\t}\r\n");
      out.write("layui.use(['form','layer','laydate','table','laytpl'],function(){\r\n");
      out.write("    var form = layui.form,\r\n");
      out.write("        layer = parent.layer === undefined ? layui.layer : top.layer,\r\n");
      out.write("        $ = layui.jquery,\r\n");
      out.write("        laydate = layui.laydate,\r\n");
      out.write("        laytpl = layui.laytpl,\r\n");
      out.write("        table = layui.table;\r\n");
      out.write("\r\n");
      out.write("    //新闻列表\r\n");
      out.write("     tableIns = table.render({\r\n");
      out.write("        elem: '#deptList',\r\n");
      out.write("        url : '");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/dept/queryAllDept.action',\r\n");
      out.write("        cellMinWidth : 95,\r\n");
      out.write("        page : true,\r\n");
      out.write("        toolbar: '#deptToolBar',\r\n");
      out.write("        defaultToolbar: ['filter', 'exports'],\r\n");
      out.write("        height : \"full-125\",\r\n");
      out.write("        limit : 10,\r\n");
      out.write("        limits : [10,15,20,25],\r\n");
      out.write("        id : \"deptListTable\",\r\n");
      out.write("        cols : [[\r\n");
      out.write("            {type: \"checkbox\", fixed:\"left\", width:50},\r\n");
      out.write("            {field: 'id', title: '部门编号', width:80, align:\"center\"},\r\n");
      out.write("            {field: 'pid', title: '父级部门编号',align:'center'},\r\n");
      out.write("            {field: 'name', title: '部门名称', align:'center'},\r\n");
      out.write("            {field: 'open', title: '是否展开', align:'center',templet:function(d){\r\n");
      out.write("                return d.open==1?\"展开\":\"不展开\";\r\n");
      out.write("            }},\r\n");
      out.write("            {field: 'parent', title: '是否父节点', align:'center',templet:function(d){\r\n");
      out.write("                return d.parent==1?\"是\":\"不是\";\r\n");
      out.write("            }},\r\n");
      out.write("            {field: 'remark', title: '备注', width:100,align:'center'},\r\n");
      out.write("            {field: 'loc', title: '地址', align:'center'},\r\n");
      out.write("          \r\n");
      out.write("            {field: 'available ', title: '是否可用', align:'center', templet:function(d){\r\n");
      out.write("                return d.available==1?\"可用\":\"不可用\";\r\n");
      out.write("            }},\r\n");
      out.write("            {field: 'ordernum', title: '排序码', align:'center'},\r\n");
      out.write("            {title: '操作', width:130, templet:'#deptListBar' ,fixed:\"right\",align:\"center\"}\r\n");
      out.write("        ]]\r\n");
      out.write("    });\r\n");
      out.write("    //监听头工具栏事件\r\n");
      out.write("    table.on('toolbar(deptList)', function(obj){\r\n");
      out.write("      var checkStatus = table.checkStatus(obj.config.id)\r\n");
      out.write("      ,data = checkStatus.data; //获取选中的数据\r\n");
      out.write("      switch(obj.event){\r\n");
      out.write("        case 'add':\r\n");
      out.write("        \taddDept();\r\n");
      out.write("        break;\r\n");
      out.write("        case 'delete':\r\n");
      out.write("          if(data.length === 0){\r\n");
      out.write("            layer.msg('请选择一行');\r\n");
      out.write("          } else {\r\n");
      out.write("        \t  //批量删除\r\n");
      out.write("              deptId = [];\r\n");
      out.write("              for (var i in data) {\r\n");
      out.write("                  deptId.push(data[i].id);\r\n");
      out.write("              }\r\n");
      out.write("              layer.confirm('确定删除选中的部门？', {icon: 3, title: '提示信息'}, function (index) {\r\n");
      out.write("              \t //将需要删除的deptId作为json参数传入 \r\n");
      out.write("                  $.post(\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/dept/batchDeleteDept.action\",{deptIds : JSON.stringify(deptId) },function(data){\r\n");
      out.write("              \t   layer.msg(data.msg);\r\n");
      out.write("                  tableIns.reload();\r\n");
      out.write("                  window.parent.left.initTree();//刷新左边的树\r\n");
      out.write("                  })\r\n");
      out.write("              })\r\n");
      out.write("          }\r\n");
      out.write("        break;\r\n");
      out.write("      };\r\n");
      out.write("    });\r\n");
      out.write("    //搜索【此功能需要后台配合，所以暂时没有动态效果演示】\r\n");
      out.write("    $(\".search_btn\").on(\"click\",function(){\r\n");
      out.write("    \treloadTable(null);\r\n");
      out.write("    });\r\n");
      out.write("    //添加部门\r\n");
      out.write("    function addDept(){\r\n");
      out.write("        var index = layui.layer.open({\r\n");
      out.write("            title : \"添加部门\",\r\n");
      out.write("            //area设置弹出层大小\r\n");
      out.write("            area:[\"800px\",\"600px\"],\r\n");
      out.write("            type : 2,\r\n");
      out.write("            content : \"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/dept/toAddDept.action\",\r\n");
      out.write("            success : function(layero, index){\r\n");
      out.write("                var body = layui.layer.getChildFrame('body', index);\r\n");
      out.write("                setTimeout(function(){\r\n");
      out.write("                    layui.layer.tips('点击此处返回部门列表', '.layui-layer-setwin .layui-layer-close', {\r\n");
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
      out.write("    //修改部门\r\n");
      out.write("    function updateDept(id){\r\n");
      out.write("        var index = layui.layer.open({\r\n");
      out.write("            title : \"修改部门\",\r\n");
      out.write("            //area设置弹出层大小\r\n");
      out.write("            area:[\"800px\",\"600px\"],\r\n");
      out.write("            type : 2,\r\n");
      out.write("            content : \"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/dept/toUpdateDept.action?id=\"+id,\r\n");
      out.write("            success : function(layero, index){\r\n");
      out.write("                var body = layui.layer.getChildFrame('body', index);\r\n");
      out.write("                setTimeout(function(){\r\n");
      out.write("                    layui.layer.tips('点击此处返回部门列表', '.layui-layer-setwin .layui-layer-close', {\r\n");
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
      out.write("    table.on('tool(deptList)', function(obj){\r\n");
      out.write("        var layEvent = obj.event,\r\n");
      out.write("            data = obj.data;\r\n");
      out.write("        if(layEvent === 'edit'){ //编辑\r\n");
      out.write("        \tupdateDept(data.id);\r\n");
      out.write("        } else if(layEvent === 'del'){ //删除\r\n");
      out.write("            layer.confirm('确定删除'+data.id+'编号'+data.name+'部门？',{icon:3, title:'提示信息'},function(index){\r\n");
      out.write("                 $.post(\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/dept/deleteDept.action\",{\r\n");
      out.write("                \t id : data.id  //将需要删除的deptId作为参数传入\r\n");
      out.write("               },function(data){\r\n");
      out.write("            \t   layer.msg(data.msg);\r\n");
      out.write("                    tableIns.reload();\r\n");
      out.write("                    window.parent.left.initTree();//刷新左边的树\r\n");
      out.write("                })\r\n");
      out.write("            });\r\n");
      out.write("        } else if(layEvent === 'look'){ //预览\r\n");
      out.write("            layer.alert(\"此功能需要前台展示，实际开发中传入对应的必要参数进行部门内容页面访问\")\r\n");
      out.write("        }\r\n");
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

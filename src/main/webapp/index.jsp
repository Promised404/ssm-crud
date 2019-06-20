<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工列表</title>
<%-- <%
	pageContext.setAttribute("APP_PATH", request.get);
%> --%>
<link href="${pageContext.request.contextPath }/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<!-- 员工添加 -->
	<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">新增员工</h4>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal" method="post">
			  <div class="form-group">
			    <label class="col-sm-2 control-label">员工姓名</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="empName_add_input" placeholder="empName" name="empName">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">email</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="email_add_input" placeholder="email@11111.com" name="email">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">性别</label>
			    <label class="radio-inline">
				  <input type="radio" name="gender" id="gender1_add_input" value="M" checked="checked"> 男
				</label>
				<label class="radio-inline">
				  <input type="radio" name="gender" id="gender2_add_input" value="F"> 女
				</label>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">部门名称</label>
				<div class="col-sm-4">
					<!-- 部门提交部门id -->
					<select class="form-control depInfo" name="dId" id="depInfo">
					 	
					</select>
				</div>
			  </div>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- 员工修改 -->
	<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabelUpdate">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabelUpdate">修改员工</h4>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal" method="post">
			  <div class="form-group">
			    <label class="col-sm-2 control-label">员工姓名</label>
			    <div class="col-sm-10">
			      <p class="form-control-static" id="update_empName"></p>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">email</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="email_update_input" placeholder="email@11111.com" name="email">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">性别</label>
			    <label class="radio-inline">
				  <input type="radio" name="gender" id="gender1_update_input" value="M" checked="checked"> 男
				</label>
				<label class="radio-inline">
				  <input type="radio" name="gender" id="gender2_update_input" value="F"> 女
				</label>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">部门名称</label>
				<div class="col-sm-4">
					<!-- 部门提交部门id -->
					<select class="form-control depInfo" name="dId" id="depInfo">
					 	
					</select>
				</div>
			  </div>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
	      </div>
	    </div>
	  </div>
	</div>

	<!-- 搭建显示页面 -->
	<div class="container">
		<!-- 标题 -->
		<div class="row">
			<div class="col-md-12">
				<h1>SSM-CRUD系统</h1>
			</div>
		</div>
		<!-- 两个操作按钮 -->
		<div class="row">
			<div class="col-md-4 col-md-offset-8">
				<button class="btn btn-primary" id="emp_add_modal_btn">新增</button>
				<button class="btn btn-danger" id="emp_del_modal_btn">删除</button>
			</div>
		</div>
		<!-- 表格数据 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="emps_table">
					<thead>
						<tr>
							<th><input type="checkbox" id="checkAll"/></th>
							<th>#</th>
							<th>empName</th>
							<th>gender</th>
							<th>email</th>
							<th>deptName</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						
					</tbody>
					
				</table>
			</div>
		</div>
		<!-- 显示分页信息 -->
		<div class="row">
			<!-- 分页文字信息 -->
			<div class="col-md-6" id="page_info">
				
			</div>
			<!-- 分页条 -->
			<div class="col-md-6" id="page_nav">
				
			</div>
		</div>
	</div>
</body>
<script>
	var maxEmpCount,currentPage;
	$(function(){
		to_page(1);
		getAllDeps();
	});
	function build_emp_table(data){
		$("#emps_table tbody").empty();
		var emps = data.extend.pageInfo.list;
		$.each(emps,function(index,item){
			var checkBoxTd = $("<td></td>").append($("<input/>").prop("type","checkbox").addClass("checkBox_emp"));
			var empIdTd = $("<td></td>").append(item.empId);
			var empNameTd = $("<td></td>").append(item.empName);
			var empGenderTd = $("<td></td>").append(item.gender=="M"?"男":"女");
			var empEmailTd = $("<td></td>").append(item.email);
			var empDeptNameTd = $("<td></td>").append(item.department.deptName);
			var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
					.append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
			editBtn.attr("edit-id",item.empId);
			var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm del_btn")
			.append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
			delBtn.attr("del-id",item.empId);
			var btnTd = $("<td></td>").append(editBtn).append("  ").append(delBtn);
			$("<tr></tr>").append(checkBoxTd)
			.append(empIdTd)
			.append(empNameTd)
			.append(empGenderTd)
			.append(empEmailTd)
			.append(empDeptNameTd)
			.append(btnTd)
			.appendTo("#emps_table tbody");
		});
		
	}
	
	function build_page_info(data){
		$("#page_info").empty();
		var pageInfo = data.extend.pageInfo;
		$("#page_info").append("当前"+ pageInfo.pageNum +"页,共"+ pageInfo.pages +"页,共"+ pageInfo.total +"条记录");
		maxEmpCount = pageInfo.total;
		currentPage = pageInfo.pageNum;
	}
	
	function build_page_nav(data){
		$("#page_nav").empty();
		var ul = $("<ul></ul>").addClass("pagination");
		var pageInfo = data.extend.pageInfo;
		var firstPageLi = $("<li></li>").append($("<a></a>").append("首页"));
		var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
		firstPageLi.click(function(){
			to_page(1);
		});
		if(pageInfo.hasPreviousPage){
			
			prePageLi.click(function(){
				to_page(pageInfo.pageNum - 1);
			});
		}else{
			firstPageLi.addClass("disabled");
			prePageLi.addClass("disabled");
		}
		var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
		var lastPageLi = $("<li></li>").append($("<a></a>").append("末页"));
		lastPageLi.click(function(){
			to_page(pageInfo.pages);
		});
		if(pageInfo.hasNextPage){
			nextPageLi.click(function(){
				to_page(pageInfo.pageNum + 1);
			});
		}else{
			nextPageLi.addClass("disabled");
			lastPageLi.addClass("disabled");
		}
		ul.append(firstPageLi).append(prePageLi);
		$.each(pageInfo.navigatepageNums,function(index,item){
			var numLi = $("<li></li>").append($("<a></a>").append(item));
			if(item == pageInfo.pageNum){
				numLi.addClass("active");
			}
			ul.append(numLi);
			numLi.click(function(){
				to_page(item);
			});
		});
		ul.append(nextPageLi).append(lastPageLi);
		var nav = $("<nav></nav>").append(ul).appendTo("#page_nav");
	}
			
	function to_page(pn){
		$.ajax({
			url:"${pageContext.request.contextPath}/emps",
			data:{"pn":pn},
			type:"GET",
			success:function(data){
				//1.解析并显示员工数据
				build_emp_table(data);
				//2.解析分页信息
				build_page_info(data);
				//3.解析分页
				build_page_nav(data);
			}
		});
	}
	
	function reset_form(ele){
		$(ele)[0].reset();
		$(ele).find("*").removeClass("has-error has-success");
		$(ele).find(".help-block").text("");
	}
	
	//新增员工弹框
	$("#emp_add_modal_btn").click(function(){
		//清楚新增员工表单数据
		reset_form("#empAddModal form");
		$('#empAddModal').modal({
			backdrop:"static"
		});
	});
	
	function getAllDeps(){
		$.ajax({
			url:"${pageContext.request.contextPath}/deps",
			type:"GET",
			success:function(data){
				buildDepsInfo(data);
			}
		});
	}
	
	function buildDepsInfo(data){
		var department = data.extend.departmentList;
		var departmentList = $(".depInfo");
		$.each(department,function(index,item){
			var departName = $("<option></option>").attr("value",item.deptId).text(item.deptName);
			departmentList.append(departName);
		});
		//$("#depInfo")
	}
	
	//效验表单数据
	function validate_add_form(){
		//1.先拿到表单数据
		var empName = $("#empName_add_input").val();
		var empEmail = $("#email_add_input").val();
		var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
		var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
		if(!regName.test(empName)){
			//alert("用户名可以是2-5位中文或则6-16位英文和数字的组合");
			show_validate_msg("#empName_add_input","error","用户名可以是2-5位中文或则6-16位英文和数字的组合");
			return false;
		}else{
			show_validate_msg("#empName_add_input","success","");
		}
		if(!regEmail.test(empEmail)){
			//alert("邮箱格式不正确");
			show_validate_msg("#email_add_input","error","邮箱格式不正确");
			return false;
		}else{
			show_validate_msg("#email_add_input","success","");
		}
		return true;
	}
	
	function show_validate_msg(ele,status,msg){
		$(ele).parent().removeClass("has-success");
		$(ele).parent().removeClass("has-error");
		$(ele).next("span").text("");
		if("success" == status){
			$(ele).parent().addClass("has-success");
			$(ele).next("span").text("");
		}else if("error" == status){
			$(ele).parent().addClass("has-error");
			$(ele).next("span").text(msg);
		}
	}
	
	$("#empName_add_input").change(function(){
		//alert($("#empName_add_input").val());
		var empName = this.value;
		$.ajax({
			url:"${pageContext.request.contextPath}/cheakUser",
			type:"POST",
			data:"empName=" + empName,
			success:function(data){
				if(data.code == 100){
					show_validate_msg("#empName_add_input","success",data.extend.val_name);
					$("#emp_save_btn").attr("ajax_val","success");
				}else{
					show_validate_msg("#empName_add_input","error",data.extend.val_name);
					$("#emp_save_btn").attr("ajax_val","error");
				}
			}
		});
	});
	
	$("#emp_save_btn").click(function(){
		//1、先对数据进行效验
		/* if(!validate_add_form()){
			return false;
		} */
		if($(this).attr("ajax_val") == "error"){
			show_validate_msg("#empName_add_input","error","用户名已存在");
			return false;
		}
		//2、提交给服务器
		$.ajax({
			url:"${pageContext.request.contextPath}/emps",
			type:"POST",
			data:$("#empAddModal form").serialize(),
			success:function(data){
				if(data.code == 100){
					$('#empAddModal').modal('hide');
					to_page(maxEmpCount);
				}else{
					//console.log(data);
					if(undefined != data.extend.errorFields.email){
						//邮箱错误信息
						show_validate_msg("#email_add_input","error",data.extend.errorFields.email);
					}
					if(undefined != data.extend.errorFields.empName){
						show_validate_msg("#empName_add_input","error",data.extend.errorFields.empName);
					}
				}
			}
		});
	});
	
	//编辑模态框
	$(document).delegate(".edit_btn","click",function(){
		$('#empUpdateModal').modal({
			backdrop:"static"
		});
		getEmp($(this).attr("edit-id"));
		$("#emp_update_btn").attr("update-id",$(this).attr("edit-id"));
	});
	
	function getEmp(empId){
		$.ajax({
			url:"${pageContext.request.contextPath}/emp/" + empId,
			type:"GET",
			success:function(data){
				$("#update_empName").text(data.extend.employee.empName);
				$("#email_update_input").val(data.extend.employee.email);
				$("#empUpdateModal input[name=gender]").val([data.extend.employee.gender]);
				$("#empUpdateModal select").val([data.extend.employee.dId]);
			}
		});
	}
	
	$("#emp_update_btn").click(function(){
		var empEmail = $("#email_update_input").val();
		var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
		if(!regEmail.test(empEmail)){
			//alert("邮箱格式不正确");
			show_validate_msg("#email_update_input","error","邮箱格式不正确");
			return false;
		}else{
			show_validate_msg("#email_update_input","success","");
		}
		updateEmp($(this).attr("update-id"));
	});
	
	function updateEmp(empId){
		$.ajax({
			url:"${pageContext.request.contextPath}/emp/" + empId,
//			type:"PUT",
			type:"PUT",
//			data:$("#empUpdateModal form").serialize()+"&_method=PUT",
			data:$("#empUpdateModal form").serialize(),
			success:function(data){
				$('#empUpdateModal').modal('hide');
				to_page(currentPage);
			}
		});
	}
	
	//删除按钮监听
	$(document).on("click",".del_btn",function(){
		//alert($(this).parents("tr").find("td").eq(1).text());
		var empName = $(this).parents("tr").find("td").eq(2).text();
		var empId = $(this).attr("del-id");
		if(confirm("确认删除【"+ empName +"】吗？")){
			//确认，发送ajax请求删除即可
			$.ajax({
				url:"${pageContext.request.contextPath}/emp/" + empId,
				type:"DELETE",
				success:function(data){
					to_page(currentPage);
				}
			})
		}
	});
	
	//员工全选/全不选
	$("#checkAll").click(function(){
		$(".checkBox_emp").prop("checked",$(this).prop("checked"));
	});
	
	$(document).on("click",".checkBox_emp",function(){
		var flag = $(".checkBox_emp:checked").length==$(".checkBox_emp").length;
		$("#checkAll").prop("checked",flag);
	});
	
	//全删
	$("#emp_del_modal_btn").click(function(){
		var empNames = "";
		var empIds = "";
		$.each($(".checkBox_emp:checked"),function(index,item){
			empNames += $(this).parents("tr").find("td:eq(2)").text() + ",";
			//组装员工id字符串
			empIds += $(this).parents("tr").find("td:eq(1)").text() + "-";
		});
		//去除多余的逗号
		empNames = empNames.substring(0,empNames.length-1);
		//去除多余的-
		empIds = empIds.substring(0,empNames.length-1);
		if(confirm("确认删除【" + empNames + "】吗？")){
			$.ajax({
				url:"${pageContext.request.contextPath}/emp/" + empIds,
				type:"DELETE",
				success:function(data){
					alert(data.msg);
					//回到当前页面
					to_page(currentPage);
				}
			})	
		}
	});
</script>
</html>
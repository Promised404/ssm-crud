package com.it888.crud.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it888.crud.bean.Department;
import com.it888.crud.service.DepartmentService;
import com.it888.crud.utils.Msg;

/**
 * 处理部门增删改查
 * @author 邓鹏涛
 *
 */
@Controller
public class DepartmentController {

	@Autowired
	private DepartmentService departmentService;
	
	/**
	 * 获取所有的部门信息
	 * @return
	 */
	@RequestMapping(value="/deps")
	@ResponseBody
	public Msg getDeps(){		
		List<Department> departmentList = departmentService.getAllDepartment();
		return Msg.success().add("departmentList", departmentList);
	}
	
}

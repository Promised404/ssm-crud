package com.it888.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it888.crud.bean.Department;
import com.it888.crud.dao.DepartmentMapper;

/**
 * 部门service
 * @author 邓鹏涛
 *
 */
@Service
public class DepartmentService {

	@Autowired
	private DepartmentMapper departmentMapper;
	
	public List<Department> getAllDepartment(){
		List<Department> list = departmentMapper.selectByExample(null);
		return list;
	}
	
}

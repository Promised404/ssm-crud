package com.it888.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it888.crud.bean.Employee;
import com.it888.crud.bean.EmployeeExample;
import com.it888.crud.bean.EmployeeExample.Criteria;
import com.it888.crud.dao.EmployeeMapper;

/**
 * 员工service
 * @author 邓鹏涛
 *
 */
@Service
public class EmployeeService {
	
	@Autowired
	private EmployeeMapper employeeMapper;
	
	/**
	 * 查询所有
	 * @return
	 */
	public List<Employee> getAll(){
		List<Employee> list = employeeMapper.selectByExampleWithDept(null);
		return list;
	}

	/**
	 * 保存员工
	 * @param employee
	 */
	public void saveEmployee(Employee employee) {
		int insert = employeeMapper.insert(employee);
	}
	
	/**
	 * 效验用户名是否存在
	 * @param empName
	 * @return
	 */
	public boolean cheakUser(String empName) {
		EmployeeExample example = new EmployeeExample();
		Criteria criteria = example.createCriteria();
		criteria.andEmpNameEqualTo(empName);
		long count = employeeMapper.countByExample(example);
		if(count >= 1){
			return false;
		}
		return true;
	}

	/**
	 * 根据id获取员工
	 * @param id
	 * @return
	 */
	public Employee getEmp(Integer empId) {
		Employee employee = employeeMapper.selectByPrimaryKey(empId);
		return employee;
	}

	/**
	 * 更新员工信息
	 * @param employee
	 */
	public void updateEmp(Employee employee) {
		int effect = employeeMapper.updateByPrimaryKeySelective(employee);
	}

	/**
	 * 根据id删除员工
	 * @param empId
	 */
	public void deleteEmp(Integer empId) {
		employeeMapper.deleteByPrimaryKey(empId);
	}

	/**
	 * 批量删除员工
	 * @param empIds
	 */
	public void deleteBatch(List<Integer> empIds) {
		EmployeeExample example = new EmployeeExample();
		Criteria criteria = example.createCriteria();
		//delete from xxx where emp_id in(1,2,3)
		criteria.andEmpIdIn(empIds);
		employeeMapper.deleteByExample(example);
	}
}

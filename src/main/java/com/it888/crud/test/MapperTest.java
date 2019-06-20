package com.it888.crud.test;

import java.util.List;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.it888.crud.bean.Department;
import com.it888.crud.bean.Employee;
import com.it888.crud.dao.DepartmentMapper;
import com.it888.crud.dao.EmployeeMapper;

/**
 * 测试dao层
 * @author 邓鹏涛
 *	使用SpringTest模块
 * 
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
public class MapperTest {
	
	@Autowired
	private DepartmentMapper departmentMapper;
	@Autowired
	private EmployeeMapper employeeMapper;
	@Autowired
	private SqlSession sqlSession;
	
	@Test
	public void testCRUD(){
		//1、创建SpringIOC容器
		/*ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
		DepartmentMapper bean = ac.getBean(DepartmentMapper.class);*/
		//2、从容器中获取mapper
		//System.out.println(departmentMapper);
		//1、插入几个部门
		//departmentMapper.insertSelective(new Department(null, "开发部"));
		//departmentMapper.insertSelective(new Department(null, "测试部"));
		
		//employeeMapper.insertSelective(new Employee(null, "码农", "M", "manong@it888.com", 1));
		//批量插入：批量：使用可以批量操作的sqlsession
		/*EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
		for (int i = 0; i < 1000; i++) {
			String username = UUID.randomUUID().toString().substring(0, 5) + i;
			mapper.insertSelective(new Employee(null, username, "M",username + "@it888.com" , 1));
		}*/
		List<Employee> list = employeeMapper.selectByExampleWithDept(null);
		System.out.println(list);
	}
	
	@Test
	public void testDepartment(){
		List<Department> list = departmentMapper.selectByExample(null);
		for (Department department : list) {
			System.out.println(department.getDeptName());
		}
	}
}

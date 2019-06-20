package com.it888.crud.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.it888.crud.bean.Employee;
import com.it888.crud.dao.EmployeeMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
public class ServiceTest {
	
	@Autowired
	private EmployeeMapper employeeMapper;
	
	@Test
	public void getAllTest(){
		List<Employee> list = employeeMapper.selectByExampleWithDept(null);
		System.out.println(list);
	}
}

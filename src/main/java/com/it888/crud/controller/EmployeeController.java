package com.it888.crud.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.it888.crud.bean.Employee;
import com.it888.crud.service.EmployeeService;
import com.it888.crud.utils.Msg;

/**
 * 处理员工增删改查
 * @author 邓鹏涛
 *
 */
@Controller
public class EmployeeController {
	
	@Autowired
	private EmployeeService employeeService;
	
	
	/**
	 * 单个删除，批量删除二合一
	 * 批量删除1-2-3
	 * 单个删除1
	 * @param empId
	 * @return
	 */
	@RequestMapping(value = "/emp/{empIds}",method=RequestMethod.DELETE)
	@ResponseBody
	public Msg deleteEmp(@PathVariable("empIds") String empIds){
		//判断是否为批量删除
		if(empIds.contains("-")){
			List<Integer> del_ids = new ArrayList<Integer>();
			String[] str_ids = empIds.split("-");
			for (String string : str_ids) {
				del_ids.add(Integer.parseInt(string));
			}
			employeeService.deleteBatch(del_ids);
			return Msg.success();
		}else{
			Integer empId = Integer.parseInt(empIds);
			employeeService.deleteEmp(empId);
			return Msg.success();
		}
	}
	
	/**
	 * 修改员工信息
	 * 注意：这里的路径参数没有用注解绑定是因为路径参数与传过来的员工里面的字段名一样，所以可以自动匹配
	 * restful风格对于tomcat不支持的解决方案，
	 * 1、发送使用post,参数后使用&_method=put,controller还是put，这种方式需要在web.xml中配置HiddenHttpMethodFilter
	 * 2、发送直接使用put,controller也使用put接受，这种方式需要在web.xml中配置springmvc的HttpPutFormContentFilter
	 * @param employee
	 * @return
	 */
	@RequestMapping(value = "/emp/{empId}",method=RequestMethod.PUT)
	@ResponseBody
	public Msg updateEmp(Employee employee) {
		employeeService.updateEmp(employee);
		return Msg.success();
	}
	
	/**
	 * 根据员工id获取员工信息
	 * @param empId
	 * @return
	 */
	@RequestMapping(value = "/emp/{empId}",method=RequestMethod.GET)
	@ResponseBody
	public Msg getEmp(@PathVariable Integer empId){
		Employee employee = employeeService.getEmp(empId);
		return Msg.success().add("employee", employee);
	}
	
	/**
	 * 效验用户名
	 * @param empName
	 * @return
	 */
	@RequestMapping(value = "/cheakUser",method=RequestMethod.POST)
	@ResponseBody
	public Msg cheakUser(String empName){
		String regx = "";
		boolean bool = employeeService.cheakUser(empName);
		if(bool){
			return Msg.success().add("val_name", "用户名正确");
		}else{
			return Msg.fail().add("val_name", "用户名已存在");
		}
	}
	/**
	 * 查询所有员工（分页查询）
	 * @return 
	 */
	@RequestMapping(value = "/emps",method=RequestMethod.GET)
	@ResponseBody
	public Msg getEmps(@RequestParam(value="pn",defaultValue="1")Integer pn){
		//分页查询，借助PageHelper分页插件
		//在查询之前只需要调用，传入页码，以及每页数据
		PageHelper.startPage(pn, 5);
		List<Employee> list = employeeService.getAll();
		//使用pageInfo包装查询结果，只需要将pageInfo交给页面,传入连续显示的页数
		PageInfo page = new PageInfo(list,5);
		return Msg.success().add("pageInfo", page);
	}
	
	/**
	 * 新增员工，先用jsr303后台效验，成功再新增数据
	 * @param employee
	 * @param result
	 * @return
	 */
	@RequestMapping(value = "/emps",method=RequestMethod.POST)
	@ResponseBody
	public Msg saveEmps(@Valid Employee employee,BindingResult result) {
		if (result.hasErrors()){
			Map<String,Object> map = new HashMap<String,Object>();
			//效验失败，应该在模态框中显示效验失败的信息
			List<FieldError> fieldErrors = result.getFieldErrors();
			for (FieldError fieldError : fieldErrors) {
				map.put(fieldError.getField(), fieldError.getDefaultMessage());
			}
			return Msg.fail().add("errorFields", map);
		}else {
			employeeService.saveEmployee(employee);
			return Msg.success();
		}
	}
	/*@RequestMapping(value = "/emps")
	public String getEmps(@RequestParam(value="pn",defaultValue="1")Integer pn,Model model){
		//分页查询，借助PageHelper分页插件
		//在查询之前只需要调用，传入页码，以及每页数据
		PageHelper.startPage(pn, 5);
		List<Employee> list = employeeService.getAll();
		//使用pageInfo包装查询结果，只需要将pageInfo交给页面,传入连续显示的页数
		PageInfo page = new PageInfo(list,5);
		model.addAttribute("pageInfo", page);
		return "list";
	}*/
}

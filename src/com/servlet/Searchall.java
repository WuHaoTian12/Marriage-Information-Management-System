package com.servlet;

import com.dao.UserDao;
import com.dao.impl.UserDaoImpl;
import com.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.plaf.basic.BasicInternalFrameTitlePane;
import java.io.IOException;
import java.util.List;

@WebServlet("/Searchall")
public class Searchall extends HttpServlet{
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("name");
		if(name.equals("")){
			request.getRequestDispatcher("/page/query/queryByName.jsp").forward(request, response);
		}else{
			String res = " UName != '" + request.getSession().getAttribute("uname") + "'" + " and Name = '" + name + "'";
			System.out.println(res);
			UserDao ud = new UserDaoImpl();
			List<User> userAll = ud.getUserAll(res);
			request.setAttribute("userAll", userAll);
			request.getRequestDispatcher("/page/query/queryByName.jsp").forward(request, response);
		}

	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String sex = request.getParameter("sex");
		String age = request.getParameter("age");
		String height = request.getParameter("height");
		String salary = request.getParameter("salary");
		String res = "";
		switch (sex) {
			case "不限":
				res += " sex in ('男', '女')";
				break;
			case "女":
				res += " sex = '女'";
				break;
			case "男":
				res += " sex = '男'";
				break;

		}
		switch (age) {
			case "不限":
				res += "";
				break;
			case "小于20":
				res += " and age < 20";
				break;
			case "20~30":
				res += " and age >= 20 and age < 30";
				break;
			case "30~40":
				res += " and age >= 30 and age < 40";
				break;
			case "40~50":
				res += " and age >= 40 and age <= 50";
				break;
			case "大于50":
				res += " and age >= 50 ";
				break;
		}
		switch (height) {
			case "不限":
				res += "";
				break;
			case "小于150":
				res += " and height < 150";
				break;
			case "150~155":
				res += " and height >= 150 and height < 155";
				break;
			case "155~160":
				res += " and height >= 155 and height < 160";
				break;
			case "160~165":
				res += " and height >= 160 and height < 165";
				break;
			case "165~170":
				res += " and height >= 165 and height < 170";
				break;
			case "170~175":
				res += " and height >= 170 and height < 175";
				break;
			case "175到180":
				res += " and height >= 175 and height < 180";
				break;
			case "180~185":
				res += " and height >= 180 and height < 185";
				break;
			case "185~190":
				res += " and height >= 185 and height <= 190";
				break;
			case "大于190":
				res += " and height > 190";
				break;
		}
		switch (salary) {
			case "不限":
				res += "";
				break;
			case "小于1500":
				res += " and salary < 1500";
				break;
			case "1500~4000":
				res += " and salary >= 1500 and salary < 4000";
				break;
			case "4000~7000":
				res += " and salary >= 4000 and salary < 7000";
				break;
			case "7000~10000":
				res += " and salary >= 7000 and salary < 10000";
				break;
			case "10000~30000":
				res += " and salary >= 10000 and salary <= 30000";
				break;
			case "大于30000":
				res += " and salary > 30000";
				break;
		}
		res += " and UName != '" + request.getSession().getAttribute("uname") + "'";
		System.out.println(res);
		UserDao ud = new UserDaoImpl();
		List<User> userAll = ud.getUserAll(res);
		int count = userAll.size();
		String queryRes = "搜索 性别：" + sex + "，  年龄：" + age + "，  身高：" + height + "，  月薪：" + salary + "，  共计" + count + "条结果";
		request.setAttribute("userAll", userAll);
		request.setAttribute("queryRes", queryRes);
		request.getRequestDispatcher("/page/query/query.jsp").forward(request, response);
	}
}

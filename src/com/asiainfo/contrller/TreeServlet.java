package com.asiainfo.contrller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.asiainfo.service.Service;

/**
 * @author wenhong
 */
public class TreeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");;
		PrintWriter out = response.getWriter();
		String id = request.getParameter("id"); // 父节点编号  
		System.out.println("得到的节点id：" + id);
		Service demo = new Service();
		String json = demo.getJSONData();
		out.print(json);
	}
}

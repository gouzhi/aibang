package com.cifex.framework.generator;

import com.aibang.framework.generator.GeneratorFacade;
import com.aibang.framework.generator.GeneratorProperties;



public class GeneratorMain_zl {


	/**
	 * 请直接修改以下代码调用不同的方法以执行相关生成任务.
	 * 数据库文件在 generator
	 */
	public static void main(String[] args) {
		try {
			GeneratorData(2); //运行这里生成自动代码,1是用sprigmvc模板，2是用ibatis模板生成,2是
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static void GeneratorData(int gType) throws Exception {
		GeneratorFacade g = new GeneratorFacade();

		//g.printAllTableNames(); // 打印数据 库中的表名称
		g.deleteOutRootDir(); // 删除生成器的输出目录
		if (gType == 1) {
			// 通过数据库表生成文件,生成为springmvc为模板的根目录
			g.generateByTable("hjs_user", "springmvc");
		} else {
			//Generator generator=new Generator();
			String[] ssStdd=new String[]{"hjs_act_recharge"};

			for (String string : ssStdd) {
				 g.generateByTable(string, "mybatis");
			}

			//g.generateByAllTable("mybatis");
			//g.generateByTable("hjs_user", "mybatis");
			// 通过数据库表生成文件,生成为ibatis为模板的根目录
			//g.generateByTable("vxcv", "mybatis");
		}
		// 打开文件夹
		Runtime.getRuntime().exec(
				"cmd.exe /c start " + GeneratorProperties.getRequiredProperty("outRoot"));
	}
}

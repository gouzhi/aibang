package com.cifex.framework.utils.excel.export.test;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;

import com.cifex.framework.utils.excel.export.ExcelExportUtil;

public class TestExportExcel extends ExcelExportUtil<User>{

	@Override
	protected String[] getHeaders() {
		List<String> header = new ArrayList<String>();
		header.add("用户名");
		header.add("手机号");
		return header.toArray(new String[header.size()]);
	}

	
	
	@Override
	protected List<String[]> getDataset(List<User> dataList) {
		if (CollectionUtils.isEmpty(dataList)) {
			dataList = new ArrayList<User>();
		}
		User user1 = new User("admin","18615985465");
		User user2 = new User("asdasfdgd","15865646564");
		User user3 = new User("dsfhhhhhhn","16562523225");
		User user4 = new User("ttttttttt","17825245525");
		User user5 = new User("sdddareqwwww","18174854545");
		dataList.add(user5);
		dataList.add(user4);
		dataList.add(user3);
		dataList.add(user2);
		dataList.add(user1);
		List<String[]> dataset = new ArrayList<String[]>();
		if (CollectionUtils.isNotEmpty(dataList)){
			for (int i = 0; i < dataList.size(); i++) {
				User user = dataList.get(i);
				int index = 0;
				String[] rowArray = new String[getHeaders().length];
				rowArray[index++] = user.getUsername();
				rowArray[index++] = user.getMobile();
				dataset.add(rowArray);
			}
		}
		return dataset;
	}
	
}

package com.cifex.business.provider.filter;
 

import com.alibaba.dubbo.common.extension.Activate;
import com.alibaba.dubbo.rpc.Invocation;
import com.alibaba.dubbo.rpc.Invoker;
import com.alibaba.dubbo.rpc.Result;
import com.alibaba.dubbo.rpc.RpcException; 
@Activate
public class ServiceProviderFilter implements com.alibaba.dubbo.rpc.Filter {
 
  	
	 
	@Override
	public Result invoke(Invoker<?> invoker, Invocation invocation)
			throws RpcException {
	    Result result = invoker.invoke(invocation);
	    return result;
	    
	}

}

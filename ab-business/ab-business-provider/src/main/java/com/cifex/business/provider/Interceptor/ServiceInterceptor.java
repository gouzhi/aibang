package com.cifex.business.provider.Interceptor;
 
//@Component
//@Aspect
public class ServiceInterceptor {
	/*
	@Autowired
	private SystemService systemService;
	
	@Pointcut("execution(* com.cifex.service.system.*.*.*(..))")  
    private void systemMethod(){}//定义一个切入点  
      
	@Pointcut("execution(* com.cifex.service.user.*.*.*(..))")  
    private void userMethod(){}//定义一个切入点  
	
	@Around("systemMethod()")  
	public Object doBasicProfiling(ProceedingJoinPoint point) throws Throwable{  
 
       String namespace=point.getTarget().getClass().getName()+"."+point.getSignature().getName();
   
	   if(!systemService.userIsHasAcceptAcessService(point.getArgs()[0].toString(), namespace))
	   {
		   ResultModel rs = new ResultModel();
		   rs.setState("2");
		   rs.setMsg("访问权限验证失败！");
		   return rs;
	   }
	 
	   
	    Object object = point.proceed();//执行该方法  
	    return object;  
	}  
	 */
   /* @Before("systemMethod()")  
    public void doAccessCheck(JoinPoint point){  
       // System.out.println("前置通知");  
    }  
      
    @AfterReturning("systemMethod()")  
    public void doAfter(JoinPoint point, Object returnValue){  
       // System.out.println("后置通知");  
    }  
      
    @After("systemMethod()")  
    public void after(JoinPoint point){  
       // System.out.println("最终通知");  
    }  
      
    @AfterThrowing("systemMethod()")  
    public void doAfterThrow(){  
    }  
      */
   
}

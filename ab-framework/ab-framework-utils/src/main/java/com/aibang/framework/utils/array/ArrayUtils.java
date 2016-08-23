/**    
 * @filename ArrayUtils.java     
 * @version www.cifex.com.cn    
 * @date 2015年9月6日     
 */
package com.aibang.framework.utils.array;

import java.util.Set;
import java.util.TreeSet;

/**      
 * 数组工具类 
 * @author zeng.fangfang    
 * @date 2015年9月6日   
 */
public class ArrayUtils {

	/**
	 * 数组合并
	 * @param arr 需要合并的数组
	 * @return Object[]
	 * @author zeng.fangfang
	 * @date 2015年9月6日
	 */
	public static Object[] merge(Integer[]... arr) {
        Set<Integer> set = new TreeSet<Integer>();
        for (Integer[] integers : arr) {
            for (Integer integer : integers) {
                set.add(integer);
            }
        }
        String[] strArrays = new String[set.size()];
        int i = 0;
        for (Integer integer : set) {
            strArrays[i++] = integer.toString();
        }
        return  strArrays;
    }
	
	/**
	 * 将string类型的数组转化为integer类型的数组
	 * @param arr string类型数组
	 * @return Integer[]
	 * @author zeng.fangfang
	 * @date 2015年9月6日
	 */
	public static Integer[] transforIntegers(String[] arr){
		Integer[] integers = new Integer[arr.length];
		for (int i = 0; i < arr.length; i++) {
			integers[i] = Integer.valueOf(arr[i]);
		}
		return integers;
	}
}

package com.cifex.framework.utils;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * 不同概率抽奖工具
 * @classname LotteryUtil    
 * @description 不同概率抽奖工具 
 * @author liuj    
 * @date 2016年5月13日
 */
public class LotteryUtils {
	/**
	 * 抽奖计算
	 * 概率允许大于1
	 * 需要包括未中奖概率
	 * @methodname lottery   
	 * @discription  抽奖
	 * @param orignalRates 概率顺序与奖品顺序必须一致
	 * @return int 奖品顺序
	 * @author liuj
	 * @date 2016年5月13日
	 */
    public static int lottery(List<Double> orignalRates) {
        if (orignalRates == null || orignalRates.isEmpty()) {
            return -1;
        }
        int size = orignalRates.size();
        double sumRate = 0d;
        for (double rate : orignalRates) {
            sumRate += rate;
        }
        List<Double> orignalRatesSort = new ArrayList<Double>(size);
        Double tempSumRate = 0d;
        for (double rate : orignalRates) {
            tempSumRate += rate;
            orignalRatesSort.add(tempSumRate / sumRate);
        }
        double nextDouble = Math.random();
        orignalRatesSort.add(nextDouble);
        Collections.sort(orignalRatesSort);
        return orignalRatesSort.indexOf(nextDouble);
    } 
}

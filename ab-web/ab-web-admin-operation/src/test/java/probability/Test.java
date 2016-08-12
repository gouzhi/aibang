package probability;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import com.cifex.framework.utils.BigDecimalUtils;

public class Test {
	
	public static void main(String[] args) {
		List<Prize> prizes = new ArrayList<Prize>();
		Prize prize1 = new Prize();
		prize1.setPrizeId(1);
		prize1.setProbability(new BigDecimal(0.05));
		prize1.setQuantity(1);
		prizes.add(prize1);
		
		Prize prize2 = new Prize();
		prize2.setPrizeId(2);
		prize2.setProbability(new BigDecimal(0.1));
		prize2.setQuantity(10);
		prizes.add(prize2);
		
		Prize prize3 = new Prize();
		prize3.setPrizeId(3);
		prize3.setProbability(new BigDecimal(0.15));
		prize3.setQuantity(50);
		prizes.add(prize3);
		
		Prize prize4 = new Prize();
		prize4.setPrizeId(4);
		prize4.setProbability(new BigDecimal(0.2));
		prize4.setQuantity(50);
		prizes.add(prize4);
		
		Prize prize5 = new Prize();
		prize5.setPrizeId(5);
		prize5.setProbability(new BigDecimal(0.5));
		prize5.setQuantity(200);
		prizes.add(prize5);
		
		int prize1GetTimes = 0;
		int prize2GetTimes = 0;
		int prize3GetTimes = 0;
		int prize4GetTimes = 0;
		int prize5GetTimes = 0;
		Arithmetic arithmetic = new Arithmetic();
		int times = 10000000;
		for(int i = 0;i<times; i++){
			int prizeId = arithmetic.pay(prizes);
			switch (prizeId){
			case 1:
				prize1GetTimes++;
				break;
			case 2:
				prize2GetTimes++;
				break;
			case 3:
				prize3GetTimes++;
				break;
			case 4:
				prize4GetTimes++;
				break;
			case 5:
				prize1GetTimes++;
				break;
			}
		}
		System.out.println("抽奖次数" + times);
		System.out.println("prize1中奖次数" + prize1GetTimes + "-----0.05----概率" + BigDecimalUtils.div(new BigDecimal(prize1GetTimes), new BigDecimal(times),2));
		System.out.println("prize2中奖次数" + prize2GetTimes + "-----0.10----概率" + BigDecimalUtils.div(new BigDecimal(prize2GetTimes), new BigDecimal(times),2));
		System.out.println("prize3中奖次数" + prize3GetTimes + "-----0.15----概率" + BigDecimalUtils.div(new BigDecimal(prize3GetTimes), new BigDecimal(times),2));
		System.out.println("prize4中奖次数" + prize4GetTimes + "-----0.20----概率" + BigDecimalUtils.div(new BigDecimal(prize4GetTimes), new BigDecimal(times),2));
		System.out.println("prize5中奖次数" + prize5GetTimes + "-----0.50----概率" + BigDecimalUtils.div(new BigDecimal(prize5GetTimes), new BigDecimal(times),2));
		
	}
}

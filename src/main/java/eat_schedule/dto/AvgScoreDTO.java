package eat_schedule.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AvgScoreDTO {
	
	private int store_seq;
	private double avg_score;
	private int count;
	
	public void setCount(int count) {
		this.count = count;
	}
	public void setStore_seq(int store_seq) {
		this.store_seq = store_seq;
	}
	public void setAvg_score(double avg_score) {
		this.avg_score = avg_score;
	}	
}

package safezone.project.component;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ApplyRecommendDTO {
	private int num;
	private int apply_num;
	private String email;
	private Timestamp created_at;
}

package safezone.project.component;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ApplyDTO {
	private int apply_num;
	private String email;
	private String category;
	private String address;
	private Timestamp created_at;
	private int recommend;
}

package safezone.project.component;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class CommuDTO {
	private int commu_num;
    private int location_num; //서울 오름차순1~25
    private int category; //고장1 위험2 기타3
    private String email;
    private String title;
    private String content;
    private String img1;
    private String img2;
    private String img3;
    private String img4;
    private String img5;
    private Timestamp created_at;
    private Timestamp modify_at;
    private int statu; // 노출0 비노출1
    private int complain; //
    private int pageNum=1;
}

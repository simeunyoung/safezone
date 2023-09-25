package safezone.project.component;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class UserDTO {
    private String email;
    private String pw;
    private String name;
    private String birth;
    private int gender; // 1남자 2여자
    private String tel; //본인 연락처
    private String emg_tel; //긴급연락망
    private int statu; //1활성 2정지 default 1
    private Timestamp created_at; //가입일
}

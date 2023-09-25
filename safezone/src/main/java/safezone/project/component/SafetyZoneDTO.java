package safezone.project.component;

import lombok.Data;

@Data
public class SafetyZoneDTO {
	private int objt_id;
    private String police; //경찰청
    private String polcsttn; //경찰서
    private String fclty_ty; //시설유형
    private int fclty_cd; //시설코드
    private String fclty_nm; //시설명
    private String adres; //지번주소
    private String rn_adres; //도로명주소
    private String telno; //전화번호
    private int ctprvn_cd; //시도코드
    private int sgg_cd; //시군구코드
    private String lat; //위도
    private String lon; //경도
    private double distance;
}

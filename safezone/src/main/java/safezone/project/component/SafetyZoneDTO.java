package safezone.project.component;

import lombok.Data;

@Data
public class SafetyZoneDTO {
	private int OBJT_ID;
    private String POLICE; //경찰청
    private String POLCSTTN; //경찰서
    private String FCLTY_TY; //시설유형
    private int FCLTY_CD; //시설코드
    private String FCLTY_NM; //시설명
    private String ADRES; //지번주소
    private String RN_ADRES; //도로명주소
    private String TELNO; //전화번호
    private int CTPRVN_CD; //시도코드
    private int SGG_CD; //시군구코드
    private String LAT; //위도
    private String LON; //경도
}

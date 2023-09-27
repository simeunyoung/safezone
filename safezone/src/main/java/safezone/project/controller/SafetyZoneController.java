package safezone.project.controller;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.osgeo.proj4j.CRSFactory;
import org.osgeo.proj4j.CoordinateReferenceSystem;
import org.osgeo.proj4j.CoordinateTransform;
import org.osgeo.proj4j.CoordinateTransformFactory;
import org.osgeo.proj4j.ProjCoordinate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import safezone.project.component.SafetyZoneDTO;
import safezone.project.service.HaversineDAO;
import safezone.project.service.SafetyZoneService;

@Controller
@RequestMapping("/safety/*")
public class SafetyZoneController {
	
	@Autowired
	private SafetyZoneService service;
	
	@Autowired
	private HaversineDAO dao;
    
	@RequestMapping("/safety")
	public void safety() {
	    try {
	        // URL 연결 설정
	        String apiUrl = "https://safemap.go.kr/openApiService/data/getSecurityFacilityData.do?serviceKey=OV7F8ARI-OV7F-OV7F-OV7F-OV7F8ARIC9&pageNo=1&numOfRows=100000&dataType=xml";
	        URL url = new URL(apiUrl);
	        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
	        
	        // 연결 설정
	        connection.setRequestMethod("GET");
	        connection.setRequestProperty("Accept", "application/xml");
	        
	        // XML 데이터 읽기
	        InputStream inputStream = connection.getInputStream();
	        InputStreamReader inputStreamReader = new InputStreamReader(inputStream);
	        BufferedReader reader = new BufferedReader(inputStreamReader);
	        StringBuilder xmlData = new StringBuilder();
	        String line;
	        while ((line = reader.readLine()) != null) {
	            xmlData.append(line);
	        }
	        reader.close();
	        
	        // XML 파서 설정
	        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
	        DocumentBuilder builder = factory.newDocumentBuilder();
	        
	        // XML 데이터를 파싱하여 Document 객체로 읽어옴
	        Document document = builder.parse(new InputSource(new StringReader(xmlData.toString())));
	        
	        // <item> 엘리먼트를 찾아서 데이터 추출
	        NodeList itemList = document.getElementsByTagName("item");
	        for (int i = 0; i < itemList.getLength(); i++) {
	            Element item = (Element) itemList.item(i);
	            int OBJT_ID = Integer.parseInt(item.getElementsByTagName("OBJT_ID").item(0).getTextContent());
	            String POLICE = item.getElementsByTagName("POLICE").item(0).getTextContent();
	            String POLCSTTN = item.getElementsByTagName("POLCSTTN").item(0).getTextContent();
	            String FCLTY_TY = item.getElementsByTagName("FCLTY_TY").item(0).getTextContent();
	            int FCLTY_CD = Integer.parseInt(item.getElementsByTagName("FCLTY_CD").item(0).getTextContent());
	            String FCLTY_NM = item.getElementsByTagName("FCLTY_NM").item(0).getTextContent();
	            String ADRES = item.getElementsByTagName("ADRES").item(0).getTextContent();
	            String RN_ADRES = item.getElementsByTagName("RN_ADRES").item(0).getTextContent();
	            String TELNO = item.getElementsByTagName("TELNO").item(0).getTextContent();
	            int CTPRVN_CD = Integer.parseInt(item.getElementsByTagName("CTPRVN_CD").item(0).getTextContent());
	            int SGG_CD = Integer.parseInt(item.getElementsByTagName("SGG_CD").item(0).getTextContent());
	            String X = item.getElementsByTagName("X").item(0).getTextContent();
	            String Y = item.getElementsByTagName("Y").item(0).getTextContent();
	            
	            // 추출한 데이터를 활용하거나 저장하려면 이 부분에 필요한 코드를 추가
	            if (CTPRVN_CD == 11) {
	                // 예시: 추출한 데이터 출력
	                System.out.println("OBJT_ID: " + OBJT_ID);
	                System.out.println("경찰청: " + POLICE);
	                System.out.println("경찰서: " + POLCSTTN);
	                System.out.println("시설유형: " + FCLTY_TY);
	                System.out.println("시설명: " + FCLTY_NM);
	                System.out.println("지번주소: " + ADRES);
	                System.out.println("도로명주소: " + RN_ADRES);
	                System.out.println("전화번호: " + TELNO);
	                System.out.println("시도코드: " + CTPRVN_CD);
	                System.out.println("시군구코드: " + SGG_CD);
	                System.out.println("lat: " + X);
	                System.out.println("lon: " + Y);
	                System.out.println("--------------------");
	                
	                // dto에 저장
//	                SafetyZoneDTO safetyZoneDTO = new SafetyZoneDTO();
//	                safetyZoneDTO.setOBJT_ID(OBJT_ID);
//	                safetyZoneDTO.setPOLICE(POLICE);
//	                safetyZoneDTO.setPOLCSTTN(POLCSTTN);
//	                safetyZoneDTO.setFCLTY_TY(FCLTY_TY);
//	                safetyZoneDTO.setFCLTY_CD(FCLTY_CD);
//	                safetyZoneDTO.setFCLTY_NM(FCLTY_NM);
//	                safetyZoneDTO.setADRES(ADRES);
//	                safetyZoneDTO.setRN_ADRES(RN_ADRES);
//	                safetyZoneDTO.setTELNO(TELNO);
//	                safetyZoneDTO.setCTPRVN_CD(CTPRVN_CD);
//	                safetyZoneDTO.setSGG_CD(SGG_CD);
//	                safetyZoneDTO.setLAT(X);
//	                safetyZoneDTO.setLON(Y);
//	                
//	                
//	                service.insertSafetyZone(safetyZoneDTO);
//	                
//	                System.out.println(safetyZoneDTO.getLON());
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
    
    @RequestMapping("/safelist2")
	// 주어진 지점과 경계 상자로부터 일정 반경(단위: km) 내의 위도와 경도 범위를 계산합니다.
    public @ResponseBody List<SafetyZoneDTO> radius2(double lat, double lon) {
    	double radius = 3; // 반경 500m (단위: km)

		List<Double> bounds = new ArrayList<>();
		bounds = dao.radius(lat, lon, radius);
		double minLat = bounds.get(0);
		double maxLat = bounds.get(1);
		double minLng = bounds.get(2);
		double maxLng = bounds.get(3);
		System.out.println(lat+"//"+lon);
		System.out.println(minLat+"//"+maxLat+"//"+minLng+"//"+maxLng);
    	
		List<SafetyZoneDTO> list = service.getSafeList(minLat,maxLat,minLng,maxLng);
		System.out.println("list:"+list.toString());
        return list;
    }
    
    @RequestMapping("/safelist")
	// 주어진 지점과 경계 상자로부터 일정 반경(단위: km) 내의 위도와 경도 범위를 계산합니다.
    public @ResponseBody List<SafetyZoneDTO> radius(double lat, double lon) {
    	double distance = 3; // 반경 500m (단위: km)

		List<SafetyZoneDTO> list = service.getList(lat,lon,distance);
		System.out.println("list:"+list.toString());
        return list;
    }
    
    public Map<String, Double> lat(double x, double y) {
        // UTM 좌표계를 위한 EPSG 코드 (한국 UTM Zone 52N)
        String utmEpsgCode = "EPSG:3857";
        
        // WGS 84 (위도, 경도) 좌표계를 위한 EPSG 코드
        String wgs84EpsgCode = "EPSG:4326";
        Map<String, Double> rs = new HashMap<>();
        try {
            // 좌표 변환을 위한 좌표계 객체 생성
            CRSFactory crsFactory = new CRSFactory();
            CoordinateReferenceSystem utmCrs = crsFactory.createFromName(utmEpsgCode);
            CoordinateReferenceSystem wgs84Crs = crsFactory.createFromName(wgs84EpsgCode);

            // 좌표 변환기 생성
            CoordinateTransformFactory ctFactory = new CoordinateTransformFactory();
            CoordinateTransform transform = ctFactory.createTransform(utmCrs, wgs84Crs);

            // UTM 좌표를 위도와 경도로 변환
            ProjCoordinate utmCoord = new ProjCoordinate(x, y);
            ProjCoordinate wgs84Coord = new ProjCoordinate();
            transform.transform(utmCoord, wgs84Coord);

            double latitude = wgs84Coord.y;
            double longitude = wgs84Coord.x;

            System.out.println("위도: " + latitude);
            System.out.println("경도: " + longitude);
            
            
            rs.put("lat", latitude);
            rs.put("lng", longitude);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }
    public Map<String, Double> xy(String code, double v1, double v2) {
        double DEGRAD = Math.PI / 180.0;
        double RADDEG = 180.0 / Math.PI;
        double RE = 6371.00877; // 지구 반경(km)
        double GRID = 5.0; // 격자 간격(km)
        double SLAT1 = 30.0; // 투영 위도1(degree)
        double SLAT2 = 60.0; // 투영 위도2(degree)
        double OLON = 126.0; // 기준점 경도(degree)
        double OLAT = 38.0; // 기준점 위도(degree)
        double XO = 43; // 기준점 X좌표(GRID)
        double YO = 136; // 기1준점 Y좌표(GRID)


        double re = RE / GRID;
        double slat1 = SLAT1 * DEGRAD;
        double slat2 = SLAT2 * DEGRAD;
        double olon = OLON * DEGRAD;
        double olat = OLAT * DEGRAD;

        double sn = Math.tan(Math.PI * 0.25 + slat2 * 0.5) / Math.tan(Math.PI * 0.25 + slat1 * 0.5);
        sn = Math.log(Math.cos(slat1) / Math.cos(slat2)) / Math.log(sn);
        double sf = Math.tan(Math.PI * 0.25 + slat1 * 0.5);
        sf = Math.pow(sf, sn) * Math.cos(slat1) / sn;
        double ro = Math.tan(Math.PI * 0.25 + olat * 0.5);
        ro = re * sf / Math.pow(ro, sn);
        Map<String, Double> rs = new HashMap<>();

        if (code.equals("toXY")) {
            rs.put("lat", v1);
            rs.put("lng", v2);
            double ra = Math.tan(Math.PI * 0.25 + (v1) * DEGRAD * 0.5);
            ra = re * sf / Math.pow(ra, sn);
            double theta = v2 * DEGRAD - olon;
            if (theta > Math.PI) theta -= 2.0 * Math.PI;
            if (theta < -Math.PI) theta += 2.0 * Math.PI;
            theta *= sn;
            rs.put("x", Math.floor(ra * Math.sin(theta) + XO + 0.5));
            rs.put("y", Math.floor(ro - ra * Math.cos(theta) + YO + 0.5));
        } else {
            rs.put("x", v1);
            rs.put("y", v2);
            double xn = v1 - XO;
            double yn = ro - v2 + YO;
            double ra = Math.sqrt(xn * xn + yn * yn);
            if (sn < 0.0) ra *= -1.0;
            double alat = Math.pow((re * sf / ra), (1.0 / sn));
            alat = 2.0 * Math.atan(alat) - Math.PI * 0.5;

            double theta;
            if (Math.abs(xn) <= 0.0) {
                theta = 0.0;
            } else {
                if (Math.abs(yn) <= 0.0) {
                    theta = Math.PI * 0.5;
                    if (xn < 0.0) theta *= -1.0;
                } else {
                    theta = Math.atan2(xn, yn);
                }
            }
            double alon = theta / sn + olon;
            rs.put("lat", alat * RADDEG);
            rs.put("lng", alon * RADDEG);
        }
        return rs;
    }
}

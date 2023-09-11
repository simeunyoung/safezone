package safezone.project.controller;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLDecoder;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import safezone.project.component.SafetyZoneDTO;
import safezone.project.service.SafetyZoneService;

@Controller
@RequestMapping("/safety/*")
public class SafetyZoneController {
	
	@Autowired
	private SafetyZoneService service;
    
    @RequestMapping("safety")
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
                if (CTPRVN_CD==11) {
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
                    System.out.println("X: " + X);
                    System.out.println("Y: " + Y);
                    System.out.println("--------------------");
                    
                    //dto에 저장
                    SafetyZoneDTO safetyZoneDTO = new SafetyZoneDTO();
                    safetyZoneDTO.setOBJT_ID(OBJT_ID);
                    safetyZoneDTO.setPOLICE(POLICE);
                    safetyZoneDTO.setPOLCSTTN(POLCSTTN);
                    safetyZoneDTO.setFCLTY_TY(FCLTY_TY);
                    safetyZoneDTO.setFCLTY_CD(FCLTY_CD);
                    safetyZoneDTO.setFCLTY_NM(FCLTY_NM);
                    safetyZoneDTO.setADRES(ADRES);
                    safetyZoneDTO.setRN_ADRES(RN_ADRES);
                    safetyZoneDTO.setTELNO(TELNO);
                    safetyZoneDTO.setCTPRVN_CD(CTPRVN_CD);
                    safetyZoneDTO.setSGG_CD(SGG_CD);
                    safetyZoneDTO.setX(X);
                    safetyZoneDTO.setY(Y);
                    
                    service.insertSafetyZone(safetyZoneDTO);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    @RequestMapping("a")
    public void a() {
    	 try {
    	        // URL 연결 설정
    		 	String API_SERVICE_KEY = "EnK87IvfGL76L5RedRI0tt0G0S78JfDdMtOuDsR6UBFaqbVEIaPtSPXWiT8fjOFrWokmmvcZ9CQJW+/X6IojIA==";
    		 	//URLDecoder.decode(API_SERVICE_KEY, "UTF-8");
    	        String apiUrl = "http://api.data.go.kr/openapi/tn_pubr_public_female_safety_prtchouse_api?serviceKey="+API_SERVICE_KEY+"&pageNo=1&numOfRows=100&type=xml";
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

    	        // XML 데이터 그대로 출력
    	        System.out.println(xmlData.toString());
    	    } catch (Exception e) {
    	        e.printStackTrace();
    	    }
    }
}

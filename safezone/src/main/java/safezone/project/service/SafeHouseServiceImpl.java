package safezone.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

import safezone.project.compoent.SafeHouseDTO;
import safezone.project.mapper.SafeHouseMapper;

@Service
public class SafeHouseServiceImpl implements SafeHouseService{

	@Autowired
	private SafeHouseMapper mapper;
	
	public List<SafeHouseDTO> getHouseList(double latitude, double longitude) {
	
		// 반경 500m 안의 경도, 위도 범위 계산
		double earthRadius = 6371; // 지구 반지름 (단위: km)
		double radius = 3; // 반경 500m (단위: km)

		// 위도 범위 계산
		double minLat = latitude - (radius / earthRadius) * (180 / Math.PI);
		double maxLat = latitude + (radius / earthRadius) * (180 / Math.PI);

		// 경도 범위 계산 (경도는 위도에 따라 범위가 다를 수 있음)
		double minLng = longitude - (radius / earthRadius) * (180 / Math.PI) / Math.cos(latitude * Math.PI / 180);
		double maxLng = longitude + (radius / earthRadius) * (180 / Math.PI) / Math.cos(latitude * Math.PI / 180);
		
		System.out.println(latitude+"//"+longitude);
		System.out.println(minLat+"//"+maxLat+"//"+minLng+"//"+maxLng);
		
	  return mapper.getHouseList(minLat, maxLat, minLng, maxLng);
	};

		    
	public void insert() {
		 try {
	            // DocumentBuilderFactory 생성
	            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
	            DocumentBuilder builder = factory.newDocumentBuilder();
	            
	            // XML 데이터 가져오기
	            Document document = builder.parse("http://api.data.go.kr/openapi/tn_pubr_public_female_safety_prtchouse_api?serviceKey=Xdf1Yk4cuGbHJdTvS%2B0gKCJaBMlmhhg2fXIru8%2B2EeDdxJ%2FVOkh3xK9ASBpiEI1PaDL6ZuiEoCefSCDHgEyC5g%3D%3D&numOfRows=3000");

	            // <item> 엘리먼트들을 가져오기
	            NodeList itemList = document.getElementsByTagName("item");

	            // 각각의 <item> 엘리먼트 파싱
	            for (int i = 0; i < itemList.getLength(); i++) {
	            	Element item = (Element) itemList.item(i);
	            	
		            	if(item.getElementsByTagName("ctprvnNm").item(0).getTextContent().equals("서울특별시")) {
		            		SafeHouseDTO safeHouse = new SafeHouseDTO();
		 	                safeHouse.setStorNm(item.getElementsByTagName("storNm").item(0).getTextContent());
		 	                safeHouse.setSignguCode(item.getElementsByTagName("signguCode").item(0).getTextContent());
		 	                safeHouse.setRdnmadr(item.getElementsByTagName("rdnmadr").item(0).getTextContent());
		 	                safeHouse.setLnmadr(item.getElementsByTagName("lnmadr").item(0).getTextContent());
		 	                safeHouse.setLatitude(item.getElementsByTagName("latitude").item(0).getTextContent());
		 	                safeHouse.setLongitude(item.getElementsByTagName("longitude").item(0).getTextContent());
		 	                safeHouse.setPhoneNumber(item.getElementsByTagName("phoneNumber").item(0).getTextContent());
		 	                safeHouse.setCmptncPolcsttnNm(item.getElementsByTagName("cmptncPolcsttnNm").item(0).getTextContent());
		 	                safeHouse.setUseYn(item.getElementsByTagName("useYn").item(0).getTextContent());
		 	                safeHouse.setReferenceDate(item.getElementsByTagName("referenceDate").item(0).getTextContent());
		 	                safeHouse.setInsttCode(item.getElementsByTagName("insttCode").item(0).getTextContent());
		 	                
//		 	               mapper.insert(safeHouse);
		            	}
	    
	            }
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	}
	
}

package safezone.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

import safezone.project.component.SafeHouseDTO;
import safezone.project.mapper.SafeHouseMapper;

@Service
public class SafeHouseServiceImpl implements SafeHouseService{

	@Autowired
	private SafeHouseMapper mapper;
	
	public List<SafeHouseDTO> getHouseList(double latitude, double longitude, double distance) {
	  return mapper.getHouseList(latitude, longitude, distance);
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

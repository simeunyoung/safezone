package safezone.project.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
public class BellServiceImpl implements BellService{
	
	@Value("${bellkey}")
    private String bellApiKey;
	
	@Override
	public void bellApi() {	
		StringBuilder strBuilder = new StringBuilder("http://safemap.go.kr/openApiService/data/getCmmpoiEmgbellData.do"); /*URL*/
		try {
			strBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=서비스키"); /*Service Key*/
			strBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
			strBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
			strBuilder.append("&" + URLEncoder.encode("type","UTF-8") + "=" + URLEncoder.encode("xml", "UTF-8")); /*xml(기본값), JSON*/
			URL url = new URL(strBuilder.toString());
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			
			System.out.println("디버깅 "+bellApiKey+" 그리고 url"+url);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}
}

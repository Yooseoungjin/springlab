package com.kbstar.util;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.w3c.dom.*;
import org.xml.sax.InputSource;

import javax.xml.parsers.*;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

public class Name {
    @RequestMapping("/namexml")
    public static Object namexml() throws Exception {
        // name 리스트 담을 제이슨어레이 새성
        JSONArray list = new JSONArray();
        for (int j = 0; j < 70; j += 1) {
            String page = Integer.toString(j);

            StringBuilder urlBuilder = new StringBuilder("https://search.i815.or.kr/openApiData.do?type=4");
            urlBuilder.append("&" + URLEncoder.encode("page", "UTF-8") + "=" + URLEncoder.encode(page, "UTF-8")); /*페이지번호 Default : 10*/
            URL url = new URL(urlBuilder.toString());
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("Content-type", "application/xml");
//            System.out.println("Response code: " + conn.getResponseCode());
            BufferedReader rd;
            if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
                rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            } else {
                rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
            }
            StringBuilder sb = new StringBuilder();
            String line;
            while ((line = rd.readLine()) != null) {
                sb.append(line);
            }
            rd.close();
            conn.disconnect();

            // URL 연결 및 XML 데이터 로드
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder builder = factory.newDocumentBuilder();
            Document document = builder.parse(new InputSource(new StringReader(sb.toString())));
            ;
            try {
                // 루트 요소 가져오기
                Element root = document.getDocumentElement();
                // <name> 요소 가져오기
                NodeList nodeList = root.getElementsByTagName("name");
                for (int i = 0; i < nodeList.getLength(); i += 1) {
                    Element nameElement = (Element) nodeList.item(i);
                    String nameValue = nameElement.getTextContent();
                    list.add(nameValue);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return list;

    }
}



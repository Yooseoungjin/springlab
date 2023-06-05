package com.kbstar.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

@Slf4j
@RestController
public class TodayFlowerController {

    @RequestMapping("/test")
    public static Object todayFlower() throws Exception {
        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1390804/NihhsTodayFlowerInfo01/selectTodayFlowerView01"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=pjrhqznAcan%2BfGEt6ZOzTLTu1UTfsBUzGvSxse5KrCwMQTu7N55A6ii6XBaMEP3HsdUSZfZ1B9jhOOgjYVsVHQ%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("dataNo", "UTF-8") + "=" + URLEncoder.encode("366", "UTF-8")); /*오늘의 꽃 인덱스*/
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
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
        System.out.println(sb.toString());
        return sb;


    }

}

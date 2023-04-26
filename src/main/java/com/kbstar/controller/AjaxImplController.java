package com.kbstar.controller;

import com.kbstar.dto.Cust;
import com.kbstar.dto.Marker;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

@RestController
public class AjaxImplController {
    @RequestMapping("/getservertime")
    public Object getservertime(){
      Date date = new Date();
      return date;
    };

    @RequestMapping("/checkid")
    public Object checkid(String id){
        int result = 0;
        if(id.equals("qqqq")||id.equals("aaaa")||id.equals("ssss")){
            result =1;
        }
        return result;
    };

    @RequestMapping("/getdata")
    public Object getdata(){
        List<Cust> list = new ArrayList<>();
        list.add(new Cust("id01","pwd01","james1"));
        list.add(new Cust("id02","pwd02","james2"));
        list.add(new Cust("id03","pwd03","james3"));
        list.add(new Cust("id04","pwd04","james4"));
        list.add(new Cust("id05","pwd05","james5"));
        list.add(new Cust("id06","pwd06","james6"));

        // JSON Object ----> JSON
        // JSON(JavaScript Object Natation)
        // [{},{},{},.......]
        JSONArray ja = new JSONArray();
        for(Cust obj:list){
            JSONObject jo = new JSONObject();
            Random r = new Random();
            int i = r.nextInt(100)+1;
            jo.put("id",obj.getId());
            jo.put("pwd",obj.getPwd());
            jo.put("name",obj.getName()+i);
;           ja.add(jo);
        }
        return ja;
    };
    @RequestMapping("/markers")
    public Object markers(String loc){
        List<Marker> list = new ArrayList<>();
        if(loc.equals("s")){
            list.add(new Marker(100,"밥플러스","http://www.nate.com",37.5215695,126.9244115,"a.jpg","s"));
            list.add(new Marker(101,"제주국수","http://www.naver.com",37.5215695,126.9245115,"b.jpg","s"));
            list.add(new Marker(102,"담미온","http://www.daum.com",37.5215695,126.92430155,"c.jpg","s"));
        }else if(loc.equals("b")){
            list.add(new Marker(103,"밥플러스","http://www.nate.com",37.557527,126.9234669,"a.jpg","b"));
            list.add(new Marker(104,"제주국수","http://www.naver.com",37.557527,126.9254669,"b.jpg","b"));
            list.add(new Marker(105,"담미온","http://www.daum.com",37.557527,126.9246669,"c.jpg","b"));
        }else if(loc.equals("j")){
            list.add(new Marker(100,"밥플러스","http://www.nate.com",33.4853707,126.4825713,"a.jpg","j"));
            list.add(new Marker(101,"제주국수","http://www.naver.com",33.4853707,126.4835713,"b.jpg","j"));
            list.add(new Marker(102,"담미온","http://www.daum.com",33.4853707,126.4855713,"c.jpg","j"));
        }

        JSONArray ja = new JSONArray();
        for(Marker obj:list){
            JSONObject jo = new JSONObject();
            jo.put("id",obj.getId());
            jo.put("title",obj.getTitle());
            jo.put("target",obj.getTarget());
            jo.put("lat",obj.getLat());
            jo.put("lng",obj.getLng());
            jo.put("img",obj.getImg());
            jo.put("loc",obj.getLoc());
            ja.add(jo);
        }
        return ja;
    }


}

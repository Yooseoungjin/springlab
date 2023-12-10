package com.kbstar.controller;

import com.kbstar.dto.Ncp;
import com.kbstar.util.*;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

@Slf4j
@Controller
public class NcpController {


    @Autowired
    CFRCelebrityUtil cfrCelebrityUtil;
    @Value("${uploadimgdir}")
    String imgpath;
    @RequestMapping("/cfr1impl")
    public String cfr1impl(Model model, Ncp ncp) throws ParseException {
        //이미지를 저장한다.
        FileUploadUtil.saveFile(ncp.getImg(),imgpath);

        //NPC에게 물어본다
        String imgname = ncp.getImg().getOriginalFilename();
        JSONObject result =
                (JSONObject) cfrCelebrityUtil.getResult(imgpath,imgname);
        log.info(result.toJSONString());

        JSONArray faces = (JSONArray)result.get("faces");
        JSONObject obj = (JSONObject)faces.get(0);
        JSONObject celebrity = (JSONObject)obj.get("celebrity");
        String value = (String)celebrity.get("value");

        //결과를 받는다.
        model.addAttribute("result",value);
        model.addAttribute("center","cfr1");
        return "index";
    }

    @RequestMapping("/cfr2impl")
    public String cfr2impl(Model model, Ncp ncp) throws ParseException {
        //이미지를 저장한다.
        FileUploadUtil.saveFile(ncp.getImg(),imgpath);

        //Ncp에게 물어본다
        String imgname = ncp.getImg().getOriginalFilename();
        JSONObject result =
                (JSONObject) CFRFaceUtil.getResult(imgpath,imgname);
        log.info(result.toJSONString());

        //일단 선언하자
        String emotion_value = "";
        String gender_value = "";
        String pose_value = "";
        String age_value = "";

        JSONArray faces = (JSONArray)result.get("faces");
        JSONObject obj = (JSONObject)faces.get(0);

        JSONObject gender = (JSONObject)obj.get("gender");
        gender_value = (String)gender.get("value");

        JSONObject age = (JSONObject)obj.get("age");
        age_value = (String)age.get("value");

        JSONObject emotion = (JSONObject)obj.get("emotion");
        emotion_value = (String)emotion.get("value");

        JSONObject pose = (JSONObject)obj.get("pose");
        pose_value = (String)pose.get("value");

        Map<String,String> map = new HashMap<>();
        map.put("gender",gender_value);
        map.put("age",age_value);
        map.put("emotion",emotion_value);
        map.put("pose",pose_value);

        //결과를 받는다.
        model.addAttribute("result",map);
        model.addAttribute("center","cfr2");
        return "index";
    }
//    @RequestMapping("/yourflower")
//    public String yourflower(Model model, String imgname) throws ParseException {
//
//        //Ncp에게 물어본다
//
//        JSONObject result =
//                (JSONObject) CFRFaceUtil.getResult(imgpath,imgname);
//        log.info(result.toJSONString());
//
//        //일단 선언하자
//        String emotion_value = "";
//        String gender_value = "";
//        String pose_value = "";
//        String age_value = "";
//
//        JSONArray faces = (JSONArray)result.get("faces");
//        JSONObject obj = (JSONObject)faces.get(0);
//
//        JSONObject gender = (JSONObject)obj.get("gender");
//        gender_value = (String)gender.get("value");
//
//        JSONObject age = (JSONObject)obj.get("age");
//        age_value = (String)age.get("value");
//
//        JSONObject emotion = (JSONObject)obj.get("emotion");
//        emotion_value = (String)emotion.get("value");
//
//        JSONObject pose = (JSONObject)obj.get("pose");
//        pose_value = (String)pose.get("value");
//
//        Map<String,String> map = new HashMap<>();
//        map.put("gender",gender_value);
//        map.put("age",age_value);
//        map.put("emotion",emotion_value);
//        map.put("pose",pose_value);
//
//        //결과를 받는다.
//        model.addAttribute("result",map);
//        model.addAttribute("center","yourflower");
//        return "index";
//    }
    @RequestMapping("/mycfr")
    public String mycfr(Model model, String imgname) throws Exception {

        //Ncp에게 물어본다

        JSONObject result =
                (JSONObject) CFRFaceUtil.getResult(imgpath,imgname);
        log.info(result.toJSONString());

        //일단 선언하자
        String emotion_value = "";
        String gender_value = "";
        String pose_value = "";
        String age_value = "";

        JSONArray faces = (JSONArray)result.get("faces");
        JSONObject obj = (JSONObject)faces.get(0);

        JSONObject gender = (JSONObject)obj.get("gender");
        gender_value = (String)gender.get("value");

        JSONObject age = (JSONObject)obj.get("age");
        age_value = (String)age.get("value");

        JSONObject emotion = (JSONObject)obj.get("emotion");
        emotion_value = (String)emotion.get("value");

        JSONObject pose = (JSONObject)obj.get("pose");
        pose_value = (String)pose.get("value");

        Map<String,String> map = new HashMap<>();
        map.put("gender",gender_value);
        map.put("age",age_value);
        map.put("emotion",emotion_value);
        map.put("pose",pose_value);

        //결과를 받는다.
        model.addAttribute("result",map);
        model.addAttribute("center","pic");

        //NPC에게 물어본다
        JSONObject result2 =
                (JSONObject) cfrCelebrityUtil.getResult(imgpath,imgname);

        JSONArray faces2 = (JSONArray)result2.get("faces");
        int length = (faces2 != null) ? faces2.size() : 0;
        log.info(String.valueOf(length));

        JSONObject obj2 = (JSONObject)faces2.get(0);
        JSONObject celebrity = (JSONObject)obj2.get("celebrity");
        String value = (String)celebrity.get("value");
        Double confidence = (Double)celebrity.get("confidence");

        //결과를 받는다.
        model.addAttribute("result2",value);
        model.addAttribute("result3",confidence);

        Random r = new Random();
        int i = r.nextInt(365)+1;
        String date = Integer.toString(i);
        Object j = TodayFlowerUtil.todayFlower(date);
        model.addAttribute("yourlower", j);

        return "index";
    }

    @RequestMapping("/ocr1impl")
    public String ocr1impl(Model model, Ncp ncp) {
        //이미지를 저장한다.
        FileUploadUtil.saveFile(ncp.getImg(),imgpath);

        //NPC에게 물어본다
        String imgname = ncp.getImg().getOriginalFilename();
        JSONObject result =
                (JSONObject) OCRUtil.getResult(imgpath,imgname);

        Map map = OCRUtil.getData(result);

        //결과를 받는다.
        model.addAttribute("result",map);
        model.addAttribute("center","ocr1");
        return "index";
    }

    @RequestMapping("/ocr2impl")
    public String ocr2impl(Model model, Ncp ncp) {
        //이미지를 저장한다.
        FileUploadUtil.saveFile(ncp.getImg(),imgpath);

        //NPC에게 물어본다
        String imgname = ncp.getImg().getOriginalFilename();
        JSONObject result =
                (JSONObject) OCRUtil.getResult(imgpath,imgname);

        Map map = OCRUtil.getData2(result);

        //결과를 받는다.
        model.addAttribute("result",map);
        model.addAttribute("center","ocr2");
        return "index";
    }


}
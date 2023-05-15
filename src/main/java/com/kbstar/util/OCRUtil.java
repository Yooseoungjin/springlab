package com.kbstar.util;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

public class OCRUtil {
    public static Object getResult(String imgpath, String imgname){
        JSONObject obj = null;

            String apiURL = "https://uhucar79op.apigw.ntruss.com/custom/v1/22514/6d0f5eecbe0eae9bc3cfecd6aee96995f2ab203584325fa5d2d120406de0c4ac/infer";
            String secretKey = "b1dXbFhJaWJGZ0hxS2VTS2hvRVhoZ2JmYkZWSXVSbkQ=";
            String imageFile = imgpath+imgname;

            try {
                URL url = new URL(apiURL);
                HttpURLConnection con = (HttpURLConnection)url.openConnection();
                con.setUseCaches(false);
                con.setDoInput(true);
                con.setDoOutput(true);
                con.setReadTimeout(30000);
                con.setRequestMethod("POST");
                String boundary = "----" + UUID.randomUUID().toString().replaceAll("-", "");
                con.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + boundary);
                con.setRequestProperty("X-OCR-SECRET", secretKey);

                JSONObject json = new JSONObject();
                json.put("version", "V2");
                json.put("requestId", UUID.randomUUID().toString());
                json.put("timestamp", System.currentTimeMillis());
                JSONObject image = new JSONObject();
                image.put("format", "jpg");
                image.put("name", "demo");
                JSONArray images = new JSONArray();
                images.add(image);
                json.put("images", images);
                String postParams = json.toString();

                con.connect();
                DataOutputStream wr = new DataOutputStream(con.getOutputStream());
                long start = System.currentTimeMillis();
                File file = new File(imageFile);
                writeMultiPart(wr, postParams, file, boundary);
                wr.close();

                int responseCode = con.getResponseCode();
                BufferedReader br;
                if (responseCode == 200) {
                    br = new BufferedReader(new InputStreamReader(con.getInputStream()));
                } else {
                    br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
                }
                String inputLine;
                StringBuffer response = new StringBuffer();
                while ((inputLine = br.readLine()) != null) {
                    response.append(inputLine);
                }
                br.close();
                JSONParser parser = new JSONParser();
                obj = (JSONObject) parser.parse(response.toString());
            } catch (Exception e) {
                e.printStackTrace();
                System.out.println(e);
            }
        return obj;
    }

    private static void writeMultiPart(OutputStream out, String jsonMessage, File file, String boundary) throws
            IOException {
        StringBuilder sb = new StringBuilder();
        sb.append("--").append(boundary).append("\r\n");
        sb.append("Content-Disposition:form-data; name=\"message\"\r\n\r\n");
        sb.append(jsonMessage);
        sb.append("\r\n");

        out.write(sb.toString().getBytes("UTF-8"));
        out.flush();

        if (file != null && file.isFile()) {
            out.write(("--" + boundary + "\r\n").getBytes("UTF-8"));
            StringBuilder fileString = new StringBuilder();
            fileString
                    .append("Content-Disposition:form-data; name=\"file\"; filename=");
            fileString.append("\"" + file.getName() + "\"\r\n");
            fileString.append("Content-Type: application/octet-stream\r\n\r\n");
            out.write(fileString.toString().getBytes("UTF-8"));
            out.flush();

            try (FileInputStream fis = new FileInputStream(file)) {
                byte[] buffer = new byte[8192];
                int count;
                while ((count = fis.read(buffer)) != -1) {
                    out.write(buffer, 0, count);
                }
                out.write("\r\n".getBytes());
            }
            out.write(("--" + boundary + "--\r\n").getBytes("UTF-8"));
        }
        out.flush();
    }
    public static Map getData(JSONObject obj){

        String biznum_value = "";
        String bizname_value = "";
        String bizowner_value = "";
        String bizdate_value = "";
        String bizadd_value = "";

        JSONArray images = (JSONArray)obj.get("images");
        JSONObject biz = (JSONObject)images.get(0);
        JSONArray fields = (JSONArray)biz.get("fields");

        JSONObject biznum = (JSONObject)fields.get(0);
        biznum_value = (String)biznum.get("inferText");

        JSONObject bizname = (JSONObject)fields.get(1);
        bizname_value = (String)bizname.get("inferText");

        JSONObject bizowner = (JSONObject)fields.get(2);
        bizowner_value = (String)bizowner.get("inferText");

        JSONObject bizdate = (JSONObject)fields.get(3);
        bizdate_value = (String)bizdate.get("inferText");

        JSONObject bizadd = (JSONObject)fields.get(4);
        bizadd_value = (String)bizadd.get("inferText");

        Map<String,String> map = new HashMap<>();
        map.put("biz_num",biznum_value);
        map.put("bizname",bizname_value);
        map.put("bizowner",bizowner_value);
        map.put("bizdate",bizdate_value);
        map.put("bizadd",bizadd_value);

        return map;
    }

    public static Map getData2(JSONObject obj){

        String date_value = "";
        String time_value = "";
        String mainmenu_value = "";
        String sidemenu_value = "";


        JSONArray images = (JSONArray)obj.get("images");
        JSONObject biz = (JSONObject)images.get(0);
        JSONArray fields = (JSONArray)biz.get("fields");

        JSONObject date = (JSONObject)fields.get(0);
        date_value = (String)date.get("inferText");

        JSONObject time = (JSONObject)fields.get(1);
        time_value = (String)time.get("inferText");

        JSONObject mainmenu = (JSONObject)fields.get(2);
        mainmenu_value = (String)mainmenu.get("inferText");

        JSONObject sidemenu = (JSONObject)fields.get(3);
        sidemenu_value = (String)sidemenu.get("inferText");

        Map<String,String> map = new HashMap<>();
        map.put("date","날짜 : "+date_value);
        map.put("time","타임 : "+time_value);
        map.put("mainmenu","메인 : "+mainmenu_value);
        map.put("sidemenu","반찬 : "+sidemenu_value);

        return map;
    }

}

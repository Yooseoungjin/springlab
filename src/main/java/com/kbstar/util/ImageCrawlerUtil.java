// 구글,네이버, 다음 모두 이미지 크롤링 막힘, 크롤링 하면 모두 자신들의 로고 그림이 뜸
// 개발자 들어가서 api신청하고 해야 할듯함

package com.kbstar.util;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.IOException;

public class ImageCrawlerUtil {
    public static String getImageCraw() {
        String searchTerm = "치와와"; // 검색어 설정

        try {
            // 네이버 이미지 검색 URL
            String url = "https://search.daum.net/search?w=img&nil_search=btn&DA=NTB&enc=utf8&q=" + searchTerm;

            // Jsoup을 사용하여 페이지 파싱
            Document doc = Jsoup.connect(url).get();

            // 이미지 태그 가져오기
            Elements imgElements = doc.select("img");

            // 첫 번째 이미지 URL 가져오기
            if (imgElements.size() > 0) {
                Element firstImg = imgElements.first();
                String imageUrl = firstImg.absUrl("src");
                System.out.println("첫 번째 이미지 URL: " + imageUrl);
                return imageUrl;
            } else {
                System.out.println("이미지가 없습니다.");
            }

        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
}

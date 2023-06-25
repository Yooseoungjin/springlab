package com.kbstar.crawling;

import com.kbstar.util.ImageCrawlerUtil;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class ImgCrawling {

    @Test
    void contextLoads() throws Exception {
        log.info("start Crawling test ------------------------------------");
        String result = ImageCrawlerUtil.getImageCraw();
        log.info(result);
    }

}

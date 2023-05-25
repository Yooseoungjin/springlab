package com.kbstar.enc;

import lombok.extern.slf4j.Slf4j;
import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Slf4j
@SpringBootTest
class EncTests2 {

    @Autowired
    private BCryptPasswordEncoder encoder;

    @Test
    void contextLoads() {
        StandardPBEStringEncryptor pbeEnc = new StandardPBEStringEncryptor();
        pbeEnc.setAlgorithm("PBEWithMD5AndDES"); //PBEWithMD5AndDES는 암호화 알고리즘 이름이다
        pbeEnc.setPassword("mykey");

        String phone = "01033334444";
        String addr = "서울시 성동구 성수동 123-4";

        String encPhone = pbeEnc.encrypt(phone);
        log.info("----------------------------------Enc String:"+encPhone);
        String encAddr = pbeEnc.encrypt(addr);
        log.info("----------------------------------Enc String:"+encPhone);

        phone = pbeEnc.decrypt(encPhone);
        addr = pbeEnc.decrypt(encAddr);
        log.info("----------------------------------Phone:"+phone);
        log.info("----------------------------------Addr"+addr);
    }

}
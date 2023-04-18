package com.kbstar.tv;

import com.kbstar.frame.TV;

public class LTV implements TV {
    @Override
    public void turnOn() {
        System.out.println("엘지~티비 켜짐");
    }

    @Override
    public void turnOff() {
        System.out.println("엘지~티비 꺼짐");
    }
}

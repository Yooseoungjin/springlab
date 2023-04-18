package com.kbstar.app;

import com.kbstar.frame.TV;
import com.kbstar.tv.LTV;

public class App {
    public static void main(String args[]){
        TV tv = new LTV();
        tv.turnOn();
    }
}

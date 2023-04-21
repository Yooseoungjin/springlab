package com.kbstar.controller;

import com.kbstar.dto.Item;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/item") // /cust를 넣음으으로 기본적으로 주소에 /cust가 셋팅됨
public class ItemController {

    Logger logger = LoggerFactory.getLogger(this.getClass().getSimpleName());
    String dir = "item/"; //폴더명을 변수로 넣기

    //127.0.0.1/cust
    @RequestMapping("")
    public String main(Model model){
        model.addAttribute("left",dir+"left");
        model.addAttribute("center",dir+"center");
        return "index";
    }

    @RequestMapping("/add")
    public String add(Model model){
        model.addAttribute("left",dir+"left");
        model.addAttribute("center",dir+"add");
        return "index";
    }

    @RequestMapping("/all")
    public String all(Model model){
        List<Item> list = new ArrayList<>();
        list.add(new Item(100,"가파쿠1",1000,"a.jpg",new Date()));
        list.add(new Item(101,"가파쿠2",2000,"b.jpg",new Date()));
        list.add(new Item(102,"가파쿠3",3000,"c.jpg",new Date()));
        list.add(new Item(103,"가파쿠4",4000,"d.jpg",new Date()));
        list.add(new Item(104,"가파쿠5",5000,"e.jpg",new Date()));

        model.addAttribute("allitem",list);
        model.addAttribute("left",dir+"left");
        model.addAttribute("center",dir+"all");
        return "index";
    }

}

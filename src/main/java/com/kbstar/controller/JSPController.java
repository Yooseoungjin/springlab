package com.kbstar.controller;

import com.kbstar.dto.Cust;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/jsp") // /cust를 넣음으으로 기본적으로 주소에 /cust가 셋팅됨
public class JSPController {

    Logger logger = LoggerFactory.getLogger(this.getClass().getSimpleName());
    String dir = "jsp/"; //폴더명을 변수로 넣기

    //127.0.0.1/cust
    @RequestMapping("")
    public String main(Model model){
        model.addAttribute("left",dir+"left");
        model.addAttribute("center",dir+"center");
        return "index";
    }

    @RequestMapping("/jsp01")
    public String jsp01(Model model){
        model.addAttribute("num",10000.234);

        Cust cust = new Cust("id01","pwd01","<a href=''>K</a>","eamil1");
        model.addAttribute("cust",cust);

        Date date = new Date();
        model.addAttribute("cdate",date);

        model.addAttribute("left",dir+"left");
        model.addAttribute("center",dir+"jsp01");
        return "index";
    }

    @RequestMapping("/jsp02")
    public String jsp02(Model model){
        Cust cust = new Cust("id01","pwd01","james","email");
        model.addAttribute("rcust",cust);
        model.addAttribute("num",1);
        model.addAttribute("left",dir+"left");
        model.addAttribute("center",dir+"jsp02");
        return "index";
    }

    @RequestMapping("/jsp03")
    public String jsp03(Model model){
        List<Cust> list = new ArrayList<>();
        list.add(new Cust("id01","pwd01","james1","james1"));
        list.add(new Cust("id02","pwd02","james2","james1"));
        list.add(new Cust("id03","pwd03","james3","james1"));
        list.add(new Cust("id04","pwd04","james4","james1"));
        list.add(new Cust("id05","pwd05","james5","james1"));

        model.addAttribute("clist", list);

        model.addAttribute("left",dir+"left");
        model.addAttribute("center",dir+"jsp03");
        return "index";
    }

    @RequestMapping("/jsp04")
    public String jsp04(Model model){
        model.addAttribute("left",dir+"left");
        model.addAttribute("center",dir+"jsp04");
        return "index";
    }

    @RequestMapping("/jsp05")
    public String jsp05(Model model){
        model.addAttribute("left",dir+"left");
        model.addAttribute("center",dir+"jsp05");
        return "index";
    }

}
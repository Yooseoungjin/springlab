package com.kbstar.dto;

import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Search {
    private String keyword; //id가 될수도 있고 name이 될수도 있다
    private String search; // 찾고자 하는 텍스트가 들어간다
}

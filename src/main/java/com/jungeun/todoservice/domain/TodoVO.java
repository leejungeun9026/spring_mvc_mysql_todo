package com.jungeun.todoservice.domain;

import lombok.*;

import java.time.LocalDate;

@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class TodoVO {
    private long tno;
    private String title;
    private String content;
    private LocalDate duedate;
    private String writer;
    private boolean finished;
}

package com.jungeun.todoservice.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class TodoDTO {
    private long tno;
    private String title;
    private String content;
    private LocalDate duedate;
    private String writer;
    private boolean finished;
}

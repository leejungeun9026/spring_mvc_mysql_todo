package com.jungeun.todoservice.dto;

import jakarta.validation.constraints.Future;
import jakarta.validation.constraints.NotEmpty;
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
    @NotEmpty
    private String title;
    @NotEmpty
    private String content;
    @Future
    private LocalDate duedate;
    @NotEmpty
    private String writer;
    private boolean finished;
}

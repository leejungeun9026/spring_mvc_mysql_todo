package com.jungeun.todoservice.service;

import com.jungeun.todoservice.domain.TodoDTO;

import java.util.List;

public interface TodoService {
    List<TodoDTO> findAll();
    TodoDTO getTodo(int tno);
    int insertTodo(TodoDTO todoDTO);
}

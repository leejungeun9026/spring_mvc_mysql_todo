package com.jungeun.todoservice.service;

import com.jungeun.todoservice.dto.PageRequestDTO;
import com.jungeun.todoservice.dto.PageResponseDTO;
import com.jungeun.todoservice.dto.TodoDTO;

import java.util.List;

public interface TodoService {
    List<TodoDTO> findAll();
    TodoDTO getTodo(int tno);
    int insertTodo(TodoDTO todoDTO);
    int modifyTodo(TodoDTO todoDTO);
    int removeTodo(int tno);
    PageResponseDTO getPageTodoList(PageRequestDTO pageRequestDTO);
}

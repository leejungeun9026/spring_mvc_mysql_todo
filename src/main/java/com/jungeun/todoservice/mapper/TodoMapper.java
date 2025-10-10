package com.jungeun.todoservice.mapper;

import com.jungeun.todoservice.domain.TodoVO;
import com.jungeun.todoservice.dto.PageRequestDTO;

import java.util.List;

public interface TodoMapper {
    List<TodoVO> selectTodoList(PageRequestDTO pageRequest);
    int getCount(PageRequestDTO pageRequest);
    List<TodoVO> getTodoList();
    int insertTodo(TodoVO todoVO);
    TodoVO selectTodoOne(int tno);
    int updateTodo(TodoVO todoVO);
    int deleteTodo(int tno);
}
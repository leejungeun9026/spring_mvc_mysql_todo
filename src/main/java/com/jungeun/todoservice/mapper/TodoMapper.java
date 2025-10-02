package com.jungeun.todoservice.mapper;

import com.jungeun.todoservice.domain.TodoVO;

import java.util.List;

public interface TodoMapper {
    List<TodoVO> selectTodoList();
    TodoVO selectTodoOne(int tno);
    int insertTodo(TodoVO todoVO);

}

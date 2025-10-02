package com.jungeun.todoservice.service;

import com.jungeun.todoservice.domain.TodoDTO;
import com.jungeun.todoservice.domain.TodoVO;
import com.jungeun.todoservice.mapper.TodoMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class TodoServiceImpl implements TodoService {
  private final TodoMapper todoMapper;
  private final ModelMapper modelMapper;

  @Override
  public List<TodoDTO> findAll() {
    List<TodoVO> todoVOs = todoMapper.selectTodoList();
    List<TodoDTO> todoList = todoVOs.stream().map(vo -> modelMapper.map(vo, TodoDTO.class)).collect(Collectors.toList());
//        List<TodoDTO> todoDTOs = new ArrayList<>();
//        for (TodoVO todoVO : todoList) {
//            TodoDTO todoDTO = new TodoDTO();
//            todoDTO.setTno(todoVO.getTno());
//            ...
//            todoDTOs.add(todoDTO);
//        }
    return todoList;
  }

  @Override
  public TodoDTO getTodo(int tno) {
    TodoVO todoVO = todoMapper.selectTodoOne(tno);
    TodoDTO todoDTO = modelMapper.map(todoVO, TodoDTO.class);
    return todoDTO;
  }

  @Override
  public int insertTodo(TodoDTO todoDTO) {
    TodoVO todoVO = modelMapper.map(todoDTO, TodoVO.class);
    int result = todoMapper.insertTodo(todoVO);
    return result;
  }


}

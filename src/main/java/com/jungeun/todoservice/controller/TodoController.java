package com.jungeun.todoservice.controller;

import com.jungeun.todoservice.domain.TodoDTO;
import com.jungeun.todoservice.service.TodoService;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Log4j2
@Controller
@RequestMapping("/todo")
public class TodoController {
  @Autowired
  private TodoService todoService;

  @GetMapping("/list")
  public void todoList(Model model) {
    log.info("todoList");
    model.addAttribute("todoList", todoService.findAll());
  }

  @GetMapping("/register")
  public void registerGet() {
    log.info("registerGet");
  }

  @PostMapping("/register")
  public String registerPost(TodoDTO todoDTO) {
    log.info("registerPost");
    int result = todoService.insertTodo(todoDTO);
    if (result == 1) {
      return "redirect:/todo/list";
    } else {
      return "redirect:/todo/register";
    }
  }

  @GetMapping("/view")
  public void todoView(@RequestParam("tno") int tno, Model model) {
    model.addAllAttributes("todo", todoService.getTodo(tno));
  }
}

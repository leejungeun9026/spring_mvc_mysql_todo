package com.jungeun.todoservice.controller;

import com.jungeun.todoservice.dto.PageRequestDTO;
import com.jungeun.todoservice.dto.TodoDTO;
import com.jungeun.todoservice.service.TodoService;
import jakarta.validation.Valid;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Log4j2
@Controller
@RequestMapping("/todo")
public class TodoController {
  @Autowired
  private TodoService todoService;

//  @GetMapping("/list")
  public void todoList(Model model) {
    log.info("todoList");
    model.addAttribute("todoList", todoService.findAll());
  }

  @GetMapping("/list")
  public void list(@Valid PageRequestDTO pageRequestDTO, BindingResult bindingResult, Model model) {
    log.info("list" + pageRequestDTO);
    if (bindingResult.hasErrors()) {
      pageRequestDTO = PageRequestDTO.builder().build();
    }
    model.addAttribute("pageRequestDTO", pageRequestDTO);
    model.addAttribute("responseDTO", todoService.getPageTodoList(pageRequestDTO));
  }


  @GetMapping("/register")
  public void registerGet() {
    log.info("registerGet");
  }

  @PostMapping("/register")
  public String registerPost(@Valid TodoDTO todoDTO, BindingResult bindingResult, RedirectAttributes redirectAttributes) {
    log.info("registerPost");
    if(bindingResult.hasErrors()) {
      log.info("bindingResult.hasErrors");
      redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
      return "redirect:/todo/register";
    }

    int result = todoService.insertTodo(todoDTO);
    if (result == 1) {
      return "redirect:/todo/list";
    } else {
      return "redirect:/todo/register";
    }
  }

  @GetMapping({"/view", "/modify"})
  public void todoView(@RequestParam("tno") int tno, PageRequestDTO pageRequestDTO, Model model) {
    model.addAttribute("todo", todoService.getTodo(tno));
  }

  @PostMapping("/modify")
  public String modifyTodo(TodoDTO todoDTO, PageRequestDTO pageRequestDTO) {
    log.info("modifyTodo" + todoDTO);
    int result = todoService.modifyTodo(todoDTO);
    if(result == 1) {
      return "redirect:/todo/view?tno=" + todoDTO.getTno();
    } else {
      return "redirect:/todo/modify?tno=" + todoDTO.getTno();
    }
  }

  @GetMapping("/remove")
  public String deleteTodo(@RequestParam("tno") int tno) {
    log.info("deleteTodo");
    int result = todoService.removeTodo(tno);
    if(result == 1) {
      return "redirect:/todo/list";
    } else {
      return "redirect:/todo/modify?tno=" + tno;
    }
  }
}

package com.jungeun.todoservice;

import com.jungeun.todoservice.domain.TodoVO;
import com.jungeun.todoservice.mapper.TodoMapper;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import javax.sql.DataSource;
import java.sql.Connection;
import java.util.List;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")
public class TodoTest {
    @Autowired
    private DataSource ds;

    @Autowired(required = false)
    private TodoMapper todoMapper;

    @Test
    public void DBConnTest(){
        try {
            Connection con = ds.getConnection();
            log.info("DB 연결 성공" + con);
        } catch(Exception e){
            e.printStackTrace();
        }
    }

    @Test
    public void selectTodoListTest(){
        List<TodoVO> todoList = todoMapper.selectTodoList();
        for (TodoVO todoVO : todoList) {
            log.info("todoVO : " + todoVO);
        }
    }
}

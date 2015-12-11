package com.jms.web.service;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration("/spring-context.xml")
public class TestAutowiredService {
	private MockMvc mockMvc;
	
	@Autowired
	protected WebApplicationContext context;
	
	@Before
	public void setup() {
		mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
	}
	
	@Test
	public void test() {
		Message message = context.getBean(Message.class);
		
		assertNotNull(message);
		
		System.out.println(message.getMessageText());
		
		try {
			mockMvc.perform(
					MockMvcRequestBuilders.get("/"))
					.andExpect(MockMvcResultMatchers.status().isOk())
					.andExpect(MockMvcResultMatchers.view().name("home/index"));
		} catch (Exception e) {
			e.printStackTrace();
			fail("Something went wrong...");
		}
	}

}

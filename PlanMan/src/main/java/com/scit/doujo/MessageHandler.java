package com.scit.doujo;

import java.util.ArrayList;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;

import org.springframework.web.socket.TextMessage;

import org.springframework.web.socket.WebSocketSession;

import org.springframework.web.socket.handler.TextWebSocketHandler;


public class MessageHandler extends TextWebSocketHandler{

private static Logger logger = LoggerFactory.getLogger(MessageHandler.class);
	String num = "";
    private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
    private  Map<String, List<WebSocketSession>> sessions  = new HashMap<>();
    
    @Autowired
	SqlSession sqlsession;

    /**
     * 클라이언트 연결 이후에 실행되는 메소드
     */

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        sessionList.add(session);
        logger.info("{} 연결됨", session.getId());
    }

    /**
     * 클라이언트가 웹소켓서버로 메시지를 전송했을 때 실행되는 메소드
     */
    @Override
    protected void handleTextMessage(WebSocketSession session,
        TextMessage message) throws Exception {
        logger.info("{}로 부터 {} 받음", session.getId(), message.getPayload());
        String[] messageAry = message.getPayload().split(":");
        System.out.println(messageAry[0] +":"+ messageAry[1] +":"+ messageAry[2]);
        for(WebSocketSession sess : sessionList){
            //sess.sendMessage(new TextMessage(session.getId() +" : "+ message.getPayload()));
        	sess.sendMessage(new TextMessage(messageAry[0] +":"+ messageAry[1] +":"+ messageAry[2]));
        }
    }

    /**
     * 클라이언트가 연결을 끊었을 때 실행되는 메소드
     */

    @Override

    public void afterConnectionClosed(WebSocketSession session,CloseStatus status) throws Exception {
        sessionList.remove(session);
        logger.info("{} 연결 끊김", session.getId());
    }

}
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


public class EchoHandler extends TextWebSocketHandler{

private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);
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
        logger.info("{} �����", session.getId());
    }
    
    /**
     * 클라이언트가 웹소켓서버로 메시지를 전송했을 때 실행되는 메소드
     */
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
    	logger.info("{}로 부터 {} 받음", session.getId(), message.getPayload());
    	/*logger.info("{}로 부터 {} 받음", session.getId(), message.getPayload());
        for(WebSocketSession sess : sessionList){
            sess.sendMessage(new TextMessage(session.getId() +":"+ message.getPayload()));
        }*/
    	
    	//message split
    	logger.info("{}로 부터 {} 받음", session.getId(), message.getPayload());
    	String[] messageAry = message.getPayload().split(":");
    	
    	//내 채팅방의 인원이 존재할경우
    	if(sessions.containsKey(messageAry[1])) {
    		
    		//start
    		if(messageAry[0].equals("start")) {
    			System.out.println("start��ɾ� ����, "+messageAry[1]+"����");
    			num = messageAry[1];
    			List<WebSocketSession> nl = sessions.get(messageAry[1]);
    			nl.add(session);
    			sessions.put(messageAry[1], nl);
    			for(WebSocketSession sess : sessions.get(messageAry[1])){
    				 sess.sendMessage(new TextMessage("start:" +messageAry[1]+ ":" + "����"));
    			}
    			
    		//message
    		} else if(messageAry[0].equals("message")) {
    			for(WebSocketSession sess : sessions.get(messageAry[1])){
   					sess.sendMessage(new TextMessage(messageAry[0] +":"+ messageAry[2] +":"+ messageAry[3]));
   			 	}
    			
    		//
    		} else if(messageAry[0].equals("quiznumber")) {
    			for(WebSocketSession sess : sessions.get(messageAry[1])){
    				sess.sendMessage(new TextMessage(message.getPayload()));
   			 	}
        		
        	}  else if(messageAry[0].equals("quiz")) {
        		//퀴즈번호가 일치하는 퀴즈 하나를 가져오기 위한 기능.
        		for(WebSocketSession sess : sessions.get(messageAry[1])){
    				sess.sendMessage(new TextMessage(message.getPayload()));
   			 	}
        		/*QuizDAO dao = sqlsession.getMapper(QuizDAO.class);	
        		Quiz quiz = dao.selectOneQuiz(Integer.parseInt(messageAry[2]));
        		
        		sess.sendMessage(new TextMessage("quiz:"+messageAry[2]));*/
        		
        	}
    		
    	} else {
    	
    		//logger.info("{}로 부터 {} 받음", session.getId(), message.getPayload());
	        for(WebSocketSession sess : sessionList){
	        	
	        	//ArrayList<Quiz> quizList = null;
	        	
	        	if(messageAry[0].equals("start")) {
	        		num = messageAry[1];
	        		System.out.println("ä�ù����, start��ɾ� ����, "+messageAry[1]+"����");
	        		List<WebSocketSession> nl = new ArrayList<WebSocketSession>();
	        		nl.add(session);
	        		sessions.put(messageAry[1], nl);
	        		sess.sendMessage(new TextMessage("start:" +messageAry[1]+ ":"+"����"));
	        	}
        }
        	
        	
        	
        	/*if(messageAry[0].equals("message")) {
        		//���� messageŸ���̸� message:���̵�:�����ҳ��� ���κ�����.
        		
        		sess.sendMessage(new TextMessage(message.getPayload()));
        		
        		
        		//sess.sendMessage(new TextMessage(message.getPayload()));
        		
        		
        		
        		
        	} else if(messageAry[0].equals("quiznumber")) {
        		//�����ȣ��� ������������ ���
        		//���� �����ȣŸ���̸� quiz:quizseq ���� ������.
        		QuizDAO dao = sqlsession.getMapper(QuizDAO.class);	
        		Quiz quiz = new Quiz();
        		quiz.setId(messageAry[1]);
        		String result = "";
        		int check = 0;
        		//tegŸ������ recordŸ������ ���� Ȯ���Ѵ�.
        		String type = messageAry[2].substring(0, 1);
        		String name = messageAry[2].substring(1);
        		if(type.equals("t")) {
        			//type�� teg�̸� �±׸� ����ؼ� �ҷ��´�.
        			quiz.setTeg(name);
        			quizList = dao.selectTegQuiz(quiz);
        		} else if(type.equals("r")) {
        			//type�� record�̸� ���̵�� ���ڵ��ڵ带 ����ؼ� �ҷ��´�.
        			quiz.setQuizrecordname(name);
            		quiz.setQuizrecordcode(messageAry[1]+name);
        			quizList = dao.selectRecordQuiz(quiz);
        		}
        		//quizList�� �ϳ��� String���� �����.
        		for(Quiz var : quizList) {
        			result += var.getQuizseq();
        			if(check < quizList.size()-1) {
        				check++;
        				result += ",";
        			}
        		}
        		System.out.println("grouptesting"+result);
        		
        		sess.sendMessage(new TextMessage("quiznumber:"+messageAry[1]+":"+result));
        		
        		
        		
        	}  else if(messageAry[0].equals("quiz")) {
        		//�����ȣ�� ��ġ�ϴ� ���� �ϳ��� �������� ���� ���.
        		
        		QuizDAO dao = sqlsession.getMapper(QuizDAO.class);	
        		Quiz quiz = dao.selectOneQuiz(Integer.parseInt(messageAry[2]));
        		
        		sess.sendMessage(new TextMessage("quiz:"+messageAry[2]));
        		
        	}*/
        	
        	
        }
    	
    }

    
    
    /**
     * 클라이언트가 연결을 끊었을 때 실행되는 메소드
     */
    @Override
    public void afterConnectionClosed(WebSocketSession session,  CloseStatus status) throws Exception {
        sessionList.remove(session);

       List<WebSocketSession> nl = sessions.get(num);
       nl.remove(session);
       sessions.put(num, nl);
		
        
       logger.info("{} disconnected", session.getId());
    }
    
    

}
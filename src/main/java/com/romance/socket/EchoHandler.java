package com.romance.socket;


import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component("echoHandler")
@RequestMapping("/echo")
public class EchoHandler extends TextWebSocketHandler {
	@Autowired
	chatServiceInter ser;
	// 세션 리스트
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();

	private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);

	// 클라이언트가 연결 되었을 때 실행
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessionList.add(session);
		logger.info("{} 연결됨", session.getId());
	}

	// 클라이언트가 웹소켓 서버로 메시지를 전송했을 때 실행
	@Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        System.out.println("{}로 부터 {} 받음"+ session.getId()+message.getPayload());
        //받은메세지 데이터베이스에 등록(db)
        chatVO vo=new chatVO();
        vo.setReal_chat_session(session.getId());
        String[] arr=message.getPayload().split(":");
        vo.setRealchatname(arr[0]);
        vo.setReal_chat_content(arr[1]);
        ser.insertchat(vo);
        //모든 유저에게 메세지 출력
        for(WebSocketSession sess : sessionList){
            sess.sendMessage(new TextMessage(session.getId()+":"+message.getPayload()));
        }
	}

    //클라이언트 연결을 끊었을 때 실행
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        sessionList.remove(session);
       
       System.out.println("{} 연결 끊김."+ session.getId());
    }
}


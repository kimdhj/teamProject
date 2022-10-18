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

@Component("echoHandler") // 빈 등록
@RequestMapping("/echo") // /echo 로 온건 여기서 다 받는다!
public class EchoHandler extends TextWebSocketHandler {
	@Autowired
	chatServiceInter ser; // 채팅 내용을 DB 에 넣기 위해 가져온 service

	// 세션 리스트 -> 모든 세션 정보를 가져오는 것(모든 세션에 데이터를 넘겨주기 위해 모든 세션 정보를 알고있어야함)
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();

	private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);

	// 클라이언트가 연결 되었을 때 실행(세션 연결되자마자 바로 실행되는 거임) - index.do 에 들어가기만 해도 세션 연결되어 있는 것임! 근데 우리는 채팅 페이지 갔을 때만 연결(소캣의 세션)
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessionList.add(session);
		logger.info("{} 연결됨", session.getId());
	}

	// 클라이언트가 웹소켓 서버로 메시지를 전송했을 때 실행(실질적인 소캣 통신) - 소캣을 사용하는 사람 모두에게 공통적으로 사용하는 코드
	@Override // session : 메세지를 보낸 세션이름, message : 메세지
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        System.out.println("{}로 부터 {} 받음"+ session.getId()+message.getPayload());
        //받은메세지 데이터베이스에 등록(db)
        chatVO vo=new chatVO();
        vo.setReal_chat_session(session.getId()); // 세션 아이디를 가져올 수 있음
        String[] arr=message.getPayload().split(":"); // 이름:내용 으로 아이디, 내용을 나눠놨음
        vo.setRealchatname(arr[0]); // 이름
        vo.setReal_chat_content(arr[1]); // 내용
        System.out.println("실시간채팅 저장"+vo);
        ser.insertchat(vo); // 채팅을 넣어주는 메소드
        
        //모든 유저에게 메세지 출력 - 모든 소캣에 메세지를 하나 보내는데, 어떤 메세지를 보낼 것인지는 정할 수 있음(여기서는 id, 내용을 넣어둠) - 세션이 존재하는 유저들에게 메세지 출력하는 용도인데, 여기서 조건을 걸어서 전체 유저 화면에 안띄워주도록 하는 것! 
        for(WebSocketSession sess : sessionList){
            sess.sendMessage(new TextMessage(session.getId()+":"+message.getPayload()));
        }
	}

    //클라이언트 연결을 끊었을 때 실행(지워버리고 새로운 세션을 넣어주는 것)
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        sessionList.remove(session); // 지우지 않게 된다면 느려지게 될 것!
       
       System.out.println("{} 연결 끊김."+ session.getId());
    }
}


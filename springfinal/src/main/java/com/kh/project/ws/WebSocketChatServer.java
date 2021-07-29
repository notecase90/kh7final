package com.kh.project.ws;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.project.entity.MemberDto;
import com.kh.project.repository.MemberDao;
import com.kh.project.repository.MessageDao;
import com.kh.project.vo.ChatVo;
import com.kh.project.vo.MessageVo;
import com.kh.project.vo.UserVo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class WebSocketChatServer extends TextWebSocketHandler{
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private MessageDao messageDao;
	
	
	private ChatServer server = new ChatServer();


	public static final int JOIN = 1;
	public static final int MESSAGE = 2;
	public static final int LEAVE = 3;
	
	
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		Integer memberNo = (Integer)session.getAttributes().get("memberNo");
		if(memberNo == null) return;
		MemberDto memberDto = memberDao.get(memberNo);
		
		server.start(UserVo.builder()
							.memberNo(memberDto.getMemberNo())
							.memberName(memberDto.getMemberName())
							.session(session)
							.build());
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String payload = message.getPayload();
		
		ObjectMapper mapper = new ObjectMapper();
		ChatVo chatVo = mapper.readValue(payload, ChatVo.class);
		
		Integer memberNo = (Integer)session.getAttributes().get("memberNo");
		
		if(memberNo == null) return;
		
		if(chatVo.getChatType() == JOIN) {
			server.enter(memberNo, chatVo.getChatName());		
			
//			messageDao.insertChat(chatVo);
		}
		else if(chatVo.getChatType() == MESSAGE){
				
			MemberDto memberDto = memberDao.get(memberNo);
			server.send(memberNo, chatVo.getChatName(), chatVo.getContent());												
			
			long curTime = System.currentTimeMillis();
			SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
			String time = sdf.format(new Date(curTime));
			
			MessageVo messageVo = MessageVo.builder()
											.memberNo(memberNo)
											.message(chatVo.getContent())
											.sendTime(time)
											.memberName(memberDto.getMemberName())
											.chatName(chatVo.getChatName())
											.build();
			messageDao.insert(messageVo);
			log.debug("---------------------------------------------------");
			
		}
		else if(chatVo.getChatType() == LEAVE) {
			server.exit(memberNo, chatVo.getChatName());
			messageDao.delete(chatVo.getChatName());
			log.debug("삭제실행---------------------------------------------------");
		}
		
	
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		Integer memberNo = (Integer) session.getAttributes().get("memberNo");
		if(memberNo == null) return;
		
		server.exit(memberNo);
	}
}

package com.kh.project.ws;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.TextMessage;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.project.vo.MessageVo;
import com.kh.project.vo.UserVo;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class Chat {
	
	@Setter @Getter
	private String chatName;
	@Getter
	private Set<UserVo> users;
	
	@Builder
	public Chat(String chatName) {
		this.chatName = chatName;
		this.users = new HashSet<>();
	}
	//유저찾기
	public UserVo find(int memberNo) {
		for(UserVo user : users) {
			if(user.getMemberNo() == memberNo) {//memberNo가 일치시
				return user; //user로 반환
			}
		}
		return null;//없으면 null 반환
	}
	public boolean isEmpty() {
		return users.size() == 0;
	}
	
	public void enter(UserVo userVo) {
		users.add(userVo);//입장후 유저정보저장
		log.debug("{} 채널 사용자 입장 : 이용자 {}명", chatName, users.size());
	}
	
	public void send(int memberNo,String message) throws IOException {
		UserVo user = find(memberNo); //회원번호로 정보를찾아 저장
		
		long curTime = System.currentTimeMillis();
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");

		String time = sdf.format(new Date(curTime));

	   
		MessageVo messageVo = MessageVo.builder()
											.memberNo(user.getMemberNo())
											.memberName(user.getMemberName())
											.sendTime(time)
											.message(message)
										.build();
		
		
		ObjectMapper mapper = new ObjectMapper();//스트링을 json으로 변환객체
		String json = mapper.writeValueAsString(messageVo);//messageVo를 json으로 변환
		TextMessage tm = new TextMessage(json);//변환한json을 textMessage에 저장
		for(UserVo sender : users) {
			sender.getSession().sendMessage(tm);//유저들에게 메세지를보낸다
			
		}
		
	}
	
	public void exit(int memberNo) {
		for(UserVo user : users) {
			if(user.getMemberNo() == memberNo) {//memberNo가 일치시 제거
				exit(user); break;
			}
		}
	}
	public void exit(UserVo userVo) {
		users.remove(userVo);
	}
}

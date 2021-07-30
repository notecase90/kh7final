package com.kh.project.ws;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

import com.kh.project.vo.UserVo;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ChatServer {
	
	private Set<UserVo> waiting = new HashSet<>();//대기실
	private Set<Chat> chats = new HashSet<>();//채팅저장소
	
	//채팅방탐색
	public boolean exist(String chatName) {
		return find(chatName) != null;
	}
	public Chat find(String chatName) {//채팅방이름찾기
		for(Chat chat : chats) {
			if(chat.getChatName().equals(chatName)) {//이름이같으면 chat반환
				return chat;
			}
		}
		return null;
	}
	//대기실 탐색
	public UserVo findWaiting(int memberNo) {
		for(UserVo user : waiting) {
			if(user.getMemberNo() == memberNo) {
				return user;
			}
		}
		return null;
	}
	//대기실입장
	public void start(UserVo userVo) {
		waiting.add(userVo);
		log.debug("대기실입장");
	}
	public void enter(int memberNo , String chatName) {
		UserVo user = findWaiting(memberNo);//회원번호로 대기실탐색
		waiting.remove(user);//대기실 에서 제거
		
		Chat chat = find(chatName);//chatName을 찾아서
		if(chat == null) {//chatName이 null 이면 
			chat = new Chat(chatName);//새로 생성	
			chats.add(chat);//생성후 chats에 추가
			log.debug("신규 채널 생성 : {}", chatName);
		}
		chat.enter(user); //만든채널에 유저입장
	}
	public void send(int memberNo, String chatName, String message) throws IOException {
		Chat chat = find(chatName); //채널명을찾아
		if(chat != null) {//null아니면
			chat.send(memberNo, message);//채널에 메세지를 보내라 
		}
	}
	public void exit(int memberNo, String chatName) {
		Chat chat = find(chatName);//채널명을탐색해
		chat.exit(memberNo);//회원번호를 제거
		
		if(chat.isEmpty()) {//만약 비어있다면
			chats.remove(chat);//채팅방목록에서 제거
			log.debug("채널 삭제 : {}", chatName);
		}
	}
	public void exit(int memberNo) {
		for(Chat chat : chats) {
			exit(memberNo,chat.getChatName());
		}
	}
}

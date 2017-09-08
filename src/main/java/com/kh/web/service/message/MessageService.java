package com.kh.web.service.message;

import com.kh.web.model.message.dto.MessageVO;

public interface MessageService {
	// 메시지 작성(DB저장, 포인트적립)
	public void addMessage(MessageVO vo);
	// 메시지 열람
	public MessageVO readMessage(String userid, int mid);
}

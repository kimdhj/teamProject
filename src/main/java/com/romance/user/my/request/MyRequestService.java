package com.romance.user.my.request;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.romance.user.login.UserVO;

public interface MyRequestService {
	//세션 유저 정보
	public UserVO getUser(String session_user_id);
	
	//나의문의 리스트
	public List<MyRequestVO> getRequestList(String session_user_id);
	
	public List<MyRequestVO> getMyRequestList(Criteria criteria);
	
	//나의문의 개수
	public int myRequestTotalCount(Criteria criteria);
	
	//문의글 상세
	public MyRequestVO getMyRequestDetail(MyRequestVO myRequestVO);
	
	//관리자 답변글
	public MyRequestReplyVO getMyRequestReply(MyRequestReplyVO myRequestReplyVO);
	
	//문의글 등록
	public void insertMyRequest(MyRequestVO myRequestVO) throws IOException;
		

}

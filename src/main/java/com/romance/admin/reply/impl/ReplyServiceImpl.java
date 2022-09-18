package com.romance.admin.reply.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.romance.admin.reply.ReplyJoinVO;
import com.romance.admin.reply.ReplySearchVO;
import com.romance.admin.reply.ReplyService;
import com.romance.admin.reply.ReplyVO;

@Service("replyService")
public class ReplyServiceImpl implements ReplyService {
  @Autowired
  private ReplyDAO reply;
  
  @Override
  public List<ReplyJoinVO> getReplyList(ReplySearchVO svo) {
    
    if(svo.getPage() == 0) {
      svo.setPage(1);
    }
    if(svo.getId() != null) {
      svo.setId(svo.getId().trim());
    }
    if(svo.getName() != null) {
      svo.setName(svo.getName().trim());
    }
    if(svo.getBirth() != null) {
      svo.setBirth(svo.getBirth().trim());
    }
    if(svo.getTitle() != null) {
      svo.setTitle(svo.getTitle().trim());
    }
    if(svo.getSub() != null) {
      if(svo.getSub().trim().equals("구독")) {
        System.out.println("구독 구독" + svo.getSub());
        svo.setSub("1");
      }else if(svo.getSub().trim().equals("일반")) {
        System.out.println("일반 일반" + svo.getSub());
        svo.setSub("0");
      }
      svo.setSub(svo.getSub().trim());
    }
    
    return reply.getReplyList(svo);
  }

  @Override
  public int getCount(ReplySearchVO svo) {
    
    if(svo.getId() != null) {
      svo.setId(svo.getId().trim());
    }
    if(svo.getName() != null) {
      svo.setName(svo.getName().trim());
    }
    if(svo.getBirth() != null) {
      svo.setBirth(svo.getBirth().trim());
    }
    if(svo.getTitle() != null) {
      svo.setTitle(svo.getTitle().trim());
    }
    if(svo.getSub() != null) {
      if(svo.getSub().trim().equals("구독1")) {
        System.out.println("구독 구독2" + svo.getSub());
        svo.setSub("1");
      }else if(svo.getSub().trim().equals("일반1")) {
        System.out.println("일반 일반2" + svo.getSub());
        svo.setSub("0");
      }
      svo.setSub(svo.getSub().trim());
    }
    
    return reply.getCount(svo);
  }
  
  @Override
  public void delete(ReplyVO vo) {
    reply.delete(vo);
  }
  
  @Override
  public void chkboxDelete(List<String> reply_seq) {
    
    for(String nSeq : reply_seq) {
      int seq = Integer.parseInt(nSeq);
      
      ReplyVO vo = new ReplyVO();
      vo.setReply_seq(seq);
      vo = getReply(vo);
      
      delete(vo);
      
    }
  }
  
  @Override
  public ReplyVO getReply(ReplyVO vo) {
    System.out.println("serviceImpl" + vo);
    return reply.getReply(vo);
  }
  
  @Override
  public void blind(ReplyVO vo) {
    reply.blind(vo);
  }
  
  @Override
  public void blindCancel(ReplyVO vo) {
    reply.blindCancel(vo);
  }
  
  @Override
  public void chkboxBlind(List<String> reply_seq) {
    for(String nSeq : reply_seq) {
      int seq = Integer.parseInt(nSeq);
      
      ReplyVO vo = new ReplyVO();
      vo.setReply_seq(seq);
      vo = getReply(vo);
      
      blind(vo);
    }
  }
  
  @Override
  public void chkboxBlindCancel(List<String> reply_seq) {
    for(String nSeq : reply_seq) {
      int seq = Integer.parseInt(nSeq);
      
      ReplyVO vo = new ReplyVO();
      vo.setReply_seq(seq);
      vo = getReply(vo);
      
      blindCancel(vo);
    }
  }
  
}

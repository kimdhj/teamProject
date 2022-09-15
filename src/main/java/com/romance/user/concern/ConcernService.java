package com.romance.user.concern;

import java.util.List;

public interface ConcernService {
  public int concernin(ConcernWriterVO vo); 
  public List<ConcernWriterVO> concernall(ConcernSearchVO vo);
  public int concerncount(ConcernSearchVO vo);
  public void concerndel(List<Integer> author_seq,String user_id);
  public List<ConcernWriterVO> getautor(List<ConcernWriterVO> vol);
}

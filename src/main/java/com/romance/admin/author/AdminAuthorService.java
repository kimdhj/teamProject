package com.romance.admin.author;

import java.util.List;

public interface AdminAuthorService {
  public List<AdminAuthorVO> adminauthorlist(AdminAuthorSearchVO vo);
  public int adminauthorcount(AdminAuthorSearchVO vo);
  public void  adminauthorcreate(AdminAuthorVO vo) ;

  public void  adminauthordelete(AdminAuthorVO vo);

  public void updatelist(List<Integer> author_seq,List<String> author_name);


}

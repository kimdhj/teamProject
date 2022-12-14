package com.romance.admin.faq.impl;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.romance.admin.faq.FaqSearchVO;
import com.romance.admin.faq.FaqService;
import com.romance.admin.faq.FaqVO;
import com.romance.server.AwsS3;

@Service("faqService")
public class FaqServiceImpl implements FaqService{
	@Autowired
	private FaqDAO faq;
	
	@Override
	public List<FaqVO> getFaqList(FaqSearchVO svo) {
		if(svo.getPage() == 0) {
			svo.setPage(1);
		}
		if(svo.getBigsort() != null) {
			svo.setBigsort(svo.getBigsort().trim());
		}
		if(svo.getSmallsort() != null) {
			svo.setSmallsort(svo.getSmallsort().trim());
		}
		if(svo.getAsk() != null) {
			svo.setAsk(svo.getAsk().trim());
		}
		
		return faq.getFaqList(svo);
	}
	
	@Override
	public int getCount(FaqSearchVO svo) {
		if(svo.getAsk() != null) {
			svo.setAsk(svo.getAsk().trim());
		}
		if(svo.getBigsort() != null) {
			svo.setBigsort(svo.getBigsort().trim());
		}
		if(svo.getSmallsort() != null) {
			svo.setSmallsort(svo.getSmallsort().trim());
		}
		return faq.getCount(svo);
	}
	
//  @Override
//  public List<FaqVO> getOrderList(FaqSearchVO svo) {
//    if(svo.getPage() == 0) {
//      svo.setPage(1);
//    }
//    if(svo.getAsk() != null) {
//      svo.setAsk(svo.getAsk().trim());
//    }
//    if(svo.getSmallsort() != null) {
//      svo.setSmallsort(svo.getSmallsort().trim());
//    }
//    return faq.getOrderList(svo);
//  }
//  
//  @Override
//  public int getOrderCount(FaqSearchVO svo) {
//    if(svo.getAsk() != null) {
//      svo.setAsk(svo.getAsk().trim());
//    }
//    if(svo.getSmallsort() != null) {
//      svo.setSmallsort(svo.getSmallsort().trim());
//    }
//    return faq.getOrderCount(svo);
//  }
//  
//  @Override
//  public List<FaqVO> getDeliveryList(FaqSearchVO svo) {
//    if(svo.getPage() == 0) {
//      svo.setPage(1);
//    }
//    if(svo.getAsk() != null) {
//      svo.setAsk(svo.getAsk().trim());
//    }
//    if(svo.getSmallsort() != null) {
//      svo.setSmallsort(svo.getSmallsort().trim());
//    }
//    return faq.getDeliveryList(svo);
//  }
//
//  @Override
//  public List<FaqVO> getChangeList(FaqSearchVO svo) {
//    if(svo.getPage() == 0) {
//      svo.setPage(1);
//    }
//    if(svo.getAsk() != null) {
//      svo.setAsk(svo.getAsk().trim());
//    }
//    if(svo.getSmallsort() != null) {
//      svo.setSmallsort(svo.getSmallsort().trim());
//    }
//    return faq.getChangeList(svo);
//  }
//
//  @Override
//  public List<FaqVO> getUserList(FaqSearchVO svo) {
//    if(svo.getPage() == 0) {
//      svo.setPage(1);
//    }
//    if(svo.getAsk() != null) {
//      svo.setAsk(svo.getAsk().trim());
//    }
//    if(svo.getSmallsort() != null) {
//      svo.setSmallsort(svo.getSmallsort().trim());
//    }
//    return faq.getUserList(svo);
//  }
//
//  @Override
//  public int getDeliveryCount(FaqSearchVO svo) {
//    if(svo.getAsk() != null) {
//      svo.setAsk(svo.getAsk().trim());
//    }
//    if(svo.getSmallsort() != null) {
//      svo.setSmallsort(svo.getSmallsort().trim());
//    }
//    return faq.getDeliveryCount(svo);
//  }
//
//  @Override
//  public int getChangeCount(FaqSearchVO svo) {
//    if(svo.getAsk() != null) {
//      svo.setAsk(svo.getAsk().trim());
//    }
//    if(svo.getSmallsort() != null) {
//      svo.setSmallsort(svo.getSmallsort().trim());
//    }
//    return faq.getChangeCount(svo);
//  }
//
//  @Override
//  public int getUserCount(FaqSearchVO svo) {
//    if(svo.getAsk() != null) {
//      svo.setAsk(svo.getAsk().trim());
//    }
//    if(svo.getSmallsort() != null) {
//      svo.setSmallsort(svo.getSmallsort().trim());
//    }
//    return faq.getUserCount(svo);
//  }
	
	@Override
	public void delete(FaqVO vo) {
		faq.delete(vo);
	}
	
	@Override
	public void chkboxDelete(List<String> FAQ_seq) throws FileNotFoundException, IOException {
		for(String nSeq : FAQ_seq) {
			int seq = Integer.parseInt(nSeq);
			
			FaqVO vo = new FaqVO();
			vo.setFAQ_seq(seq); // seq ????????????
			vo = getFaq(vo);
			
			System.out.println("seq: " + vo.getFAQ_seq());
			System.out.println("seq: " + vo.getFAQ_fileName());
			System.out.println("seq: " + vo.getFAQ_file());
			System.out.println("getFaq: " + getFaq(vo));
			
			if(vo.getFAQ_fileName() != null) { // isEmpty() : ????????? ??? ?????? ?????? ????????? ??????(????????? true ??????) 
				String key = vo.getFAQ_fileName();
				String uploadFolder = "https://doublejo.s3.ap-northeast-2.amazonaws.com/";
				String fileName = key.replaceAll(uploadFolder, ""); // ????????? 
				System.out.println("????????? key : " + fileName);
				AwsS3 awsS3 = AwsS3.getInstance();
				awsS3.delete(fileName);
				System.out.println(fileName);
			}
			
			delete(vo); // seq ????????? vo ??? ???????????????
			System.out.println("serviceDelete: " + seq);
		}
	}
	
	@Override
	public FaqVO getFaq(FaqVO vo) {
		return faq.getFaq(vo);
	}
	
	@Override
	public void insert(FaqVO vo) {
		faq.insert(vo);
	}
	
	@Override
	public void update(FaqVO vo) {
		faq.update(vo);
	}
	
	@Override
	public boolean checkPW(FaqVO vo) {
		return faq.checkPW(vo);
	}
	
	
}

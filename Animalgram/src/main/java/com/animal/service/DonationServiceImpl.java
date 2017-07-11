package com.animal.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.animal.domain.Criteria;
import com.animal.domain.DonationAttachVO;
import com.animal.domain.DonationVO;
import com.animal.domain.SearchCriteria;
import com.animal.persistence.DonationDAO;

@Service
public class DonationServiceImpl implements DonationService {

	//Controller ----> Service ----> DAO  -----> XML(sql문)
	
	@Inject
	private DonationDAO dao;
	
	  @Transactional
	  @Override
	  public void regist(DonationVO dvo) throws Exception {
	  
	
/*	    String[] files = dvo.getFiles();
	    
	    if(files == null) { return; } 
	    
	    for (String fileName : files) {
	    	dattachvo.setFullName(fileName);
	    	System.out.println("serviceImple-dao.create(vo) :"+dvo);*/
	    	System.out.println("DoserviceImpl create :"+dvo);
		  dao.create(dvo);
	 
	    /*	dattachvo.setDno(dvo.getDno());*/
	  	//====================================================================================================
	    	
	    /*	System.out.println("serviceImpl-avo :"+dattachvo); 
	    	int attach = dao.addAttach(dattachvo);
	    	System.out.println("donationServiceImpl-dao.addAttach : "+ attach);*/

	//====================================================================================================
		    	
	    	
	    	//dao.addAttach(avo);
/*	      System.out.println("dao.addAttach(avo) :"+dattachvo);
	  
	    }   */

	  }
	  
/*	@Override
	public void modify(BoardVO vo) throws Exception {
		 dao.update(vo);
	}*/
	  
	  @Transactional
	  @Override
	  public void modify(DonationVO dvo) throws Exception {
	    dao.update(dvo);
	    
	  /*  int dno = dvo.getDno();
	    
	    dao.deleteAttach(dno);
	    
	    String[] files = dvo.getFiles();
	    
	    if(files == null) { return; } 
	    
	    for (String fileName : files) {
	      dao.replaceAttach(fileName, dno);
	    }*/
	  }
	  
	  

	@Override
	public void remove(int dno) throws Exception {
		/*dao.deleteAttach(dno);*/
		dao.delete(dno);
	}

	@Override
	public DonationVO read(int dno) throws Exception {
		return dao.read(dno);
	}

	@Override
	public List<DonationVO> listAll() throws Exception {
		return dao.listAll();
	}

	@Override
	public List<DonationVO> listCriteria(Criteria cri) throws Exception {		
		return dao.listCriteria(cri);
	}

	@Override
	public int listCountCriteria() throws Exception {
		return dao.countPaging();
	}

	@Override
	public List<DonationVO> listSearchCriteria(SearchCriteria cri) throws Exception {
		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return dao.listSearchCount(cri);
	}

/*	@Override
	public List<String> getAttach(int dno) throws Exception {
		System.out.println("서비스임플 ======");
		return dao.getAttach(dno);
	}

	@Override
	public int deleteAttach(int dno) throws Exception {
		return dao.deleteAttach(dno);
	}*/

	@Override
	public int sellcount(DonationVO dvo) throws Exception {
		return dao.sellcount(dvo);
	}
}

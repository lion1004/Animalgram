package com.animal.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.animal.domain.Criteria;
import com.animal.domain.CustomAttachVO;
import com.animal.domain.CustomVO;
import com.animal.domain.SearchCriteria;
import com.animal.persistence.CustomDAO;

@Service
public class CustomServiceImpl implements CustomService {

	//Controller ----> Service ----> DAO  -----> XML(sql문)
	 HttpSession session;
	@Inject
	private CustomDAO dao;
	
	  @Transactional
	  @Override
	  public void regist(CustomVO vo,CustomAttachVO avo) throws Exception {
	  
	
	    String[] files = vo.getFiles();
	    
	    if(files == null) { return; } 
	    
	    for (String fileName : files) {
	    	avo.setFullName(fileName);
	    	System.out.println("serviceImple-dao.create(vo) :"+vo);
	    	dao.create(vo);
	 
	    	avo.setCuno(vo.getCuno());
	  	//====================================================================================================
	    	
	    	System.out.println("serviceImpl-avo :"+avo); 
	    	int attach = dao.addAttach(avo);
	    	System.out.println("customServiceImpl-dao.addAttach : "+ attach);

	//====================================================================================================
		    	
	    	
	    	//dao.addAttach(avo);
	      System.out.println("dao.addAttach(avo) :"+avo);
	  
	    }   

	  }
	  
/*	@Override
	public void modify(BoardVO vo) throws Exception {
		 dao.update(vo);
	}*/
	  
	  @Transactional
	  @Override
	  public void modify(CustomVO vo) throws Exception {
	    dao.update(vo);
	    
	    int cuno = vo.getCuno();
	    
	    dao.deleteAttach(cuno);
	    
	    String[] files = vo.getFiles();
	    
	    if(files == null) { return; } 
	    
	    for (String fileName : files) {
	      dao.replaceAttach(fileName, cuno);
	    }
	  }
	  
	  

	@Override
	public void remove(int cuno) throws Exception {
		dao.deleteAttach(cuno);
		dao.delete(cuno);
	}

	@Override
	public CustomVO read(int cuno) throws Exception {
		return dao.read(cuno);
	}

	@Override
	public List<CustomVO> listAll() throws Exception {
		return dao.listAll();
	}

	@Override
	public List<CustomVO> listCriteria(Criteria cri) throws Exception {		
		return dao.listCriteria(cri);
	}

	@Override
	public int listCountCriteria() throws Exception {
		return dao.countPaging();
	}

	@Override
	public List<CustomVO> listSearchCriteria(SearchCriteria cri) throws Exception {
		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return dao.listSearchCount(cri);
	}

	@Override
	public List<String> getAttach(int cuno) throws Exception {
		System.out.println("서비스임플 ======");
		return dao.getAttach(cuno);
	}

	@Override
	public int deleteAttach(int cuno) throws Exception {
		return dao.deleteAttach(cuno);
	}


}

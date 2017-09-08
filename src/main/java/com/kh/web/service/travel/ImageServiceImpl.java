package com.kh.web.service.travel; 
  
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.web.model.travel.dao.ImageDAO;
import com.kh.web.model.travel.dto.ImageVO; 
  
@Service 
public class ImageServiceImpl implements ImageService{ 
    @Inject 
    ImageDAO imageDao; 
     
    @Transactional 
    @Override 
    
    
    public List<ImageVO> imageList() throws Exception { 
    	 
 
    	return imageDao.imageList();
    } 
  
}
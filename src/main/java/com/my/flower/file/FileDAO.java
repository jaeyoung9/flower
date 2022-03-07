package com.my.flower.file;


import java.util.Map;

import org.springframework.stereotype.Repository;

import com.my.flower.common.dao.AbstractDAO;

@Repository
public class FileDAO extends AbstractDAO {

    public void insertgoodsimg(Map<String, Object> map) {
        insert("file.insertgoodsimg", map);
    }
    
    public void insertgoodsthumb(Map<String, Object> map) {
        insert("file.insertgoodsthumb", map);
    }
    
    public void insertnotice(Map<String, Object> map) {
        insert("notice.noticeWrite", map);
    }
}

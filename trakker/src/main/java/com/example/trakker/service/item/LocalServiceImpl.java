package com.example.trakker.service.item;

import com.example.trakker.model.item.LocalDAO;
import com.example.trakker.model.item.LocalDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class LocalServiceImpl implements LocalService{
    @Autowired
    private LocalDAO localDAO;

    @Transactional(readOnly = true)
    @Override
    public int localCount() {return localDAO.getCount();}

    @Transactional(readOnly=true)
    @Override
    public LocalDTO selectLocal(Integer lNum) {
        return localDAO.getLocal(lNum);
    }

    @Transactional(readOnly=true)
    @Override
    public List<LocalDTO> localList() {
        return localDAO.getList();
    }
}

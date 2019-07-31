package com.zhongruan.service.impl;
import com.zhongruan.dao.IUserDao;
import com.zhongruan.entity.User;
import com.zhongruan.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements IUserService {
    @Autowired
    private  IUserDao iUserDao;
    @Override
    public User getById(User user) {
        return iUserDao.selectById(user);
    }

    @Override
    public User queryById(int id) {
        return iUserDao.queryById(id);
    }

    @Override
    public int updateById(User user) {
        return iUserDao.updateById(user);
    }

    @Override
    public int deleteUserById(User user) {
        return iUserDao.delete(user);
    }

    @Override
    public int delByIds(Long[] ids) {
        return iUserDao.deleteByIds(ids);
    }

    @Override
    public int add(User user) {
        return iUserDao.add(user);
    }

    @Override
    public int query(User user) {
        return iUserDao.query(user);
    }

    @Override
    public List<User> getList() {
        return iUserDao.getList();
    }

}

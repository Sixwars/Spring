package com.zhongruan.dao;

import com.zhongruan.entity.User;

import java.util.List;

public interface IUserDao {
    User selectById(User user);
    int updateById(User user);
    int add (User user);
    int delete(User user);
    int query(User user);
    User queryById(int id);
    List<User> getList();
    int deleteByIds(Long[] ids);
}

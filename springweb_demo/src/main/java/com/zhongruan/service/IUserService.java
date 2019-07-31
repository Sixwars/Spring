package com.zhongruan.service;


import com.zhongruan.entity.User;

import java.util.List;

public interface IUserService {
    User getById(User user);
    User queryById(int id);
    int updateById(User user);
    int deleteUserById(User user);
    int delByIds(Long[]ids);
    int add(User user);
    int query(User user);
    List<User> getList();
}

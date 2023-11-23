package service;

import mapper.Usermapper;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import pojo.User;
import utils.SqlSessionFactoryutils;

import java.util.List;

public class UserService {
    SqlSessionFactory sqlSessionFactory = SqlSessionFactoryutils.getSqlSessionFactory();


    //登录方法
    public User login(String username, String password) {
        SqlSession sqlSession = sqlSessionFactory.openSession();
        Usermapper mapper = sqlSession.getMapper(Usermapper.class);
        User user = mapper.select(username, password);
        sqlSession.close();
        return user;
    }

    //查找全部
    public List<User> selectAll() {

        SqlSession sqlSession = sqlSessionFactory.openSession();
        Usermapper mapper = sqlSession.getMapper(Usermapper.class);
        List<User> users = mapper.selectAll();
        sqlSession.close();
        return users;

    }

    //注册方法
    public boolean register(User user) {
        SqlSession sqlSession = sqlSessionFactory.openSession();
        Usermapper mapper = sqlSession.getMapper(Usermapper.class);
        User u = mapper.selectByname(user.getUsername());
        if (u == null) {
            mapper.add(user);
            sqlSession.commit();

        }
        sqlSession.close();
        return u == null;//不存在true 存在false


    }
    //查找全部

}

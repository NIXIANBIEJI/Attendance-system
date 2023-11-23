package mapper;

import org.apache.ibatis.annotations.Param;
import pojo.User;

import java.util.List;

public interface Usermapper {
    User select(@Param("username") String username, @Param("password") String password);
    User selectByname(@Param("username") String username);
    void add(User user);
    List<User> selectAll();
}

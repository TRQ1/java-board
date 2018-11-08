package utils;

import utils.CookieUtils;
import vo.UserVo;
import dao.UserDao;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class Login {

    public void userLoignCheck(HttpServletResponse response, String userName, String userPasswd) throws IOException {

        String userGId = null;
        String userGPass = null;
        CookieUtils cookieUtils = new CookieUtils();

        do {
            UserVo userVo = new UserVo();
            UserDao userDao = new UserDao();

            userDao.sqlLogin();
            userGId = userVo.getUserid();
            userGPass = userVo.getUserpasswd();

        } while (userName.equals(userGId) && userPasswd.equals(userGPass));
            cookieUtils.createCookie(response, "loginId", userName);
            response.sendRedirect("lists.jsp");
    }
}

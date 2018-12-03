package utils;

import com.sun.deploy.net.HttpRequest;
import com.sun.xml.internal.ws.policy.privateutil.PolicyUtils;
import utils.CookieUtils;
import vo.UserVo;
import dao.UserDao;
import utils.SessionUtils;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class Login {

    SessionUtils sessionUtils = new SessionUtils();

    public void userLoignCheck(HttpServletRequest request, HttpServletResponse response, String userName, String userPasswd) throws IOException {

        String userGId = "";
        String userGPass = "";
        int userAuth = 0;

        do {
            UserVo userVo = new UserVo();
            UserDao userDao = new UserDao();


            userDao.sqlLogin();
            userGId = userVo.getUserid();
            userGPass = userVo.getUserpasswd();
            userAuth = userVo.getAuthority();

        } while (userName.equals(userGId) && userPasswd.equals(userGPass));
            sessionUtils.createSession(request, userName);
            sessionUtils.getSession(request, userName);
            response.sendRedirect("index.jsp");
    }

    public void vistorLoginCheck(HttpServletRequest request, HttpServletResponse response) throws IOException {
        sessionUtils.createSession(request, "vistor");
        sessionUtils.getSession(request, "vistor");
        response.sendRedirect("index.jsp");
    }
}

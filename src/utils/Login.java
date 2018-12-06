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
    UserDao userDao = new UserDao();

    public void userLoignCheck(HttpServletRequest request, HttpServletResponse response, String userName, String userPasswd) throws IOException {

        String userGId = "";
        String userGPass = "";
        int bc = 0;

        do {
            UserVo userVo = new UserVo();
            userDao.sqlLogin();
            userGId = userVo.getUserid();
            userGPass = userVo.getUserpasswd();
            bc = userDao.getAuth(userName);

        } while (userName.equals(userGId) && userPasswd.equals(userGPass));
            sessionUtils.createSession(request, userName);
            sessionUtils.getSession(request, userName);
            response.sendRedirect("index.jsp?bc=" + bc);
    }

    public void vistorLoginCheck(HttpServletRequest request, HttpServletResponse response) throws IOException {
        sessionUtils.createSession(request, "vistor");
        sessionUtils.getSession(request, "vistor");
        response.sendRedirect("index.jsp?bc=0");
    }

    public String checkAuth(HttpServletRequest request, HttpServletResponse response, String userName) {
        int authCode = userDao.getAuth(userName);
        String userAuth = null;

        if (authCode == 0) {
            userAuth = "guest";
        } else if(authCode == 1) {
            userAuth = "admin";
        } else if(authCode == 2) {
            userAuth = "gold";
        } else if(authCode == 3) {
            userAuth = "sliver";
        } else if (authCode == 4) {
            userAuth = "copper";
        }
        return userAuth;
    }

}

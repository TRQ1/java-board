package dao;

import java.sql.SQLException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import utils.DBConnect;
import vo.UserVo;

public class UserDao {
    DBConnect dbConnect = new DBConnect();

    public ArrayList<UserVo> sqlLogin() {

        Connection conn = dbConnect.connDb(); // DB connection 메소드 호출
        PreparedStatement pstm = null;
        ResultSet rs = null;

        ArrayList<UserVo> userList = new ArrayList<UserVo>();

        try {
            String sqlAccount = "SELECT id, userid, userpasswd, authority FROM account";
            pstm = conn.prepareStatement(sqlAccount);
            rs = pstm.executeQuery(sqlAccount);

            while (rs.next()) {

                UserVo userVo = new UserVo();
                userVo.setId(rs.getInt(1));
                userVo.setUserid(rs.getString(2));
                userVo.setUserpasswd(rs.getString(3));
                userVo.setAuthority(rs.getInt(4));
                userList.add(userVo);

            }
        } catch (SQLException e) {
        } finally {
            dbConnect.close(pstm, conn);
            dbConnect.resultClose(rs);
        } return userList;
    }

    /**
     * 계정에 대한 패스워드 확인하는 메소드
     */
    public String sqlGetPasswd(String userId) {
        PreparedStatement pstm = null;
        ResultSet rs = null;
        Connection conn = dbConnect.connDb();
        String password = "";
        try {
            String sqlPasswd = "SELECT userpasswd FROM account WHERE userid=?";
            pstm = conn.prepareStatement(sqlPasswd);
            pstm.setString(1, userId);
            rs = pstm.executeQuery(sqlPasswd);

            if (rs.next()) {
                password = rs.getString(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        } finally {
            dbConnect.close(pstm, conn);
            dbConnect.resultClose(rs);
        }
        return password;
    }
}

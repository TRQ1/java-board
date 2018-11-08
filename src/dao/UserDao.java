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
            String sqlAccount = "SELECT id, userid, userpasswd FROM account";
            pstm = conn.prepareStatement(sqlAccount);
            rs = pstm.executeQuery(sqlAccount);

            while (rs.next()) {

                UserVo userVo = new UserVo();
                userVo.setId(rs.getInt(1));
                userVo.setUserid(rs.getString(2));
                userVo.setUserpasswd(rs.getString(3));
                userList.add(userVo);

            }
        } catch (SQLException e) {
        } finally {
            dbConnect.close(pstm, conn);
            dbConnect.resultClose(rs);
        } return userList;
    }
}

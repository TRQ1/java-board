package dao;

import utils.DBConnect;

import java.sql.SQLException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import vo.BoardVo;

public class BoardDao {

    DBConnect dbconnect = new DBConnect();

    /**
     * SQLCount 쿼리를 위한 메소드
     */

    public int sqlCount() {
        PreparedStatement pstm = null;
        ResultSet rs = null;
        Connection conn = dbconnect.connDb();
        int total = 0;
        try {
            String sqlCount = "SELECT COUNT(*) FROM board";
            pstm = conn.prepareStatement(sqlCount);
            rs = pstm.executeQuery(sqlCount);

            if (rs.next()) {
                total = rs.getInt(1); // select문 count 값
            }
        } catch (SQLException e) {
            System.out.println(e);
        } finally {
            dbconnect.close(pstm, conn);
            dbconnect.resultClose(rs);
        }
        return total;
    }

    /**
     * 게시판 글 패스워드를 확인 하기위한 메소드
     */
    public String sqlPasswd(int idx) {
        PreparedStatement pstm = null;
        ResultSet rs = null;
        Connection conn = dbconnect.connDb();
        String password = "";
        try {
            String sqlPasswd = "SELECT passwd FROM board WHERE id=" + idx;
            pstm = conn.prepareStatement(sqlPasswd);
            rs = pstm.executeQuery(sqlPasswd);

            if (rs.next()) {
                password = rs.getString(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        } finally {
            dbconnect.close(pstm, conn);
            dbconnect.resultClose(rs);
        }
        return password;
    }

    public void sqlDelete(int idx) {
        PreparedStatement pstm = null;
        Connection conn = dbconnect.connDb();
        try {
            String sqlDelete = "DELETE FROM board WHERE id=" + idx;
            System.out.println(sqlDelete);
            pstm = conn.prepareStatement(sqlDelete);
            pstm.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        } finally {
            dbconnect.close(pstm, conn);
        }
    }

    /**
     * 게시판 정보를 읽어드리기위한 메소드
     */
    public void sqlSelect(int idx) {
        PreparedStatement pstm = null;
        ResultSet rs = null;
        Connection conn = dbconnect.connDb();
        String authorSelect = "";
        String titleSelect = "";
        String contentSelect = "";
        String todateSelect = "";
        try {
            String sqlSelect = "SELECT author, title, content, todate FROM board WHERE id=" + idx;
            pstm = conn.prepareStatement(sqlSelect);
            rs = pstm.executeQuery(sqlSelect);

            if (rs.next()) {
                authorSelect = rs.getString(1);
                titleSelect = rs.getString(2);
                contentSelect = rs.getString(3);
                todateSelect = rs.getString(4);
            }
        } catch (SQLException e) {
            System.out.println(e);
        } finally {
            dbconnect.close(pstm, conn);
            dbconnect.resultClose(rs);
        }
        return;
    }

    /**
     * sqlList를 리턴하기 위한 class
     */
    /**
     *
     * @param start
     * @param end
     * 게시판 글 리스트를 읽어드리기 위한 메소드
     */
    public void sqlList(int start, int end) {
        PreparedStatement pstm = null;
        ResultSet rs = null;
        Connection conn = dbconnect.connDb();
        int id = 0;
        String author = "";
        String todate = "";
        String title = "";
        String todateBefore = "";
        String checkTitle = "";
        try {
            String sqlList = "SELECT id, author, title, todate from board where id >=" + start + " and id <= " + end + " order by id DESC";
            pstm = conn.prepareStatement(sqlList);
            rs = pstm.executeQuery(sqlList);

            while (rs.next()) {
                id = rs.getInt(1);
                author = rs.getString(2);
                checkTitle = rs.getString(3);
                todateBefore = rs.getString(4);
                todate = todateBefore.substring(0, todateBefore.length() - 2); // 소수점 자르기 추후 데이터 타입 나오게 할 예정

                // checkTitle 에 200자 이상인 경우 ... 을 붙인다.
                int titleLen = checkTitle.length();

                if (titleLen > 200) { // 200 이상인 경우 titlelen 숫자에서 - 10 을 한후 뒤에 ... 을 붙인다.
                    title = checkTitle.substring(0, titleLen - 10) + "...";
                } else {
                    title = checkTitle;
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        } finally {
            dbconnect.close(pstm, conn);
            dbconnect.resultClose(rs);
        }
    }

    /**
     *
     * @param title
     * @param content
     * 게시판 글 제목 및 내용을 수정하기위한 메소드
     */
    public void sqlUpdate(String title, String content, int idx) {
        PreparedStatement pstm = null;
        Connection conn = dbconnect.connDb();
        try {
            String sqlUpdate = "UPDATE board SET title='" + title + "' ,content='" + content + "' WHERE id=" + idx;
            pstm = conn.prepareStatement(sqlUpdate);
            pstm.executeUpdate(sqlUpdate);
        } catch (SQLException e) {
            System.out.println(e);
        } finally {
            dbconnect.close(pstm, conn);
        }
    }

    /**
     *
     * @param authorInsert
     * @param passwordInsert
     * @param titleInsert
     * @param contentInsert
     *
     * 게시판 글을 쓰기 위한 메소드
     */
    public void sqlInsert(BoardVo boardVo, String kindType, int parentInsert) {
        PreparedStatement pstm = null;
        Connection conn = dbconnect.connDb();
        try {
            String sqlInsert = "INSERT INTO board(author,passwd,title,content,type,parent,todate) VALUES(?,?,?,?,?,?,NOW())";
            System.out.println(sqlInsert);
            pstm = conn.prepareStatement(sqlInsert);
            pstm.setString(1, boardVo.getAuthor());
            pstm.setString(2, boardVo.getPassword());
            pstm.setString(3, boardVo.getTitle());
            pstm.setString(4, boardVo.getContent());
            if (kindType == "post") {
                pstm.setString(5, kindType);
            } else if (kindType == "comment") {
                pstm.setString(5, kindType);
            }
            pstm.setInt(6, parentInsert + 1);
            pstm.execute();
        } catch (SQLException e) {
            System.out.println(e);
        } finally {
            dbconnect.close(pstm, conn);
        }
    }

    public void sqlReplyInsert(BoardVo boardVo, String kindType, int parentInsert, int indentInsert, int stepInsert) {
        PreparedStatement pstm = null;
        Connection conn = dbconnect.connDb();
        try {
            String sqlInsert = "INSERT INTO board(author,passwd,title,content,type,parent,indent,step,todate) VALUES(?,?,?,?,?,?,?,?,NOW())";
            System.out.println(sqlInsert);
            pstm = conn.prepareStatement(sqlInsert);
            pstm.setString(1, boardVo.getAuthor());
            pstm.setString(2, boardVo.getPassword());
            pstm.setString(3, boardVo.getTitle());
            pstm.setString(4, boardVo.getContent());
            if (kindType == "post") {
                pstm.setString(5, kindType);
            } else if (kindType == "comment") {
                pstm.setString(5, kindType);
            }
            pstm.setInt(6, parentInsert);
            pstm.setInt(7, indentInsert + 1);
            pstm.setInt(8, stepInsert + 1);
            pstm.execute();

        } catch (SQLException e) {
            System.out.println(e);
        } finally {
            dbconnect.close(pstm, conn);
        }
    }
}

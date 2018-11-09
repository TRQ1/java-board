package dao;

import java.sql.SQLException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import utils.DBConnect;
import vo.CommentVo;

public class CommentDao {

    DBConnect dbconnect = new DBConnect();

    /**
     * 댓글 수에 대한 전체 갯수 확인하기 위한 메소드
     * @return
     */
    public int sqlCountComment(int idx) {
        PreparedStatement pstm = null;
        ResultSet rs = null;
        Connection conn = dbconnect.connDb();
        int total = 0;
        try {
            String sqlCount = "SELECT COUNT(*) FROM comment where parent=?";
            pstm = conn.prepareStatement(sqlCount);
            pstm.setInt(1, idx);
            rs = pstm.executeQuery(sqlCount);

            if (rs.next()) {
                total = rs.getInt(1);
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
     * 회원이 댓글을 쓰기 위한 쿼리 매소드
     */
    public void sqlInsertAcoountCommnet(CommentVo commentVo, int parentInsert) {
        PreparedStatement pstm = null;
        Connection conn = dbconnect.connDb();
        try {
            String sqlInsert = "INSERT INTO comment(author,content,parent,todate) VALUES(?,?,?,NOW())";
            System.out.println(sqlInsert);
            pstm = conn.prepareStatement(sqlInsert);
            pstm.setString(1, commentVo.getAuthor());
            pstm.setString(2, commentVo.getContent());
            pstm.setInt(3, parentInsert);
            pstm.execute();
        } catch (SQLException e) {
            System.out.println(e);
        } finally {
            dbconnect.close(pstm, conn);
        }
    }
    /**
     *
     */
    public ArrayList<CommentVo> sqlBoardDetailList(int idx) {

        PreparedStatement pstm = null;
        ResultSet rs = null;
        Connection conn = dbconnect.connDb();

        ArrayList<CommentVo> commentList = new ArrayList<CommentVo>();

        try {
            String sqlList = "SELECT author, content, todate from comment where parent=? ORDER BY id DESC";
            pstm = conn.prepareStatement(sqlList);
            pstm.setInt(1, idx);
            rs = pstm.executeQuery();

            while(rs.next()) {
                CommentVo commentVo = new CommentVo();
                commentVo.setAuthor(rs.getString(1));
                commentVo.setContent(rs.getString(2));
                commentVo.setTodate(rs.getDate(3));
                commentList.add(commentVo);
            }

        } catch (SQLException e) {
            System.out.println(e);
        } finally {
            dbconnect.close(pstm, conn);
            dbconnect.resultClose(rs);
        }
        return commentList;

    }

    /**
     * 방문자가 댓글을 쓰기 위한 쿼리 메소드
     */

    public void sqlInsertVistorCommnet(CommentVo commentVo, int parentInsert) {
        PreparedStatement pstm = null;
        Connection conn = dbconnect.connDb();
        try {
            String sqlInsert = "INSERT INTO comment(author,passwd,content,parent,todate) VALUES(?,?,?,?,NOW())";
            System.out.println(sqlInsert);
            pstm = conn.prepareStatement(sqlInsert);
            pstm.setString(1, commentVo.getAuthor());
            pstm.setString(2, commentVo.getPasswd());
            pstm.setString(3, commentVo.getContent());
            pstm.setInt(4, parentInsert);
            pstm.execute();
        } catch (SQLException e) {
            System.out.println(e);
        } finally {
            dbconnect.close(pstm, conn);
        }
    }

    /**
     * Comment를 수정하기위한 메소드
     */
    public void sqlCommentUpdate(String content, int idx) {
        PreparedStatement pstm = null;
        Connection conn = dbconnect.connDb();
        try {
            String sqlUpdate = "UPDATE comment SET content=? , todate=NOW() WHERE id=?";
            System.out.println(sqlUpdate);
            pstm = conn.prepareStatement(sqlUpdate);
            pstm.setString(1, content);
            pstm.setInt(2, idx);
            pstm.executeUpdate(sqlUpdate);
        } catch (SQLException e) {
            System.out.println(e);
        } finally {
            dbconnect.close(pstm, conn);
        }
    }

    /**
     * 해당되는 comment ID값을 가져오기 위한 메소드
     * @return
     */
    public int sqlSelectCommentId(String content, int parent) {
        PreparedStatement pstm = null;
        ResultSet rs = null;
        Connection conn = dbconnect.connDb();
        int id = 0;
        try {
            String sqlSelect = "SELECT id from comment where content=? and parent=?";
            pstm = conn.prepareStatement(sqlSelect);
            pstm.setString(1, content);
            pstm.setInt(2, parent);
            rs = pstm.executeQuery();
            if (rs.next()) {
                id = rs.getInt(1); // select문 count 값
            }
        } catch (SQLException e) {
            System.out.println(e);
        } finally {
            dbconnect.close(pstm, conn);
            dbconnect.resultClose(rs);
        }
        return id;
    }

    /**
     * Comment 패스워드를 체크하기위한 메소드
     */
    public String sqlCommentPasswd(int idx) {
        PreparedStatement pstm = null;
        ResultSet rs = null;
        Connection conn = dbconnect.connDb();
        String password = "";
        try {
            String sqlPasswd = "SELECT passwd FROM comment WHERE id=" + idx;
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

    /**
     * Comment를 삭제하기위한 메소드
     */
    public void sqlCommentDelete(int idx) {
        PreparedStatement pstm = null;
        Connection conn = dbconnect.connDb();
        try {
            String sqlDelete = "DELETE FROM comment WHERE id=?";
            System.out.println(sqlDelete);
            pstm = conn.prepareStatement(sqlDelete);
            pstm.setInt(1, idx);
            pstm.executeUpdate(sqlDelete);

        } catch (SQLException e) {
            System.out.println(e);
        } finally {
            dbconnect.close(pstm, conn);
        }
    }
}

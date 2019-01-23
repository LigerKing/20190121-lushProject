package bean;

import java.sql.*;
import java.util.ArrayList;

public class BoardDAO {
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	
	String url = "jdbc:mysql://localhost:3306/web";
	String user = "root";
	String password = "1234";
	
	public BoardDAO() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (Exception e) {}
	}
	
	
	// 게시글 작성
	public void insertText(BoardDTO dto) throws Exception{ 
		int hits = 0;
		int maxNo = 0;
		int indent = 0;
		int step = 0;
		
		try {
			con = DriverManager.getConnection(url, user, password);
			
			String sql = "select MAX(no) from board";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				maxNo = rs.getInt(1);
			}
			
			sql = "insert into board(title, content, writer, day, hits, ref, indent, step) values (?,?,?,?,?,?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getTitle());
			ps.setString(2, dto.getContent());
			ps.setString(3, dto.getWriter());
			ps.setString(4, dto.getDay());
			ps.setInt(5, hits);
			ps.setInt(6, maxNo+1);
			ps.setInt(7, indent);
			ps.setInt(8, step);
			
			
			ps.executeUpdate();
		}finally {
			if(rs != null) rs.close();
			if(ps != null) ps.close();
			if(con != null) con.close();
		}
	}

	
	// 게시글 수정
	public void boardUpdate(BoardDTO dto) throws Exception{
		try {
			con = DriverManager.getConnection(url, user, password);
			
			String sql = "update board set title = ?, content = ? where no = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getTitle());
			ps.setString(2, dto.getContent());
			ps.setInt(3, dto.getNo());
			
			ps.executeUpdate();
		}finally {
			if(ps != null) ps.close();
			if(con != null) con.close();
		}
	}
		
		
	// 게시글 삭제
	public void boardDelete(BoardDTO dto) throws Exception{
		try {
			con = DriverManager.getConnection(url, user, password);
			
			String sql = "delete from board where no = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, dto.getNo());
			
			ps.executeUpdate();
		}finally {
			if(ps != null) ps.close();
			if(con != null) con.close();
		}
	}
		
	
	// 게시글 상세보기
	public BoardDTO selectDetail(int no) throws Exception{
		BoardDTO dto = null;
		try {
			con = DriverManager.getConnection(url, user, password);
			
			String sql = "select * from board where no = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				dto = new BoardDTO();
				dto.setNo(rs.getInt("no"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setWriter(rs.getString("writer"));
				dto.setDay(rs.getString("day"));
				dto.setHits(rs.getInt("hits"));
			}
		}finally {
			if(rs != null) rs.close();
			if(ps != null) ps.close();
			if(con != null) con.close();
		}
		return dto;
	}
	
	
	// 조회수 카운트
	public void countHits(int no) throws Exception{
		BoardDAO dao = new BoardDAO();
		BoardDTO dto = dao.selectDetail(no);
		int hits = dto.getHits();
		hits++;
		try {
			con = DriverManager.getConnection(url, user, password);
			
			String sql = "update board set hits = ? where no = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, hits);
			ps.setInt(2, no);
			
			ps.executeUpdate();
		}finally {
			if(ps != null) ps.close();
			if(con != null) con.close();
		}
	}
	
	
	// 답글 쓰기
	public void insertReply(BoardDTO dto) throws Exception{
		int hits = 0;
		int ref = 0;
		int indent = 0;
		int step = 0;
		
		try {
			con = DriverManager.getConnection(url, user, password);
			
			String sql = "select ref, indent, step from board where no = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, dto.getNo());
			
			rs = ps.executeQuery();
			if(rs.next()) {
				ref = rs.getInt(1);
				indent = rs.getInt(2);
				step = rs.getInt(3);
			}
			
			sql = "update board set step = step + 1 where ref = " + ref + " and step > " + step;
			ps = con.prepareStatement(sql);
			ps.executeUpdate();
			
			sql = "insert into board(title, content, writer, day, hits, ref, indent, step) values (?,?,?,?,?,?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getTitle());
			ps.setString(2, dto.getContent());
			ps.setString(3, dto.getWriter());
			ps.setString(4, dto.getDay());
			ps.setInt(5, hits);
			ps.setInt(6, ref);
			ps.setInt(7, indent + 1);
			ps.setInt(8, step + 1);
			
			ps.executeUpdate();
		}finally {
			if(rs != null) rs.close();
			if(ps != null) ps.close();
			if(con != null) con.close();
		}
	}
	
	
	
	// 게시물 개수(페이징 처리를 위해 사용됨)
	public int boardCount(String col, String word) throws Exception{
		int total = 0;
		try {
			con = DriverManager.getConnection(url, user, password);
			
			if(col.equals("") || word.equals("")) {
				String sql = "select count(*) from board";
				ps = con.prepareStatement(sql);
				
				rs = ps.executeQuery();
				
			}else if(col.equals("none")) {
				String sql = "select count(*) from board where title like ? or content like ? or writer like ?";
				ps = con.prepareStatement(sql);
				ps.setString(1, "%"+word+"%");
				ps.setString(2, "%"+word+"%");
				ps.setString(3, "%"+word+"%");
				
				rs = ps.executeQuery();
				
			}else if(col.equals("title")) {
				String sql = "select count(*) from board where title like ?";
				ps = con.prepareStatement(sql);
				ps.setString(1, "%"+word+"%");
				
				rs = ps.executeQuery();
				
			}else if(col.equals("content")) {
				String sql = "select count(*) from board where content like ?";
				ps = con.prepareStatement(sql);
				ps.setString(1, "%"+word+"%");
				
				rs = ps.executeQuery();
				
			}else if(col.equals("writer")) {
				String sql = "select count(*) from board where writer like ?";
				ps = con.prepareStatement(sql);
				ps.setString(1, "%"+word+"%");
				
				rs = ps.executeQuery();
				
			}
			
			if(rs.next()) {
				total = rs.getInt(1);
			}
		}finally {
			if(rs != null) rs.close();
			if(ps != null) ps.close();
			if(con != null) con.close();
		}
		return total;
	}
	
	
	
	// 게시물 출력(기본 출력은 모든 게시물, 조건 출력은 검색에 맞는 게시물)
	public ArrayList<BoardDTO> boardList(String col, String word, int start, int end) throws Exception{
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		int sortNum = 1;
		
		try {
			con = DriverManager.getConnection(url, user, password);
			
			if(col.equals("") || word.equals("")) {
				con = DriverManager.getConnection(url, user, password);
				
				String sql = "select no from board order by ref desc, step asc";
				ps = con.prepareStatement(sql);
				rs = ps.executeQuery();
				while(rs.next()) {
					int stepNum = rs.getInt(1);
					sql = "update board set step2 = " + sortNum + " where no = " + stepNum;
					ps = con.prepareStatement(sql);
					ps.executeUpdate();
					sortNum++;
				}
				
				sql = "select * from board where step2 >= " + start + " and step2 <= " + end + " order by step2 asc";
				ps = con.prepareStatement(sql);
				
				rs = ps.executeQuery();
				
			}else if(col.equals("none")) {
				String sql = "select no from board where title like ? or content like ? or writer like ? order by ref desc, step asc";
				ps = con.prepareStatement(sql);
				ps.setString(1, "%"+word+"%");
				ps.setString(2, "%"+word+"%");
				ps.setString(3, "%"+word+"%");
				
				rs = ps.executeQuery();
				while(rs.next()) {
					int stepNum = rs.getInt(1);
					sql = "update board set step2 = " + sortNum + " where no = " + stepNum;
					ps = con.prepareStatement(sql);
					ps.executeUpdate();
					sortNum++;
				}
				
				sql = "select * from (select * from board where title like ? or content like ? or writer like ?)a where step2 >= " + start + " and step2 <= " + end + " order by step2 asc";
				ps = con.prepareStatement(sql);
				ps.setString(1, "%"+word+"%");
				ps.setString(2, "%"+word+"%");
				ps.setString(3, "%"+word+"%");
				
				rs = ps.executeQuery();
				
			}else if(col.equals("title")) {
				String sql = "select no from board where title like ? order by ref desc, step asc";
				ps = con.prepareStatement(sql);
				ps.setString(1, "%"+word+"%");
				
				rs = ps.executeQuery();
				while(rs.next()) {
					int stepNum = rs.getInt(1);
					sql = "update board set step2 = " + sortNum + " where no = " + stepNum;
					ps = con.prepareStatement(sql);
					ps.executeUpdate();
					sortNum++;
				}
				
				sql = "select * from (select * from board where title like ?)a where step2 >= " + start + " and step2 <= " + end + " order by step2 asc";
				ps = con.prepareStatement(sql);
				ps.setString(1, "%"+word+"%");
				rs = ps.executeQuery();
				
			}else if(col.equals("content")) {
				String sql = "select no from board where content like ? order by ref desc, step asc";
				ps = con.prepareStatement(sql);
				ps.setString(1, "%"+word+"%");
				
				rs = ps.executeQuery();
				while(rs.next()) {
					int stepNum = rs.getInt(1);
					sql = "update board set step2 = " + sortNum + " where no = " + stepNum;
					ps = con.prepareStatement(sql);
					ps.executeUpdate();
					sortNum++;
				}
				
				sql = "select * from (select * from board where content like ?)a where step2 >= " + start + " and step2 <= " + end + " order by step2 asc";
				ps = con.prepareStatement(sql);
				ps.setString(1, "%"+word+"%");
				
				rs = ps.executeQuery();
				
			}else if(col.equals("writer")) {
				String sql = "select no from board where writer like ? order by ref desc, step asc";
				ps = con.prepareStatement(sql);
				ps.setString(1, "%"+word+"%");
				
				rs = ps.executeQuery();
				while(rs.next()) {
					int stepNum = rs.getInt(1);
					sql = "update board set step2 = " + sortNum + " where no = " + stepNum;
					ps = con.prepareStatement(sql);
					ps.executeUpdate();
					sortNum++;
				}
				
				sql = "select * from (select * from board where writer like ?)a where step2 >= " + start + " and step2 <= " + end + " order by step2 asc";
				ps = con.prepareStatement(sql);
				ps.setString(1, "%"+word+"%");
				
				rs = ps.executeQuery();
				
			}
			
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setNo(rs.getInt("no"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setWriter(rs.getString("writer"));
				dto.setDay(rs.getString("day"));
				dto.setHits(rs.getInt("hits"));
				dto.setRef(rs.getInt("ref"));
				dto.setIndent(rs.getInt("indent"));
				dto.setStep(rs.getInt("step"));
				
				list.add(dto);
			}
		}finally {
			if(rs != null) rs.close();
			if(ps != null) ps.close();
			if(con != null) con.close();
		}
		return list;
	}
	
}









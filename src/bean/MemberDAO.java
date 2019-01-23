package bean;

import java.sql.*;
import java.util.ArrayList;

import com.mysql.jdbc.Connection;



public class MemberDAO {

	java.sql.Connection con;
	DBConnectionMgr pool;
	
	public MemberDAO() {
		pool = DBConnectionMgr.getInstance();
	}
	
	
	
	public boolean login(String id, String pw) throws Exception {
		con = pool.getConnection();
		String sql = "select * from member where id = ? and pw = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, id);
		ps.setString(2, pw);
		boolean result = false;
		
		ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				result = true;
		}
			pool.freeConnection(con,ps);
		return result;
	}
	
	
	
	public MemberDTO select(String input) throws Exception {
		
		con = pool.getConnection();
		//3. SQL문 객체화
		String sql = "select * from member where id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, input);
		
		//4. SQL문 실행 요청
		ResultSet rs = ps.executeQuery();
		MemberDTO dto = null;
		while(rs.next()) { //커서를 옮겨서 레코드가 있는지 체크
			dto = new MemberDTO();
			
			String id = rs.getString(1);
			String pw = rs.getString(2);
			String name = rs.getString(3);
			
			dto.setId(id);
			dto.setPw(pw);
			dto.setName(name);
		}
		return dto;
	}
	
	public void insert(MemberDTO dto) throws Exception {
				
				con = pool.getConnection();
				
				String sql = "insert into member values(?,?,?,?)";
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, dto.getId());
				ps.setString(2, dto.getPw());
				ps.setString(3, dto.getName());
				
				ps.executeUpdate();
				System.out.println("SQL문 요청 완료");
				
	}
	
	public void delete(String id) throws ClassNotFoundException, SQLException{
		Class.forName("com.mysql.jdbc.Driver");
		
		//2. DB연결(->my서버설정+db명+id+pw)
		String url = "jdbc:mysql://localhost:3306/web";
		String user = "root";
		String password = "1234";
		
		java.sql.Connection con = DriverManager.getConnection(url, user, password);
		
		String sql = "delete from member where id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, id);
		ps.executeUpdate();
		ps.close();
		
	}
	
	
	public ArrayList<MemberDTO> selectAll() throws Exception { // 전체조회 메서드
		// 1.드라이버 셋팅
		Class.forName("com.mysql.jdbc.Driver");

		// 2.db연결
		String url = "jdbc:mysql://localhost:3306/web?useUnicode=true&characterEncoding=UTF-8";
		String user = "root";
		String password = "1234";
		java.sql.Connection con = DriverManager.getConnection(url, user, password);

		// 3.sql문 객체화
		String sql = "select * from member";
		PreparedStatement ps = con.prepareStatement(sql);

		// 4.SQL문 실행 요청
		ResultSet rs = ps.executeQuery();
		MemberDTO dto = null;
		ArrayList<MemberDTO> list = new ArrayList<>();
		
		while (rs.next()) {
			dto = new MemberDTO();
			String id = rs.getString("id");
			String pw = rs.getString("pw");
			String name = rs.getString("name");
			
			dto.setId(id);
			dto.setPw(pw);
			dto.setName(name);

			list.add(dto); // while문이 반복될때마다 새로운 주소값을 가진 dto에 id,pw,content,company의 멤버변수를 가리키는 주소값이 저장
			
		} // while문 종료

		return list;

	} // selectAll()종료
	
	
	public MemberDTO update(MemberDTO dto) throws Exception {
		//1. 드라이버(connector) 셋팅
		Class.forName("com.mysql.jdbc.Driver");
		
		//2. DB연결(->my서버설정+db명+id+pw)
		String url = "jdbc:mysql://localhost:3306/web";
		String user = "root";
		String password = "1234";
		
		java.sql.Connection con = DriverManager.getConnection(url, user, password);
		
		//3. SQL문 객체화
		String sql = "update set pw=?, name=? where id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(4, dto.getId());
		ps.setString(1, dto.getPw());
		ps.setString(2, dto.getName());
		
		ps.executeUpdate();
		
		return dto;
		
	}
	
	
} //클래스 종료

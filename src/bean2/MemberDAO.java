package bean2;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean2.MemberDTO;


public class MemberDAO {

	
	public int login(String id, String pw) throws Exception {
		String dbPW = "";
		int x = -1;
		// 1. 드라이버(connector) 셋팅
		Class.forName("com.mysql.jdbc.Driver");

		// 2. DB연결(->my서버설정+db명+id+pw)
		String url = "jdbc:mysql://localhost:3306/web";
		String user = "root";
		String password = "1234";

		Connection con = DriverManager.getConnection(url, user, password);

		// 3. SQL문 객체화
		String sql = "select * from member where id = ? and pw = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, id);
		ps.setString(2, pw);
		
		// 4. SQL문 실행 요청
		ResultSet rs = ps.executeQuery();
		MemberDTO dto = null;
		
		if (rs.next()) { // 커서를 옮겨서 레코드가 있는지 체크
			dbPW = rs.getString("pw");
			if(dbPW.equals(pw)) {
				x = 1;
			} else {
				x = 0;
			}
		} else {
			x = -1;
		}
		return x;
	}
	
	public void delete(String id) throws Exception {
		//1. 드라이버(connector) 셋팅
		Class.forName("com.mysql.jdbc.Driver");
		
		//2. DB연결(->my서버설정+db명+id+pw)
		String url = "jdbc:mysql://localhost:3306/web";
		String user = "root";
		String password = "1234";
		
		Connection con = DriverManager.getConnection(url, user, password);
		
		//3. SQL문 객체화
		String sql = "delete from member2 where id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, id);

		
		//4. SQL문 실행 요청
		ps.executeUpdate();
		System.out.println("SQL문 요청 완료..");
	}
	
	public void insert(MemberDTO dto) throws Exception {
		//1. 드라이버(connector) 셋팅
		Class.forName("com.mysql.jdbc.Driver");
		
		//2. DB연결(->my서버설정+db명+id+pw)
		String url = "jdbc:mysql://localhost:3306/web";
		String user = "root";
		String password = "1234";
		
		
		Connection con = DriverManager.getConnection(url, user, password);
		//3. SQL문 객체화
		String sql = "insert into member2 values (?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getId());
		ps.setString(2, dto.getPw());
		ps.setString(3, dto.getName());
		ps.setString(4, dto.getGender());
		ps.setString(5, dto.getBirthyy());
		ps.setString(6, dto.getBirthmm());
		ps.setString(7, dto.getBirthdd());
		ps.setString(8, dto.getMail1());
		ps.setString(9, dto.getMail2());
		ps.setString(10, dto.getPhone());
		ps.setString(11, dto.getAddress());
		
		//4. SQL문 실행 요청
		ps.executeUpdate();
		System.out.println("SQL문 요청 완료..");
	}
	
	public void update(MemberDTO dto) throws Exception {
		//1. 드라이버(connector) 셋팅
		Class.forName("com.mysql.jdbc.Driver");
		
		//2. DB연결(->my서버설정+db명+id+pw)
		String url = "jdbc:mysql://localhost:3306/web";
		String user = "root";
		String password = "1234";
		
		
		Connection con = DriverManager.getConnection(url, user, password);
		//3. SQL문 객체화
		String sql = "update member2 set pw = ?, mail1 = ?, mail2 = ?, phone = ?, address = ? where id = ? ";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getPw());
		ps.setString(2, dto.getMail1());
		ps.setString(3, dto.getMail2());
		ps.setString(4, dto.getPhone());
		ps.setString(5, dto.getAddress());
		ps.setString(6, dto.getId());
		
		//4. SQL문 실행 요청
		ps.executeUpdate();
		System.out.println("SQL문 요청 완료..");
	}
		
		public ArrayList<MemberDTO> selectAll() throws Exception {
			// 1. 드라이버(connector) 셋팅
			Class.forName("com.mysql.jdbc.Driver");

			// 2. DB연결(->my서버설정+db명+id+pw)
			String url = "jdbc:mysql://localhost:3306/web";
			String user = "root";
			String password = "1234";

			Connection con = DriverManager.getConnection(url, user, password);

			// 3. SQL문 객체화
			String sql = "select * from member2";
			PreparedStatement ps = con.prepareStatement(sql);

			// 4. SQL문 실행 요청
			ResultSet rs = ps.executeQuery();
			System.out.println("start " + rs.getRow());
			
			//해당 row index의 값이 존재하는가? 체크..
			//System.out.println(rs.first());
			//System.out.println(rs.absolute(1));
			
			//해당 ResultSet의 갯수를 구하는 방법..==========
			//rs의 맨 끝으로 이동
			//rs.last();
			//그 맨 끝의 getRow()를 출력
			//System.out.println("레코드의 갯수는 " + rs.getRow());
			
			
			MemberDTO dto = null;
			ArrayList<MemberDTO> list = new ArrayList<>();
			
			while (rs.next()) { // 커서를 옮겨서 레코드가 있는지 체크
				System.out.println("row: " + rs.getRow());
				dto = new MemberDTO();

				String id = rs.getString(1);
				String pw = rs.getString(2);
				String name = rs.getString(3);
				String gender = rs.getString(4);
				String birthyy = rs.getString(5);
				String birthmm = rs.getString(6);
				String birthdd = rs.getString(7);
				String mail1 = rs.getString(8);
				String mail2 = rs.getString(9);
				String phone = rs.getString(10);
				String address = rs.getString(11);
				
				dto.setId(id);
				dto.setPw(pw);
				dto.setName(name);
				dto.setGender(gender);
				dto.setBirthyy(birthyy);
				dto.setBirthmm(birthmm);
				dto.setBirthdd(birthdd);
				dto.setMail1(mail1);
				dto.setMail2(mail2);
				dto.setPhone(phone);
				dto.setAddress(address);
				
				list.add(dto);
				System.out.println();
			}
			return list;
		}

		public MemberDTO select(String input) throws Exception {
			// 1. 드라이버(connector) 셋팅
			Class.forName("com.mysql.jdbc.Driver");

			// 2. DB연결(->my서버설정+db명+id+pw)
			String url = "jdbc:mysql://localhost:3306/web";
			String user = "root";
			String password = "1234";

			Connection con = DriverManager.getConnection(url, user, password);

			// 3. SQL문 객체화
			String sql = "select * from member2 where id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, input);

			// 4. SQL문 실행 요청
			ResultSet rs = ps.executeQuery();
			MemberDTO dto = null;
			while (rs.next()) { // 커서를 옮겨서 레코드가 있는지 체크
				dto = new MemberDTO();
				String id = rs.getString(1);
				String pw = rs.getString(2);
				String name = rs.getString(3);
				String gender = rs.getString(4);
				String birthyy = rs.getString(5);
				String birthmm = rs.getString(6);
				String birthdd = rs.getString(7);
				String mail1 = rs.getString(8);
				String mail2 = rs.getString(9);
				String phone = rs.getString(10);
				String address = rs.getString(11);
				
				dto.setId(id);
				dto.setPw(pw);
				dto.setName(name);
				dto.setGender(gender);
				dto.setBirthyy(birthyy);
				dto.setBirthmm(birthmm);
				dto.setBirthdd(birthdd);
				dto.setMail1(mail1);
				dto.setMail2(mail2);
				dto.setPhone(phone);
				dto.setAddress(address);
			}
			return dto;
		}
		
		
		public boolean duplicateIdCheck(String id) throws Exception {
			// 1. 드라이버(connector) 셋팅
			Class.forName("com.mysql.jdbc.Driver");

			// 2. DB연결(->my서버설정+db명+id+pw)
			String url = "jdbc:mysql://localhost:3306/bigdata";
			String user = "root";
			String password = "1234";

			Connection con = DriverManager.getConnection(url, user, password);

			// 3. SQL문 객체화
			String sql = "select id from member where id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, id);
			
			// 4. SQL문 실행 요청
			ResultSet rs = ps.executeQuery();
			MemberDTO dto = null;
			boolean x = false;
			if (rs.next()) { // 커서를 옮겨서 레코드가 있는지 체크
				x = true;
			}
			return x;
		}
		
		

}



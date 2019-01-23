package shop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.DBConnectionMgr;

public class ShopDAO {
	/* 매장 DAO */
	DBConnectionMgr pool;
	Connection con;
	
	public ShopDAO() {
		pool = DBConnectionMgr.getInstance();
	}

	//매장정보삽입
	public void insert(ShopDTO dto) throws Exception {
		con = pool.getConnection();		//연결코드
	
		//순서 : 제품코드, 제품명, 카테고리, 가격, 제품설명, 이미지
		String sql = "insert into shop values (?,?,?,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getScode());
		ps.setString(2, dto.getSnm());
		ps.setString(3, dto.getTime());
		ps.setString(4, dto.getTel());
		ps.setString(5, dto.getAddr());
		ps.setString(6, dto.getImg());
		ps.setString(7, dto.getLat());
		ps.setString(8, dto.getLng());
		
		//4. SQL문 실행 요청
		ps.executeUpdate();
		System.out.println("SQL문 요청 완료");
		
		pool.freeConnection(con, ps); 		//con은 반환, ps는 연결끊기
	}
	
	//매장 전체 출력
	public ArrayList<ShopDTO> selectAll() throws Exception {
		con = pool.getConnection();		//연결코드
	
		//3. SQL문 객체화
		String sql = "select * from shop";
		PreparedStatement ps = con.prepareStatement(sql);
		
		//4. SQL문 실행 요청
		ResultSet rs = ps.executeQuery();
		ShopDTO dto = null;	//선언을 while문 밖으로 빼야함
		
		//불러오는 전체 DTO가 들어갈 수 있는 컬렉션 생성
		ArrayList<ShopDTO> list = new ArrayList<>();
		
		while(rs.next()) {	//커서를 옮겨서 레코드가 있는지 체크 (다음데이터가 있을 때 까지 돌아감)
			dto = new ShopDTO();
			
			String scode = rs.getString("scode");
			String snm = rs.getString("snm");
			String img = rs.getString("img");
			
			dto.setScode(scode);
			dto.setSnm(snm);
			dto.setImg(img);
			
			list.add(dto);	//ArrayList에 값 추가	
		}
		
		pool.freeConnection(con, ps, rs); 		//con은 반환, ps,rs는 연결끊기
		return list;
	}
	
	//매장상세정보
	public ShopDTO select(String scode) throws Exception {
		con = pool.getConnection();		//연결코드
		
		//3. SQL문 객체화
		String sql = "select * from shop where scode = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, scode);
		
		//4. SQL문 실행 요청
		ResultSet rs = ps.executeQuery();
		ShopDTO dto = null;	//선언을 while문 밖으로 빼야함
		
		if (rs.next()) {
			dto = new ShopDTO();
			
			dto.setScode(scode);
			dto.setSnm(rs.getString("snm"));
			dto.setTime(rs.getString("time"));
			dto.setTel(rs.getString("tel"));
			dto.setAddr(rs.getString("addr"));
			dto.setImg(rs.getString("img"));
			dto.setLat(rs.getString("lat"));
			dto.setLng(rs.getString("lng"));
		}
		
		pool.freeConnection(con, ps, rs); 		//con은 반환, ps,rs는 연결끊기
		return dto;
	}

	//매장검색
	public ArrayList<ShopDTO> selectSR(String sr) throws Exception {
		con = pool.getConnection();		//연결코드
		
		//3. SQL문 객체화
		String sql = "select * from shop where snm like '%" + sr + "%'";
		PreparedStatement ps = con.prepareStatement(sql);
		
//		ps.setString(1, sr);
		
		//4. SQL문 실행 요청
		ResultSet rs = ps.executeQuery();
		ShopDTO dto = null;	//선언을 while문 밖으로 빼야함
		
		//불러오는 전체 DTO가 들어갈 수 있는 컬렉션 생성
		ArrayList<ShopDTO> list = new ArrayList<>();
		
		while (rs.next()) {
			dto = new ShopDTO();
			
			dto.setScode(rs.getString("scode"));
			dto.setSnm(rs.getString("snm"));
			dto.setImg(rs.getString("img"));
			
			list.add(dto);
		}
		
		pool.freeConnection(con, ps, rs); 		//con은 반환, ps,rs는 연결끊기
		return list;
	}
	
}

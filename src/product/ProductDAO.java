package product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import bean.DBConnectionMgr;

public class ProductDAO {
	/* 상품목록 DAO */
	DBConnectionMgr pool;
	Connection con;
	
	public ProductDAO() {
		pool = DBConnectionMgr.getInstance();
	}
	
	//상품입력
	public void insert(ProductDTO dto) throws Exception {
		con = pool.getConnection();		//연결코드
	
		//순서 : 제품코드, 제품명, 카테고리, 가격, 제품설명, 이미지
		String sql = "insert into product values (?,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getPcode());
		ps.setString(2, dto.getPnm());
		ps.setString(3, dto.getCategory());
		ps.setInt(4, dto.getPrice());
		ps.setString(5, dto.getDetail());
		ps.setString(6, dto.getImg());
		
		//4. SQL문 실행 요청
		ps.executeUpdate();
		System.out.println("SQL문 요청 완료");
		
		pool.freeConnection(con, ps); 		//con은 반환, ps는 연결끊기
	}
	
	//상품정보 가져오기 == 카테고리별
	public ArrayList<ProductDTO> selectCate(String category) throws Exception {
		con = pool.getConnection();		//연결코드
	
		//3. SQL문 객체화
		String sql = "select * from product where category = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, category);
		
		//4. SQL문 실행 요청
		ResultSet rs = ps.executeQuery();
		ProductDTO dto = null;	//선언을 while문 밖으로 빼야함
		
		//불러오는 전체 DTO가 들어갈 수 있는 컬렉션 생성
		ArrayList<ProductDTO> list = new ArrayList<>();
		
		while(rs.next()) {	//커서를 옮겨서 레코드가 있는지 체크 (다음데이터가 있을 때 까지 돌아감)
			dto = new ProductDTO();
			
			String pcode = rs.getString("pcode");
			String pnm = rs.getString("pnm");
			int price = rs.getInt("price");
			String detail = rs.getString("detail");
			String img = rs.getString("img");
			
			dto.setPcode(pcode);
			dto.setPnm(pnm);
			dto.setCategory(category);
			dto.setPrice(price);
			dto.setDetail(detail);
			dto.setImg(img);
			
			list.add(dto);	//ArrayList에 값 추가	
		}
		
		pool.freeConnection(con, ps, rs); 		//con은 반환, ps,rs는 연결끊기
		return list;
	}
	
	//상품정보 가져오기 == 상품별
	public ProductDTO selectPro(String pcode) throws Exception {
		con = pool.getConnection();		//연결코드
		
		//3. SQL문 객체화
		String sql = "select * from product where pcode = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, pcode);
		
		//4. SQL문 실행 요청
		ResultSet rs = ps.executeQuery();
		ProductDTO dto = null;	//선언을 while문 밖으로 빼야함
		
		if (rs.next()) {
			dto = new ProductDTO();
			
			dto.setPcode(pcode);
			dto.setPnm(rs.getString("pnm"));
			dto.setCategory(rs.getString("category"));
			dto.setPrice(rs.getInt("price"));
			dto.setDetail(rs.getString("detail"));
			dto.setImg(rs.getString("img"));
		}
		
		pool.freeConnection(con, ps, rs); 		//con은 반환, ps,rs는 연결끊기
		return dto;
	}
}

package biz.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import biz.common.JDBCConnection;

public class UserDAO {
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	

	// 회원가입
	public void insertUser(UserVO bean) {

		try {				
			// DB접속
			conn = JDBCConnection.getConnection();
			
			String sql = "insert into si_users(seq, email, id, password, name, tel, address, agree, bday) values((select nvl(max(seq),0)+1 from si_users),?,?,?,?,?,?,?,?)";
			
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, bean.getEmail());
			stmt.setString(2, bean.getId());
			stmt.setString(3, bean.getPassword());
			stmt.setString(4, bean.getName());
			stmt.setString(5, bean.getTel());
			stmt.setString(6, bean.getAddress());
			stmt.setString(7, bean.getAgree());
			stmt.setString(8, bean.getBday());
			
			stmt.executeUpdate();
			
			System.out.println("유저 DB삽입 완료!");

			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCConnection.close(stmt, conn);
		}
		
		
	}
	
	// 로그인
	
	public UserVO loginMember(UserVO vo) {
		UserVO user = null;
		try {
			
			conn = JDBCConnection.getConnection();
			System.out.println("DB접속완료");
			String sql = "select * from si_users where id = ? and password = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, vo.getId());
			stmt.setString(2, vo.getPassword());
			rs = stmt.executeQuery();
			if(rs.next()) {
				if(vo.getPassword().equals(rs.getString("password"))) {
	            System.out.println("비밀번호 확인 성공");
	            user = new UserVO();
	            user.setId(rs.getString("id"));
	            user.setName(rs.getString("name"));
	            user.setRole(rs.getString("role"));
				}
	        }else {
	        	System.out.println("비밀번호 확인 실패");
	        }
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCConnection.close(rs,stmt,conn);
		}
		return user;
			
		}
	
	public UserVO CheckUser(UserVO vo) {
	      UserVO user = null;
	      
	      try {
	         
	         conn = JDBCConnection.getConnection();
	         
	         String sql = "select * from si_users where id = ? and password = ?";
	         stmt = conn.prepareStatement(sql);
	         stmt.setString(1, vo.getId());
	         stmt.setString(2, vo.getPassword());
	         rs = stmt.executeQuery();
	         
	         if(rs.next()) {
	               user = new UserVO();
	               user.setSeq(rs.getInt("seq"));
	               user.setName(rs.getString("name"));
	         } else {
	            
	            
	         }
	            
	           
	      } catch (ClassNotFoundException e) {
	         e.printStackTrace();
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         JDBCConnection.close(rs,stmt,conn);
	      }
	      
	      return user;
	      
	   }

	   public void DeleteUser(int seq) {
	      try {
	         
	         conn = JDBCConnection.getConnection();
	         
	         String sql = "delete from si_users where seq = ?";
	         stmt = conn.prepareStatement(sql);
	         stmt.setInt(1, seq);
	         stmt.executeUpdate();

	           
	      } catch (ClassNotFoundException e) {
	         e.printStackTrace();
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         JDBCConnection.close(rs,stmt,conn);
	      }
	      
	   }

}

package com.romance.security;

import java.time.Duration;
import java.util.Base64;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.romance.admin.login.AdminUserVO;
import com.romance.user.login.UserVO;

import io.jsonwebtoken.Header;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

public class JwtUtils {

	private final String key = "project_doublejo_kgitbankromance_secretkey";

	// jwt 토큰 생성
	// ==토큰 생성 메소드==//
	public String createToken(String subject, UserVO vo) {
		Date now = new Date();
		Date expiration = new Date(now.getTime() + Duration.ofDays(1).toMillis()); // 만료기간 1일
		Map<String, Object> payloads = new HashMap<>();
		payloads.put("user", vo);

		return Jwts.builder().setHeaderParam(Header.TYPE, Header.JWT_TYPE) // (1)
				.setIssuer("doublejo") // 토큰발급자(iss)
				.setIssuedAt(now) // 발급시간(iat)
				.setExpiration(expiration) // 만료시간(exp)
				.setSubject(subject).setClaims(payloads)// 토큰 제목(subject)
				.signWith(SignatureAlgorithm.HS256, Base64.getEncoder().encodeToString(key.getBytes())) // 알고리즘, 시크릿 키
				.compact();
	}

	// ==Jwt 토큰의 유효성 체크 메소드==//
	public Map<String, Object> parseJwtToken(String token) {
		// token = BearerRemove(token); // Bearer 제거
		return Jwts.parser().setSigningKey(Base64.getEncoder().encodeToString(key.getBytes())).parseClaimsJws(token)
				.getBody();
	}

	// ==토큰 앞 부분('Bearer') 제거 메소드==//
	private String BearerRemove(String token) {
		return token.substring("Bearer ".length());
	}

	// 로그인 토큰
	// String token=util.createToken("유저",vo);
	// System.out.println("token"+token);
	// Map<String, Object> con=util.parseJwtToken(token);
	// System.out.println("con"+con);

	// vo로 출력
//	String token=(String) session.getAttribute("id");
//	System.out.println(token);
//	Map<String, Object> con=util.parseJwtToken(token);
//	ObjectMapper mapper = new ObjectMapper();
//	UserVO vo=mapper.convertValue(con.get("user"),UserVO.class );
//	System.out.println("con"+vo);
	public UserVO getuser(HttpSession session) {
		String token = (String) session.getAttribute("id");
		if (token != null) {
			Map<String, Object> con = parseJwtToken(token);
			ObjectMapper mapper = new ObjectMapper();
			UserVO vo = mapper.convertValue(con.get("user"), UserVO.class);
			System.out.println("세션 등록 유저 정보" + vo);
			return vo;
		} else {
			return null;
		}
	}
	
	// ADMIN START
	// jwt 토큰 생성 AdminUserVO 이용
	// ==토큰 생성 메소드==//
	@SuppressWarnings("deprecation")
	public String createToken(String subject, AdminUserVO vo) {
		System.out.println("===관리자용 토큰 생성 처리===");
		Date now = new Date();
		Date expiration = new Date(now.getTime() + Duration.ofDays(1).toMillis()); // 만료기간 1일
		Map<String, Object> payloads = new HashMap<>();
		payloads.put("user", vo);

		return Jwts.builder().setHeaderParam(Header.TYPE, Header.JWT_TYPE) // (1)
				.setIssuer("doublejo") // 토큰발급자(iss)
				.setIssuedAt(now) // 발급시간(iat)
				.setExpiration(expiration) // 만료시간(exp)
				.setSubject(subject).setClaims(payloads)// 토큰 제목(subject)
				.signWith(SignatureAlgorithm.HS256, Base64.getEncoder().encodeToString(key.getBytes())) // 알고리즘, 시크릿 키
				.compact();
	}
	
	public AdminUserVO getAdmin(HttpSession session) {
		String token = (String) session.getAttribute("id");
		if (token != null) {
			Map<String, Object> con = parseJwtToken(token);
			ObjectMapper mapper = new ObjectMapper();
			AdminUserVO vo = mapper.convertValue(con.get("user"), AdminUserVO.class);
			System.out.println(">>>>어드민 세션 등록 유저 정보 = " + vo);
			return vo;
		} else {
			return null;
		}
	}
	//ADMIN END

}

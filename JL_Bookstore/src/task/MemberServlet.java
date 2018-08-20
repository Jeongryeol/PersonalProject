package task;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
/************************************************************
 * 	@last	2018.08.02
 * 	@comment
 * 	"SignUp.jsp"(화면)에서 가입 요청한 객체에는 아래 사항이 포함되어있어야 함
 * 		M_ID	: 아이디
 * 		M_EMAIL	: 이메일주소
 * 		M_PW	: 비밀번호
 * 		M_NAME	: 이름
 * 		M_GENDER: 성별
 * 		M_PHONE	: 휴대번호
 * 	
 * 	@author 이정렬(Jeongryeol Lee)
 *  @email	duxbellorn@gmail.com
 *  @GitHub	https://github.com/Jeongryeol
 ************************************************************/
public class MemberServlet extends HttpServlet {
	//로그준비
	Logger logger = Logger.getLogger(MemberServlet.class);
	
	//업무를 분기하는 메소드
	public void doJudge(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException
	{
		//요청객체 파라미터 추출 1 : 명령커맨드
		String command	= req.getParameter("command");
		String comtype	= req.getParameter("comtype");
		logger.info("command = "+command);
		logger.info("comtype = "+comtype);
		//요청객체파라미터 추출 2 : 입력정보
		String m_name	= req.getParameter("m_name");
		String m_email	= req.getParameter("m_email");
		String m_pw 	= req.getParameter("m_pw");

		/* [[회원정보 업무분기방식]]
		 * command에 따라 4가지 분기됨. 분기된 각 DAO를 선택적으로 받아야할 것
		 * 조회업무의 종류 : 아이디중복검사 / 비밀번호 찾기
		 */
		//기본명령 [select] : 회원정보 조회
		if("select".equals(command)) {
			logger.info("[[업무분기]] command = "+command);
			//세부명령 [signIn] : 로그인
			if("signIn".equals(comtype)) {
				
			}
			//세부명령 [findPW] : 비밀번호찾기
			else if("findPW".equals(comtype)) {
				
			}
			//세부명령정보 확인불가
			else {
				logger.info("[[에러상황]] MemberServlet 업무분기에 실패했습니다.");
				logger.info("[[에러상황]] command = "+command);
				logger.info("[[에러상황]] comtype = "+comtype);
				return;//종료
			}
		}
		//기본명령 [insert] : 회원가입
		else if ("insert".equals(command)){
			/* [[회원가입 분기계획]]
			 * 관리자는 서버의 고유코드를 입력했을때 관리자등급으로 회원가입됨
			 * 실무자는 일반회원으로부터 관리자의 권한으로 등급수정
			 * 일반회원은 가입시 중복검사실시(이메일,이름)후 가입완료 
			 */
		}
		//기본명령 [update] : 회원정보 수정
		else if ("update".equals(command)){
			
		}
		//기본명령 [delete] : 회원삭제 입력
		else if ("delete".equals(command)){
			
		}
		//기본명령 정보 확인 불가
		else {
			logger.info("[[에러상황]] MemberServlet 업무분기에 실패했습니다.");
			logger.info("[[에러상황]] command = "+command);
			return;//종료
		}
	}
	
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res)
		throws ServletException, IOException
	{
		//logger.info("MemberServlet 클래스 - doGet() 메소드 호출성공");
		doJudge(req, res);
	}
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res)
		throws ServletException, IOException 
	{
		logger.info("MemberServlet 클래스 - doPost() 메소드 호출성공");
		doJudge(req, res);
	}
}

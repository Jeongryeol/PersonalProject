package task;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import util.HashMapBinder;
/************************************************************
 * 	@last	2018.07.30
 * 	@comment
 * 	"BookStore_Intro.jsp"(화면)에서 조회 요청한 객체는
 * 	"BookAction_List.jsp"을 통해 요청옴 ( web.xml url패턴 )
 * 	조회요청을 처리하는 메소드를 인스턴스화하여 처리함.
 * 	처리된 업무를 다시 돌려받아 화면으로 보내고 사용자에게 출력할 수 있도록 함.
 * 	@author 이정렬(Jeongryeol Lee)
 *  @email	duxbellorn@gmail.com
 *  @GitHub	https://github.com/Jeongryeol
 ************************************************************/
public class BookServlet extends HttpServlet {
	//로그를 찍는 loj4j의 로거 사용하기
	Logger logger = Logger.getLogger(BookServlet.class);
	
	//업무를 분기하는 메소드
	public void doJudge(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException
	{
		Map<String,Object> pMap = new HashMap<String,Object>();//담는 Map객체
		//pMap.put("userInput", req.getParameter("userInput"));//DB연동을 위해 Map타입 담기
		//pMap.put("userInput", "자");//단위테스트완료
			//위 과정을 일괄적으로 해주는 아래 구문
		HashMapBinder hmb = new HashMapBinder(req);//util 폴더 내 위치
		hmb.bind(pMap);
		logger.info("select".equals(pMap.get("command").toString()));
		
		/*조회*/
		if("select".equals(pMap.get("command").toString())) {
			logger.info("호출됨");
			//요청부
			BookSelect_Dao bDao = new BookSelect_Dao();//DB연동객체 인스턴스
			List<Map<String,Object>> rlist
					= bDao.getDataList(pMap);//DB연동요청 및 리턴값담기
			logger.info("[2]rlist = "+rlist.size());//확인용 로그
		
			//응답부
			req.setAttribute("output",rlist);//응답객체에 저장
			RequestDispatcher view	//자바페이지로 응답객체 생성
					= req.getRequestDispatcher("/task/user/BookAction_List.jsp");
			view.forward(req, res);	//응답하여 포워딩 (목적지 경로 특수문자 금지)
		}
		/*입력*/
		else if("insert".equals(pMap.get("command").toString())) {
			
		}
		/*수정*/
		else if("update".equals(pMap.get("command").toString())) {
			
		}
		/*삭제*/
		else if("delete".equals(pMap.get("command").toString())) {
			
		}
		else {
			logger.info("오타가 생겼슴메!!!");
		}
		////end : if-else if-else
	}////////////end : doJudge()
	
	//단위테스트 : 서블릿호출 확인용 메소드
	public void doTest(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException
	{
		PrintWriter out = res.getWriter();
		res.setContentType("text/html;charset=euc-kr");
		out.print("--Called--");
	}
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res)
		throws ServletException, IOException
	{
		doJudge(req,res);
	}
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res)
		throws ServletException, IOException
	{
		//doTest(req,res);//단위테스트완료
		doJudge(req,res);
	}
	
}

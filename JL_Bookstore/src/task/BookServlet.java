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
 * 	"BookStore_Intro.jsp"(ȭ��)���� ��ȸ ��û�� ��ü��
 * 	"BookAction_List.jsp"�� ���� ��û�� ( web.xml url���� )
 * 	��ȸ��û�� ó���ϴ� �޼ҵ带 �ν��Ͻ�ȭ�Ͽ� ó����.
 * 	ó���� ������ �ٽ� �����޾� ȭ������ ������ ����ڿ��� ����� �� �ֵ��� ��.
 * 	@author ������(Jeongryeol Lee)
 *  @email	duxbellorn@gmail.com
 *  @GitHub	https://github.com/Jeongryeol
 ************************************************************/
public class BookServlet extends HttpServlet {
	//�α׸� ��� loj4j�� �ΰ� ����ϱ�
	Logger logger = Logger.getLogger(BookServlet.class);
	
	//������ �б��ϴ� �޼ҵ�
	public void doJudge(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException
	{
		Map<String,Object> pMap = new HashMap<String,Object>();//��� Map��ü
		//pMap.put("userInput", req.getParameter("userInput"));//DB������ ���� MapŸ�� ���
		//pMap.put("userInput", "��");//�����׽�Ʈ�Ϸ�
			//�� ������ �ϰ������� ���ִ� �Ʒ� ����
		HashMapBinder hmb = new HashMapBinder(req);//util ���� �� ��ġ
		hmb.bind(pMap);
		logger.info("select".equals(pMap.get("command").toString()));
		
		/*��ȸ*/
		if("select".equals(pMap.get("command").toString())) {
			logger.info("ȣ���");
			//��û��
			BookSelect_Dao bDao = new BookSelect_Dao();//DB������ü �ν��Ͻ�
			List<Map<String,Object>> rlist
					= bDao.getDataList(pMap);//DB������û �� ���ϰ����
			logger.info("[2]rlist = "+rlist.size());//Ȯ�ο� �α�
		
			//�����
			req.setAttribute("output",rlist);//���䰴ü�� ����
			RequestDispatcher view	//�ڹ��������� ���䰴ü ����
					= req.getRequestDispatcher("/task/user/BookAction_List.jsp");
			view.forward(req, res);	//�����Ͽ� ������ (������ ��� Ư������ ����)
		}
		/*�Է�*/
		else if("insert".equals(pMap.get("command").toString())) {
			
		}
		/*����*/
		else if("update".equals(pMap.get("command").toString())) {
			
		}
		/*����*/
		else if("delete".equals(pMap.get("command").toString())) {
			
		}
		else {
			logger.info("��Ÿ�� ���彿��!!!");
		}
		////end : if-else if-else
	}////////////end : doJudge()
	
	//�����׽�Ʈ : ����ȣ�� Ȯ�ο� �޼ҵ�
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
		//doTest(req,res);//�����׽�Ʈ�Ϸ�
		doJudge(req,res);
	}
	
}

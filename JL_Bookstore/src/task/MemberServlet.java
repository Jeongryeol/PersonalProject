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
 * 	"SignUp.jsp"(ȭ��)���� ���� ��û�� ��ü���� �Ʒ� ������ ���ԵǾ��־�� ��
 * 		M_ID	: ���̵�
 * 		M_EMAIL	: �̸����ּ�
 * 		M_PW	: ��й�ȣ
 * 		M_NAME	: �̸�
 * 		M_GENDER: ����
 * 		M_PHONE	: �޴��ȣ
 * 	
 * 	@author ������(Jeongryeol Lee)
 *  @email	duxbellorn@gmail.com
 *  @GitHub	https://github.com/Jeongryeol
 ************************************************************/
public class MemberServlet extends HttpServlet {
	//�α��غ�
	Logger logger = Logger.getLogger(MemberServlet.class);
	
	//������ �б��ϴ� �޼ҵ�
	public void doJudge(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException
	{
		//��û��ü �Ķ���� ���� 1 : ���Ŀ�ǵ�
		String command	= req.getParameter("command");
		String comtype	= req.getParameter("comtype");
		logger.info("command = "+command);
		logger.info("comtype = "+comtype);
		//��û��ü�Ķ���� ���� 2 : �Է�����
		String m_name	= req.getParameter("m_name");
		String m_email	= req.getParameter("m_email");
		String m_pw 	= req.getParameter("m_pw");

		/* [[ȸ������ �����б���]]
		 * command�� ���� 4���� �б��. �б�� �� DAO�� ���������� �޾ƾ��� ��
		 * ��ȸ������ ���� : ���̵��ߺ��˻� / ��й�ȣ ã��
		 */
		//�⺻��� [select] : ȸ������ ��ȸ
		if("select".equals(command)) {
			logger.info("[[�����б�]] command = "+command);
			//���θ�� [signIn] : �α���
			if("signIn".equals(comtype)) {
				
			}
			//���θ�� [findPW] : ��й�ȣã��
			else if("findPW".equals(comtype)) {
				
			}
			//���θ������ Ȯ�κҰ�
			else {
				logger.info("[[������Ȳ]] MemberServlet �����б⿡ �����߽��ϴ�.");
				logger.info("[[������Ȳ]] command = "+command);
				logger.info("[[������Ȳ]] comtype = "+comtype);
				return;//����
			}
		}
		//�⺻��� [insert] : ȸ������
		else if ("insert".equals(command)){
			/* [[ȸ������ �б��ȹ]]
			 * �����ڴ� ������ �����ڵ带 �Է������� �����ڵ������ ȸ�����Ե�
			 * �ǹ��ڴ� �Ϲ�ȸ�����κ��� �������� �������� ��޼���
			 * �Ϲ�ȸ���� ���Խ� �ߺ��˻�ǽ�(�̸���,�̸�)�� ���ԿϷ� 
			 */
		}
		//�⺻��� [update] : ȸ������ ����
		else if ("update".equals(command)){
			
		}
		//�⺻��� [delete] : ȸ������ �Է�
		else if ("delete".equals(command)){
			
		}
		//�⺻��� ���� Ȯ�� �Ұ�
		else {
			logger.info("[[������Ȳ]] MemberServlet �����б⿡ �����߽��ϴ�.");
			logger.info("[[������Ȳ]] command = "+command);
			return;//����
		}
	}
	
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res)
		throws ServletException, IOException
	{
		//logger.info("MemberServlet Ŭ���� - doGet() �޼ҵ� ȣ�⼺��");
		doJudge(req, res);
	}
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res)
		throws ServletException, IOException 
	{
		logger.info("MemberServlet Ŭ���� - doPost() �޼ҵ� ȣ�⼺��");
		doJudge(req, res);
	}
}

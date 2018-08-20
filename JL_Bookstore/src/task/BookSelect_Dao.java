package task;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;

import db.connection.DBConnection;
/************************************************************
 * 	@author ������(Jeongryeol Lee)
 *  @email	duxbellorn@gmail.com
 *  @GitHub	https://github.com/Jeongryeol
 * 	@last	2018.07.30
 * 	@comment
 * 	��ȸ������  ó���ϴ� Data Access Object
 * 	
 ************************************************************/
public class BookSelect_Dao {
	//�α׸� ��� loj4j�� �ΰ� ����ϱ�
	Logger logger = Logger.getLogger(BookSelect_Dao.class);
	//DB�����ϱ�
	DBConnection dbcon	= null; //DB���� ����Ŭ����
	SqlSession	 sqlSes	= null;	//���ῡ ���� ��� ������ ��� ��ü
	
	/********************************************************
	 * [[ SELECT :: ��ȸ���� �⺻�� ]]
	 * @param pMap : Front(Web|App)���� �Է��� ������
	 * 	�� �Ķ���� �����ʹ� �Ʒ� ����� jsp���Ϸκ��� �Ѿ��
	 * 	WebContent/_task/user/BookAction_List.jsp
	 * @return rlist : Back(DB)���� ��ȸ�� ������
	 * 	ListŸ�Կ� �� �ο� ������ Map<�˶��÷���,�ο찪>���� ����)
	 * 	���ϵ� �����ʹ� �Ʒ� ����� jsp���Ͽ��� ����
	 * 	WebContent/_task/user/BookAction_List.jsp
	 ********************************************************/
	public List<Map<String,Object>> getDataList(Map<String,Object> pMap){
		logger.info("getDataList ȣ�� ����");//Ȯ�ο� �α�
		//�Ѿ�� Map���κ��� userInput�� �� Ȯ���ϱ�
		//logger.info("pMap.get('userInput') = "+pMap.get("userInput"));
		
		dbcon  = new DBConnection();//DB���� ����Ŭ���� �ν��Ͻ�����
		sqlSes = dbcon.getConnection();//���ᰴü ����
		
		List<Map<String,Object>> rlist = null;//DB��ȸ��� ��ȯ�ϴ� List
		System.out.println(pMap);
		try {
			//�����׽�Ʈ
			//pMap = new HashMap<String,Object>();
			//pMap.put("userInput","��");//rlist=2 Ȯ�οϷ�
			rlist = sqlSes.selectList("select_Nm_Au",pMap);
			//logger.info("[1]rlist = "+rlist.size());//Ȯ�ο� �α�
		} catch (Exception e) {
			e.printStackTrace();//��������
			logger.info("getDataList �����߻�");//Ȯ�ο� �α�
		}
		logger.info("getDataList ����");//Ȯ�ο� �α�
		return rlist;//��ȯ
	}
}

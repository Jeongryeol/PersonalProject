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
 * 	@last	2018.08.03
 * 	@comment
 * 	��ȸ������  ó���ϴ� Data Access Object
 * 	
 ************************************************************/
public class MemberSelect_Dao {
	//�α׸� ��� loj4j�� �ΰ� ����ϱ�
	Logger logger = Logger.getLogger(BookSelect_Dao.class);
	//DB�����ϱ�
	DBConnection dbcon	= null; //DB���� ����Ŭ����
	SqlSession	 sqlSes	= null;	//���ῡ ���� ��� ������ ��� ��ü

	/********************************************************
	 * [[ loginTry :: ȸ��������ȸ ]]
	 * @param pMap : memberServlet.jaga[����]���� �б� �� �Ѿ�� Map�ڷ�
	 * @return boolean : �α��� ���� ��/�� ����
	 * 	
	 ********************************************************/
	public boolean loginTry(Map<String,Object> pMap){
		logger.info("getDataList ȣ�� ����");//Ȯ�ο� �α�
		//�Ѿ�� Map���κ��� userInput�� �� Ȯ���ϱ�
		//logger.info("pMap.get('userInput') = "+pMap.get("userInput"));
		List<Map<String,Object>> rlist = null;//DB��ȸ����� ���� List
		boolean isApproval = false;//�α��� ���ο��θ� ��ȯ�� Boolean
		System.out.println(pMap);
		try {
			//�����׽�Ʈ
			pMap = new HashMap<String,Object>();
			pMap.put("userInput","��");//rlist=2 Ȯ�οϷ�
			rlist = sqlSes.selectList("select_Nm_Au",pMap);
			logger.info("[1]rlist = "+rlist.size());//Ȯ�ο� �α�
			//���Ȯ�� �� �α��� ����
			if(rlist.size()==1) {
				isApproval = true;
				logger.info("isApproval = "+isApproval);//Ȯ�ο� �α�
				return isApproval;//��ȯ
			}
		} catch (Exception e) {
			e.printStackTrace();//��������
			logger.info("getDataList �����߻�");//Ȯ�ο� �α�
		}
		logger.info("getDataList ����");//Ȯ�ο� �α�
		return isApproval;//��ȯ
	}
}

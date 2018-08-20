package task;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;

import db.connection.DBConnection;
/************************************************************
 * 	@author ������(Jeongryeol Lee)
 *  @email	duxbellorn@gmail.com
 *  @GitHub	https://github.com/Jeongryeol
 * 	@last	2018.08.02
 * 	@comment
 * 	ȸ���� ���Ͽ� �Է¾����� ó���ϴ� Data Access Object
 ************************************************************/
public class MemberInsert_Dao {
	//�α��غ�
	Logger logger = Logger.getLogger(MemberInsert_Dao.class);
	//MyBatis Ŀ�ؼ�Ǯ �ҷ�����
	DBConnection dbcon	= null; //DB���� ����Ŭ����
	SqlSession	 sqlSes	= null;	//���ῡ ���� ��� ������ ��� ��ü

	/********************************************************
	 * [[ INSERT :: �Է¾��� �⺻�� ]]
	 * @param (Map<String,Object>)pMap : Front(Web|App)���� �Է��� ������
	 * 	WebContent/task/SignUp.jsp�κ��� �Ѿ��
	 * 	
	 * @return (int)result : �Է� ������ 1, ���н�0
	 * 	WebContent/task/result.jsp�� �Ѿ
	 ********************************************************/
	public int memeberInsert(Map<String,Object> pMap) {
		logger.info("MemberInsert_Dao : memberInsert() ȣ�⼺��");//Ȯ�ο�
		logger.info("pMap = "+pMap);
		//�Ѿ�;��ϴ� �� : 
		
		//������������
		dbcon	= new DBConnection();	//DB���� ����Ŭ���� �ν��Ͻ�����
		sqlSes	= dbcon.getConnection();//���ᰴü ����
		
		int result = 0;//��ȯ�� ���ں��� �غ�
		try {
			result = sqlSes.insert("insert_Mem", pMap);
		} catch (Exception e) {
			e.printStackTrace();
			logger.info(e.toString());
		}
		
		return result;
	}
}

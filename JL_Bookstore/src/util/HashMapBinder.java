package util;

import java.util.Enumeration;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
/*
 * �����ڵ带 �ۼ��غ��ô�
 * 	1)�Ķ���Ͱ� �ʿ��ϴ�.
 * 		-���� ���� � Ŭ�������� �ν��Ͻ�ȭ �ؾ��ϴ� ���ΰ�?
 * 		-� �������� �ʿ��� ���ϱ�?
 *  
 */
public class HashMapBinder {
	//��û��ü �غ�
	HttpServletRequest req = null;
	
	//�����ڸ� ���ؼ� �� Ŭ����(HashMapBinder)�� �ν��Ͻ�ȭ�Ҷ�,
	//��û��ü(request)�� �����ּҸ� �޾� �����ص�
	public HashMapBinder(HttpServletRequest req) {
		this.req = req;
	}
	
	//Web���� ������ ��û��ü�� �ڷḦ DB�� ���� Map�迭 �ڷ������� �Űܴ���  
	public void bind(Map<String,Object> pMap){
		//�ڷ��� �ʱ�ȭ
		pMap.clear();
		/* Enumeration�� �ڹ� �ʱ������ ���ߵ� �������̽���
		 * ��ü���� ����(Vector)�� ��ü���� �ϳ��� ������� ��� ó���� �� �ִ� �޼ҵ带 �����ϴ� �̷����̴�. */
		Enumeration<String> en
				= req.getParameterNames();//name�Ӽ����� �� ��� ������ ������� ����
		//�ڷ��� �ϰ�����
		while(en.hasMoreElements()) {
				//�����ַ��̼ǿ� ��� �Ӽ���(name)�� Ű(key)�� ����
			String key = en.nextElement();
				//Ű(key)�� Ű�� ���� ����ִ� ��(value)�� Map�� ���� (�ѱ����ڵ� �߰�)
			//pMap.put(key,Post_Hangul_Conversion.toKor(req.getParameter(key)));
			pMap.put(key,req.getParameter(key));
		}
	}
}

package util;

public class Post_Hangul_Conversion {

	//���� ���ڵ� Ÿ������ �о �ѱ� ���ڵ� Ÿ������ ��ȯ
	public static String toKor(String en) {
		if(en==null) return null;
		try {
			return new String(en.getBytes("8859_1"),"EUC-KR");
		} catch (Exception e) {
			return en;
		} 
	}
	
	//���� ���ڵ� Ÿ������ �о �ѱ� ���ڵ� Ÿ������ ��ȯ
	public static String toUTF(String en) {
		if(en==null) return null;
		try {
			return new String(en.getBytes("8859_1"),"UTF-8");
		} catch (Exception e) {
			return en;
		} 
	}
}

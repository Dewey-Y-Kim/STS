package MyStudy;

import java.sql.Types;
import java.util.Scanner;

public class PubPutter extends DbC {
	
	public PubPutter() {
		Connect();
	}
	Scanner sc= new Scanner(System.in);
	String name,ceo,tel,fax,addr;
	
	public void start(int command) {
		try {
		switch (command) {
			case 3: InputOne(command);break;
			case 1: case 2: InputRan(command);break;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DbClose();
		}
	}
	
	public void InputOne(int command) throws Exception{
		// 이름, 대표이름, 대표번호, 주소 
		System.out.print("출판사 이름 : ");
		name = sc.nextLine();
		if(name != null) {
		} else {
			System.out.println("출판사명은 필수 입력 요소 입니다.");
			return;
		}
		System.out.print("대표 이름 : ");
		ceo = sc.nextLine();
		
		System.out.print("전화번호 : ");
		tel = sc.nextLine();
		if (tel!=null) {	
			} else {
				System.out.println("전화번호는 필수 입력요소입니다.");
				return;
			}
		System.out.print("팩스번호 : ");
		fax = sc.nextLine();
		System.out.print("주   소 :");
		addr = sc.nextLine();
		putter(command);
	}
	
	
	public void InputRan(int command) throws Exception{
		if (command==1) {
			sql="{call pub_putter(?,?,?,?,?)}";
		}else sql="{call pub_put(?,?,?,?,?,?)}";
		
		System.out.println("몇  입력하실라우?");
		int destination= sc.nextInt(),answer=1;
		for (int i=0; i<destination; i++) {
			name=new RanData().groupName(i);
			ceo=new RanData().huName();
			tel=new RanData().htel();
			if(tel.substring(tel.length()-1).equals("9")){
					fax= tel.substring(0,tel.length()-1)+"8";
			}else {
				fax= tel.substring(0,tel.length()-1)+(Integer.parseInt(tel.substring(tel.length()-1))+1);
			}	
			addr=new RanData().addr();
			 
			answer=putter(command);
			}
		if (answer == 0) System.out.println("오류가 있었습니다.");
		}
	
	public int putter(int command) throws SQLException {
			int answer = 1;
			cs=connect.prepareCall(sql);
			cs.setString(1, name);
			cs.setString(2, ceo);
			cs.setString(3, tel);
			cs.setString(4, fax);
			cs.setString(5, addr);
			if(command==2)cs.registerOutParameter(6, Types.INTEGER);
			
			cs.executeUpdate();
			
			
			if(command==2) {
				if(cs.getInt(6)==0) {
					answer = 0;
				}
			}
			return answer;
		}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		System.out.println("1. 일괄랜덤입력\t2.체크\t3. 개별 입력");
		Scanner sc= new Scanner(System.in);
		new PubPutter().start(sc.nextInt());
		sc.close();
	}
}

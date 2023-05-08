package MyStudy;


import java.time.LocalDate;
import java.util.Scanner;

public class RanData {

	public RanData() {
		// TODO Auto-generated constructor stub
	}
	
	String[] bestSeller= {"가시고기", "해리포터와 마법사의 돌 1", "부자 아빠 가난한 아빠", "국화꽃 향기", "영어공부 절대로 하지마라!", "해리 포터와 비밀의 방", "누가 내 치즈를 옮겼을까", "느리게 산다는 것의 의미", "노자와 21세기", "만행 하버드에서 회계사까지", "누가 내 치즈를 옮겼을까", "상도 1", "국화꽃 향기 1", "부자 아빠 가난한 아빠", "THE BLUE DAY BOOK[1]", "가시고기", "이윤기의 그리스 로마 신화 1", "느리게 산다는 것의 의미", "해리포터와 마법사의 돌 1", "힐링 소사이어티", "아홉 살 인생", "봉순이 언니", "그 많던 싱아는 누가 다 먹었을까", "오페라의 유령", "괭이부리말 아이들", "연탄길 1", "뇌(상)", "그러나 나는 살아가리라", "화", "모랫말 아이들", "나무", "톨스토이 단편선", "파페포포 메모리즈", "야생초 편지", "화", "한국의 부자들", "설득의 심리학", "지상의 숟가락 하나", "내 생애의 아이들", "칭찬은 고래도 춤추게 한다", "연금술사", "다빈치 코드 1", "선물", "설득의 심리학", "아침형 인간", "나무", "그남자 그여자", "칼의 노래 1", "꽃으로도 때리지 말라", "세상의 중심에서 사랑을 외치다", "살아 있는 동안 꼭 해야 할 49가지", "다빈치 코드 1", "모모", "연금술사", "블루오션전략", "사랑하라 한번도 상처받지 않은 것처럼", "해커스 토익(READING)", "1010 대한민국 트렌드", "해리포터와 혼혈왕자 1", "설득의 심리학", "마시멜로 이야기", "우리들의 행복한 시간", "끌리는 사람은 1%가 다르다", "해커스 토익(READING)", "인생 수업", "배려", "부의 미래", "긍정의 힘", "살아 있는 것은 다 행복하라", "해커스 토익(LISTENING)", "멈추면 비로소 보이는 것들", "꾸뻬씨의 행복여행", "색채가 없는 다자키 쓰쿠루와 그가 순례를 떠난 해", "정글만리, 1", "나미야 잡화점의 기적", "김미경의 드림 온", "적을 만들지 않는 대화법", "습관의 힘", "해커스 토익 보카", "나는 죽을 때까지 재미있게 살고싶다", "창문 넘어 도망친 100세 노인", "미 비포 유", "어떤 하루", "내가 사랑한 유럽 TOP10", "감정수업", "에드워드 툴레인의 신기한 여행", "여자 없는 남자들", "나미야 잡화점의 기적", "1cm+", "정글만리 1", "미움받을 용기", "지적 대화를 위한 넓고 얕은 지식", "비밀의 정원", "나미야 잡화점의 기적", "지적 대화를 위한 넓고 얕은 지식: 현실너머 편", "하버드 새벽 4시 반", "오베라는 남자", "창문 넘어 도망친 100세 노인", "백종원이 추천하는 집밥 메뉴 51", "해커스 토익 보카(전면개정판)", "채식주의자", "완벽하지 않은 것들에 대한 사랑", "미움받을 용기", "설민석의 조선왕조실록", "나미야 잡화점의 기적", "지적 대화를 위한 넓고 얕은 지식", "사피엔스", "나에게 고맙다", "미움받을 용기 1", "자존감 수업", "언어의 온도", "81년생 김지영", "자존감 수업", "나미야 잡화점의 기적", "나는 나로 살기로 했다", "말의 품격", "보노보노처럼 살다니 다행이야(특별판)", "기사단장 죽이기 1: 현현하는 이데아", "살인자의 기억법", "설민석의 조선왕조실록", "곰돌이 푸, 행복한 일은 매일 있어", "모든 순간이 너였다", "무례한 사람에게 웃으며 대처하는 법", "81년생 김지영", "나는 나로 살기로 했다", "언어의 온도", "죽고 싶지만 떡볶이는 먹고 싶어", "돌이킬 수 없는 약속", "나미야 잡화점의 기적", "역사의 역사", "여행의 이유", "고요할수록 밝아지는 것들", "나는 나로 살기로 했다", "90년생이 온다", "철학은 어떻게 삶의 무기가 되는가", "봉제인형 살인사건", "아주 작은 습관의 힘", "꽃을 보듯 너를 본다", "돌이킬 수 없는 약속", "흔한남매. 1", "더 해빙(The Having)", "돈의 속성", "아몬드", "하버드 상위 1퍼센트의 비밀", "지적 대화를 위한 넓고 얕은 지식: 제로 편", "존리의 부자되기 습관", "주식투자 무작정 따라하기(2010)", "흔한 남매", "해커스 토익 기출보카 TOEIC VOCA", "내가 원하는 것을 나도 모를 때"};
	
	public String huName() {
		return chooser(hname);
	}
	public String huName(int i) {
		return hname[i];
	}
	public String groupName() {
		return chooser(pname);
	}
	public String groupName(int i) {
		return pname[i];
	}
	public String htel() {
		return chooser(num)+"-"+ran(4,3)+"-"+ran(4);
	}
	
	public String ptel() {
		return "010-"+ran(4,3)+"-"+ran(4);
	}
	public String addr() {
		return chooser(paddr);
	}
	public String dateAgo() {
		//랜덤 날짜 대략 50년 전부터 15년 전까지
		return dateAgo(15,50);
	}
	public String dateAgo(int i) {
		//랜덤 몇년 전
		return dateAgo(0,i);
	}
	
	public String dateAgo(int s,int e) {
		//랜덤 날짜 대략 i년 전부터 i+j년 전까지
		LocalDate date =  LocalDate.now();
		date=date.minusYears((int)(s+Math.random()*e));
		date=date.minusMonths((int)(Math.random()*12));
		date=date.plusDays((int)Math.random()*31);
		return date.toString();
	}
	public String bookChooser() {
		return chooser(bestSeller);
	}
	public String email() {
		String email=String.valueOf(ran('a'));
		email+=ranStr(3+(int)Math.random()*4)+"@"+chooser(domain);
		return email;
	}
	
	public String homepage() {
		// 랜덤 홈페이지 주소 *****.***/** 형태
		String home=ranStr(3+(int)Math.random()*4)+"."+chooser(domain)+"/"+ranStr(4+(int)Math.random()*2);
		return home;
	}
	public String ranStr(int leng) {
		//랜덤 문자열
		String renStr="";
		renStr=String.valueOf(ran('a'));
		for (int i=0; i<leng-1;i++) {
			if(ran(1)<7) {
				renStr+=String.valueOf(ran('a'));
			}else {
				renStr+=String.valueOf(ran(1));
			}
		}
		return renStr;
	}
	public String chooser(String[] str) { // 배열에서 랜덤으로 선택
		return str[(int)(Math.random()*(str.length))];
	}
	public int ran(int leng) { // 3 - 100-999 2 -10-99 10^n-10^n-1
		return ran(leng,leng);
	}
	public char ran(char a) { //문자 랜덤으로 선택
		return (char)(a+(int)(Math.random()*26));
	}
	
	public int ran(int leng,int i) {
		int num= (int)((Math.random()*(Math.pow(10,leng)-Math.pow(10,i-1)))+Math.pow(10,i-1));
		return num;
	}
	public void howMany() {
		System.out.println("저장된 종류의 수를 확인합니다.");
		System.out.println("1. 단체명\t2. 인명\t3.지역명\t4.책제목");
		int i=0;
		Scanner sc = new Scanner(System.in);
		switch(sc.nextInt()) {
			case 1 : sc.close(); i=pname.length;break;
			case 2 : sc.close(); i= hname.length;break;
			case 3 : sc.close(); i= paddr.length;break;
			case 4 : sc.close(); i= bestSeller.length;break;
		}
		System.out.println(i);
		
	}
}

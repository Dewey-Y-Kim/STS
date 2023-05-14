
public class test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		for(int i=0; i<1000; i++) {
			long time = (long)(5*1000*60+1000*60*Math.random()*5);
			System.out.println(time);
			try {
			Thread.sleep(time);
			}catch(Exception e) {
				System.out.println("exception");
			}
		}
	}

}

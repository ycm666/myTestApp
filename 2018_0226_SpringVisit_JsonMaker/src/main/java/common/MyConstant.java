package common;

public class MyConstant {

	//게시판 상수
	public static class Board{
		//1화면당 보여질 게시물 갯수
		public static final int BLOCKLIST = 5;
		//1화면당 보여질 메뉴갯수
		public static final int BLOCKPAGE = 3;
		
		public static final String VEIW_PATH="board/";
	}
	
	//댓글 상수
	public static class Comment{
		//1화면당 보여질 게시물 갯수
		public static final int BLOCKLIST = 3;
		//1화면당 보여질 메뉴갯수
		public static final int BLOCKPAGE = 3;
	}
	
	
	
	
	//공지사항 상수
	public static class Notice{
		public static final int BLOCKLIST = 3;
	}
	
	//회원관리 상수
	public static class Member{
		public static final String VEIW_PATH="member/";
		
	}
	
}

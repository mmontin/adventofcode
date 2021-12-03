package advent2020.puzzle19;

public class Parser {

	// E1 -> E2 E3
	// E2 -> T2 | T2 E2
	// E3 -> T3 | T2 E3 T1
	
	public static boolean parse(String s) {
		
//		String T1 = Launcher.rules.get(31).getRegularExpression() + "$" ;
//		String T2 = "^" + Launcher.rules.get(42).getRegularExpression() ;
//		String T3 = "^" + Launcher.rules.get(249).getRegularExpression() + "$" ;
//		
//		Matcher m1 = Pattern.compile(T1).matcher(s) ;
//		Matcher m2 = Pattern.compile(T2).matcher(s) ;
//		Matcher m3 = Pattern.compile(T3).matcher(s) ;
		
//		int nbOfT2 = 0 ;
//		int offSet2 = 0 ;
//		while (m2.region(offSet2, s.length()).find()) {
//			offSet2 = m2.end() ;
//			nbOfT2 ++ ;
//		}
//
//		int nbOfT1 = 0 ;
//		int offSet1 = s.length() ;
//		while (m1.region(0, offSet1).find()) {
//			offSet1 = m1.start() ;
//			nbOfT1 ++ ;
//		}
		
		return true ; // m3.region(offSet2, offSet1).find() ;
	}
}

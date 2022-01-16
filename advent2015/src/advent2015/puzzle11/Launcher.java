package advent2015.puzzle11;

import java.io.IOException;

import adventutils.input.InputLoader;

public class Launcher {

	public static void main(String[] args) throws IOException {

		char[] password = new InputLoader(2015,11).getInputs().get(0).toCharArray() ;
		
		do {
			incrPlus(password) ;
		} while(!conform(password))  ;
		
		System.out.println(String.valueOf(password));
	}
	
	private static boolean conform(char[] password) {
		for (int i = 0 ; i < 8 ; i++)
			if (password[i] == 'i' || password[i] == 'o' || password[i] == 'l') return false ;
		boolean three = false;
		for (int i = 0 ; i < 6 ; i++)
			if (password[i+1] == password[i] + 1 && password[i+2] == password[i+1] + 1) three = true ;
		if (!three) return false ;
		boolean lastOne = false ;
		for (int i = 1 ; i < 6 ; i++) {
			boolean one = false ;
			for (int j = 0 ; j < i ; j++) {
				if (password[j] == password[j+1]) {
					one = true ;
					break ;
				}
			}
			boolean two = false ;
			for (int j = i+1 ; j < 7 ; j++) {
				if (password[j] == password[j+1]) {
					two = true ;
					break ;
				}
			}
			lastOne = one && two ;
			if (lastOne) break ;
		}
		return lastOne ;
	}

	public static HM incr(char c) {
		if ((int)c == 122) return new HM('a',true) ;
		return new HM((char)((int)c + 1),false) ;
	}
	
	public static void incrPlus(char[] chars) {
		for (int i = 7 ; i > 0 ; i --) {
			HM val1 = incr(chars[i]) ;
			chars[i] = val1.value() ;
			if (!val1.carriage()) return ;
		}
	}
	
	public static class HM {
		private char val ;
		private boolean carriage ;
		
		public HM(char val, boolean carriage) {
			this.val = val;
			this.carriage = carriage;
		}
		
		public boolean carriage() {
			return carriage ;
		}
		
		public char value() {
			return val ;
		}
		
		@Override
		public String toString() {
			return "" + val ;
		}
	}
}

package advent2020.puzzle4;

import java.io.IOException;
import java.util.List;

import advent2020.Utils;

public class Launcher {

	public static void main(String[] args) throws IOException {
		
		List<String> inputs = Utils.getInputs(4) ;
		int result = 0 ;
		Passport p = new Passport() ;
		
		for (String s : inputs) {
			if (s.isBlank()) {
				if (p.isValid()) result ++ ;
				p = new Passport() ;
			} else {
				String[] content = s.split(" ") ;
				for (int i = 0; i < content.length; i++) p.update(content[i]);
			}
		}
		System.out.println(result);
	}
}

package advent2020.puzzle4;

import java.io.IOException;
import java.util.List;

import adventutils.input.InputLoader;

public class Launcher {

	public static void main(String[] args) throws IOException {
		
		List<String> inputs = new InputLoader(2020,4).getInputs() ;
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

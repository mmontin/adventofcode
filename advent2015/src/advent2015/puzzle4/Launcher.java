package advent2015.puzzle4;

import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import adventutils.input.InputLoader;

public class Launcher {

	public static void main(String[] args) throws IOException, NoSuchAlgorithmException {
		String s = new InputLoader(2015,4).getInputs().get(0);
		MessageDigest m = MessageDigest.getInstance("MD5");
		Integer counter = 0;
		String stmp;
		String hashcode;
		do {
			counter ++ ;
			m.reset();
			stmp = s.concat(counter.toString()) ;
			hashcode = String.format("%032x", new BigInteger(1, m.digest(stmp.getBytes())));
		} while (!hashcode.startsWith("000000"));
		System.out.println(counter);
	}
}

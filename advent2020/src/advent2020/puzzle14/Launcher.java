package advent2020.puzzle14;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import adventutils.input.InputLoader;

public class Launcher {

	private static String mask = null;
	private static Map<Long, Long> data = new HashMap<>();

	public static void main(String[] args) throws IOException {
		for (String s : new InputLoader(2020,14).getInputs()) {
			String[] split = s.split(" = ");
			if (split[0].equals("mask"))
				mask = split[1];
			else {
				List<Long> adresses = new ArrayList<Long>();
				addAllAddresses(adresses, 0, createAdresse(Long.parseLong(split[0].substring(4, split[0].length() - 1)),
						mask.toCharArray())); // Long.parseLong(split[0].substring(4,split[0].length()-1)),
												// mask.toCharArray());
				Long value = Long.parseLong(split[1]);
				for (Long l : adresses)
					data.put(l, value);
			}
			// data.put(Long.parseLong(split[0].substring(4,split[0].length()-1)), new
			// ThirtySixBits(Long.parseLong(split[1])).applyMask(mask)) ;
		}
		System.out.println(data.values().stream().reduce(0L, Long::sum));
	}

	private static char[] createAdresse(long v, char[] mask) {
		char[] add = String.format("%36s", Long.toBinaryString(v)).replaceAll(" ", "0").toCharArray();
		for (int i = 0; i < 36; i++) if (mask[i] != '0') add[i] = mask[i];	
		return add;
	}

	private static void addAllAddresses(List<Long> currentAdresses, int offset, char[] address) {
		if (offset < address.length) {
			if (address[offset] == 'X') {
				char[] address1 = address;
				char[] address2 = address.clone();
				address1[offset] = '1';
				address2[offset] = '0';
				addAllAddresses(currentAdresses, offset + 1, address1);
				addAllAddresses(currentAdresses, offset + 1, address2);
			} else {
				addAllAddresses(currentAdresses, offset + 1, address);
			}
		} else if (offset == address.length)
			currentAdresses.add(Long.parseLong(String.valueOf(address), 2));
	}

//	private static class ThirtySixBits {
//		
//		private boolean[] data ;
//
//		public void update(String input) {
//			for (int i = 0 ; i < 36 ; i++) 
//				data[i] = input.charAt(i) == '0' ? false : true ; 
//		}
//		
//		public ThirtySixBits(Long v) {
//			this.data = new boolean[36] ;
//			this.update(String.format("%36s", Long.toBinaryString(v)).replaceAll(" ", "0"));
//		}
//		
//		public ThirtySixBits applyMask(String mask) {
//			for (int i = 0 ; i < 36 ; i++) {
//				char c = mask.charAt(i) ;
//				if (c == '1') data[i] = true ;
//			}
//			return this ;
//		}
//		
//		public Long valueOf() {
//			String s = "" ;
//			for (int i = 0 ; i < data.length ; i++)
//				s += data[i] ? "1" : "0" ;
//			return Long.parseLong(s, 2) ;
//		}
//	}
}

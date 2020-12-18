package advent2015.puzzle7;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import advent2015.Utils;

public class Launcher {

	protected static Map<String, MyShort> circuit = new HashMap<>();
	
	public static void main(String[] args) throws IOException, InterruptedException {

		List<Instruction> instructions = new ArrayList<Instruction>() ;
		
		for (String s : Utils.getInputs(7)) {
			String[] split = s.split(" -> ") ;
			try {
				circuit.put(split[1], new MyShort(Integer.parseInt(split[0]))) ;
			} catch (NumberFormatException nfe) {
				instructions.add(new Instruction(split[0], split[1])) ;
			} 
		}
		
		while(instructions.size() > 0) {
			if (!instructions.get(0).execute()) {
				instructions.add(instructions.get(0)) ;
			}
			instructions.remove(0) ;
		}

		System.out.println(circuit.get("lx").toInt()) ;
	}
	
	private static class MyShort {
		private boolean[] data ;
		
		public MyShort(Integer v) {
			data = new boolean[16] ;
			int q = v;
			int r ;
			for (int i = 0 ; i < 16 ; i++) {
				r = q % 2 ;
				q = (q - r) / 2 ;
				data[i] = r == 0 ? false : true ;
			}
		}
		
		public MyShort(boolean[] data) {
			this.data = data ;
		}
		
		public static MyShort createMyShortFromNot(MyShort other) {
			boolean[] _data = new boolean[16] ; 
			for (int i = 0 ; i < 16 ; i++) _data[i] = !other.data[i] ;
			return new MyShort(_data) ;
		}

		public static MyShort createMyShortFromAnd(MyShort other1, MyShort other2) {
			boolean[] _data = new boolean[16] ; 
			for (int i = 0 ; i < 16 ; i++) _data[i] = other1.data[i] & other2.data[i] ;
			return new MyShort(_data) ;
		}
		
		public static MyShort createMyShortFromOr(MyShort other1, MyShort other2) {
			boolean[] _data = new boolean[16] ; 
			for (int i = 0 ; i < 16 ; i++) _data[i] = other1.data[i] | other2.data[i] ;
			return new MyShort(_data) ;
		}
		
		public static MyShort createMyShortFromLShift(MyShort other, int shift) {
			boolean[] _data = new boolean[16] ; 
			for (int i = 0 ; i < Math.min(shift, 16) ; i++) _data[i] = false ;
			for (int i = shift ; i < 16 ; i++) _data[i] = other.data[i - shift] ;
			return new MyShort(_data) ;
		}
		
		public static MyShort createMyShortFromRShift(MyShort other, int shift) {
			boolean[] _data = new boolean[16] ; 
			for (int i = shift ; i < 16 ; i++) _data[i - shift] = other.data[i] ;
			for (int i = 16 - shift ; i < 16 ; i++) _data[i] = false ;
			return new MyShort(_data) ;
		}
		
		@Override
		public String toString() {
			String s = "[" ;
			for (int i = 0 ; i < 16 ; i++) s = s + " " + data[i] ;
			return s + "]" ;
		}
		
		public int toInt() {
			int res = 0 ;
			for (int i = 0 ; i < 16 ; i++) if (data[i]) res += Math.pow(2, i) ;
			return res ;
		}
	}

	public static enum Operator {
		AND, OR, LSHIFT, RSHIFT, NOT ;
	}
	
	public static class Instruction {
		
		private Operator op ;
		private String op1 ;
		private String op2 ;
		private String out ;
		
		@Override
		public String toString() {
			return op1 + " " + op + " " + op2 + " -> " + out ;
		}
		
		public Instruction(String left, String right) {
			String[] split = left.split(" ") ;
			if (split[0].equals("NOT")) {
				this.op = Operator.NOT ;
				this.op1 = split[1] ;
				this.op2 = "" ;
			} else {
				this.op = Operator.valueOf(split[1]) ;
				this.op1 = split[0] ;
				this.op2 = split[2] ;
			}
			this.out = right ;
		}
		
		public boolean execute() {
			Integer v1 = null ;
			try {
				v1 = Integer.parseInt(op1) ;
			} catch (Exception e) {
				MyShort ms = circuit.get(op1) ;
				if (ms != null)	v1 = ms.toInt() ;
			}
			if (v1 == null) return false ;
			
			Integer v2 = null ;
			try {
				v2 = Integer.parseInt(op2) ;
			} catch (Exception e) {
				MyShort ms = circuit.get(op2) ;
				if (ms != null)	v2 = ms.toInt() ;
			}

			if (v2 == null && op != Operator.NOT) return false ;
			switch (op) {
			case NOT:
				circuit.put(out, MyShort.createMyShortFromNot(new MyShort(v1))) ;
				return true ;
			case AND:
				circuit.put(out, MyShort.createMyShortFromAnd(new MyShort(v1), new MyShort(v2))) ;
				return true ;
			case OR:
				circuit.put(out, MyShort.createMyShortFromOr(new MyShort(v1), new MyShort(v2))) ;
				return true ;
			case LSHIFT:
				circuit.put(out, MyShort.createMyShortFromLShift(new MyShort(v1), v2)) ;
				return true ;
			default:
				circuit.put(out, MyShort.createMyShortFromRShift(new MyShort(v1), v2)) ;
				return true ;
			}
		}
	}
}
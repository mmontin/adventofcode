package advent2015.puzzle23

import advent2015.Utils
import java.util.List
import com.google.common.primitives.UnsignedLong

class Launcher {
	
	static final UnsignedLong ZERO = UnsignedLong::ZERO
	static final UnsignedLong ONE = UnsignedLong::ONE
	static final UnsignedLong TWO = UnsignedLong.valueOf(2)
	static final UnsignedLong THREE = UnsignedLong.valueOf(3)
	
	static int current_instruction = 0
	static UnsignedLong a = UnsignedLong::ONE
	static UnsignedLong b = UnsignedLong::ZERO
	static List<String> instructions = Utils.getInputs(23)
	
	def static void main(String[] args) {

		while(current_instruction >= 0 && current_instruction < instructions.size) 
			execute(instructions.get(current_instruction))
			
		println(b)
	}
	
	def static execute(String s) {
		val split = s.split(' ')
		switch(split.get(0)) {
			case 'hlf' : { 
				split.get(1).equals('a') ? a = a.dividedBy(TWO) : b = b.dividedBy(TWO)
				current_instruction ++	
			}
			case 'tpl' : {
				split.get(1).equals('a') ? a = a.times(THREE) : b = b.times(THREE)
				current_instruction ++
			} 
			case 'inc' : {
				split.get(1).equals('a') ? a = a.plus(ONE) : b = b.plus(ONE)
				current_instruction ++
			} 
			case 'jmp' : current_instruction += Integer::parseInt(split.get(1))
			case 'jie' : isEven(split.get(1)) ? current_instruction += Integer::parseInt(split.get(2)) : current_instruction ++
			default : isOne(split.get(1)) ? current_instruction += Integer::parseInt(split.get(2)) : current_instruction ++
		}	
	}
	
	def static isEven(String s) {
		s.substring(0,1).equals('a') ? a.mod(TWO).equals(ZERO) : b.mod(TWO).equals(ZERO)
	}
	
	def static isOne(String s) {
		s.substring(0,1).equals('a') ? a.equals(ONE) : b.equals(ONE)
	}
}
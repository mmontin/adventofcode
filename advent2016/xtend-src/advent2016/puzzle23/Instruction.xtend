package advent2016.puzzle23

class Instruction {
	
	InstructionType type
	String arg1
	String arg2
	
	new(String s) {
		val split = s.split(" ")
		type = switch (split.get(0)) {
			case "cpy" : InstructionType.CPY
			case "inc" : InstructionType.INC
			case "dec" : InstructionType.DEC
			case "jnz" : InstructionType.JNZ
			default : InstructionType.TGL
		}
		arg1 = split.get(1)
		if (split.size == 3)
			arg2 = split.get(2)
	}
	
	override toString() {
		type + " " + arg1 + " " + arg2
	}
	
	def toggle() {
		type = switch(type) {
			case CPY : InstructionType.JNZ
			case INC : InstructionType.DEC 
			case DEC : InstructionType.INC
			case JNZ : InstructionType.CPY
			default : InstructionType.INC
		}
	}
	
	def execute() {
		switch(type) {
			case CPY : {
				if (Launcher.registers.containsKey(arg2)) {
					var int v
					try 
						v = Integer::parseInt(arg1)
					catch (NumberFormatException nfe)
						v = Launcher.registers.get(arg1)
					Launcher.registers.replace(arg2,v)
				}
				Launcher.position ++
			}
			case INC, case DEC : {
				val value = Launcher.registers.get(arg1)
				val isInc = type.equals(InstructionType.INC)
				if (value !== null)
					Launcher.registers.replace(arg1, isInc ? value+1 : value-1)
				Launcher.position ++
			}
			case JNZ : {
				var int x
				try
					x = Integer::parseInt(arg1)
				catch (NumberFormatException nfe)
					x = Launcher.registers.get(arg1)
				var int y
				try
					y = Integer::parseInt(arg2)
				catch (NumberFormatException nfe)
					y = Launcher.registers.get(arg2)
				Launcher.position += (x == 0) ? 1 : y
			}
			default : {
				var int r
				try
					r = Integer::parseInt(arg1)
				catch (NumberFormatException nbe)
					r = Launcher.registers.get(arg1)
				val index = Launcher.position + r
				if (index < Launcher.instructions.size)
					Launcher.instructions.get(index).toggle
				Launcher.position ++
			}
		}
	}
	
	private enum InstructionType {
		CPY, INC, DEC, JNZ, TGL
	}
}
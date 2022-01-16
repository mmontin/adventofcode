package advent2021.puzzle24

class Division extends BinaryInstruction {
		
	new(String[] split) {
		super(split)
	}
	
	override header() {
		'if (' + right + ' == 0) {' + '\n'
		+ '\t' + 'throw new ALUException() ;' + '\n'
		+ '} else {' + '\n' 
		+ '\t'
	}
	
	override footer() {
		'\n'
		+ '}'
	}
	
	override op() {
		'/'
	}
}
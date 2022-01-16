package advent2021.puzzle24

class Modulo extends BinaryInstruction {
	
	new(String[] split) {
		super(split)
	}
	
	override header() {
		'if (' + left + ' < 0 || ' + right + ' <= 0) {' + '\n'
		+ '\t' + 'throw new ALUException() ;' + '\n'
		+ '} else {' + '\n' 
		+ '\t'
	}
	
	override footer() {
		'\n'
		+ '}'
	}
	
	override op() {
		'%'
	}
}
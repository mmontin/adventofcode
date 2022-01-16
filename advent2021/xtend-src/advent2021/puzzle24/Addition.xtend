package advent2021.puzzle24

class Addition extends BinaryInstruction {
	
	new(String[] split) {
		super(split)
	}
	
	override header() {
		""
	}
	
	override footer() {
		""
	}
	
	override op() {
		'+'
	}
}
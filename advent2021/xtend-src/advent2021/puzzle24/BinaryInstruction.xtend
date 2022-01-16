package advent2021.puzzle24

abstract class BinaryInstruction extends Instruction {
	
	protected String left
	protected String right
	
	new(String[] split) {
		left = split.get(1)
		right = split.get(2)
	}
	
	def abstract String header()
	def abstract String footer()
	def abstract String op()
	
	override toString() {
		header + left + ' ' + op + '= ' + right + ' ;' + footer
	}
}
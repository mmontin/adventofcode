package advent2021.puzzle4

import java.lang.Exception

class CompletedException extends Exception {
	
	protected Integer result
	
	new(int value, int lastCalled) {
		result = value * lastCalled
	}
}
package adventutils.collection

import java.util.ArrayList
import java.util.List

class AgdaList<T> extends ArrayList<T> {
	
	override toString() {
		if (isEmpty) "[]" else '(' + this.join(" ∷ ") + " ∷ [])"
	}
	
	new(List<T> list) {
		super(list)
	}
	
	new(Integer size) {
		super (size)
	}
	
	new() {
		super()
	}
}

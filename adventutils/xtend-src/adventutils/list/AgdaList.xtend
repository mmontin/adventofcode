package adventutils.list

import java.util.ArrayList

class AgdaList<T> extends ArrayList<T> {
	
	override toString() {
		'(' + this.join(" ∷ ") + " ∷ [])"
	}
}

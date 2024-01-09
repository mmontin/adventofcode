package advent2023

class Launcher {
	def static void main(String[] args) {
		val initial = System.currentTimeMillis ;
		(1..25).map[Class.forName("advent2023.Day" + it)].forEach[
			val meth = it.methods.findFirst[it.name == "main"]
			println("---------------------------")
			println("Day " + it.name.split("Day").get(1))
			val ts = System.currentTimeMillis
			val Object[] args1 = #[#[] as String[]]
			meth.invoke(null,args1)
			println("Computed in " + (System.currentTimeMillis - ts) + "ms")
		]
		
		val duration = System.currentTimeMillis - initial
		println("---------------------------------")
		println("Total computation time for 2023: ")
		println("-- " + duration / 1000 + " seconds and " + duration % 1000 + " ms       --")
		println("---------------------------------")
	}
}
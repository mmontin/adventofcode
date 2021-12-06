package advent2015.puzzle16

class Sue {
	
	protected Integer number
	
	Integer children
	Integer cats
	Integer samoyeds
	Integer pomeranians
	Integer akitas
	Integer vizslas
	Integer goldfish
	Integer trees
	Integer cars
	Integer perfumes
	
	new(String input) {
		
		children = null
		cats = null
		samoyeds = null
		pomeranians = null
		akitas = null
		vizslas = null
		goldfish = null
		trees = null
		cars = null
		perfumes = null
		
		val split = input.split(" ")
		
		number = Integer::parseInt(removeLast(split.get(1)))		
		
		assign(removeLast(split.get(2)), Integer::parseInt(removeLast(split.get(3))))
		assign(removeLast(split.get(4)), Integer::parseInt(removeLast(split.get(5))))
		assign(removeLast(split.get(6)), Integer::parseInt(split.get(7)))
	}
	
	def assign(String input, Integer value) {
		switch (input) {
			case "children" : children = value
			case "cats" : cats = value
			case "samoyeds" : samoyeds = value
			case "pomeranians" : pomeranians = value
			case "akitas" : akitas = value
			case "vizslas" : vizslas = value
			case "goldfish" : goldfish = value
			case "trees" : trees = value
			case "cars" : cars = value
			default : perfumes = value
		}
	} 
	
	def removeLast(String s) {
		s.substring(0,s.length - 1)
	}
	
	def valid() {
		(children === null || children == 3) &&
		(cats === null || cats > 7) &&
		(samoyeds === null || samoyeds == 2) &&
		(pomeranians === null || pomeranians < 3) &&
		(akitas === null || akitas == 0) &&
		(vizslas === null || vizslas == 0) &&
		(goldfish === null || goldfish < 5) &&
		(trees === null || trees > 3) &&
		(cars === null || cars == 2) &&
		(perfumes === null || perfumes == 1)
	}
}
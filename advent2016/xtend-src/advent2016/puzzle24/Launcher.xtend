package advent2016.puzzle24

import adventutils.astar.AStar
import adventutils.astar.State
import adventutils.geometry.Coordinate
import adventutils.graphic.FramedImage
import adventutils.input.InputLoader
import java.util.ArrayList
import java.util.HashSet
import java.util.List
import java.util.Map
import java.util.Set

class Launcher {

	static public Set<Coordinate> walls = newHashSet
	static public Set<Coordinate> objectives = newHashSet
	
	static public Coordinate initial
	
	static public Map<Set<Coordinate>, Integer> distances = newHashMap
	static public Map<Pair<Coordinate,Coordinate>,List<State>> paths = newHashMap
	
	static public List<List<Integer>> map = newArrayList
	
	def static void main(String[] args) {
		var lineNumber = 0
		for (line : new InputLoader(2016, 24).inputs) {
			val listLine = newArrayList
			map.add(listLine)
			for (columnNumber : 0 ..< line.length) {
				try {
					val v = Integer::parseInt(line.charAt(columnNumber) + '')
					if (v == 0) initial = new Coordinate(lineNumber, columnNumber)
					objectives.add(new Coordinate(lineNumber, columnNumber))
					listLine.add(FramedImage.GREEN)
				} catch (NumberFormatException nfe) {
					if ((line.charAt(columnNumber) + '').equals("#")) {
						walls.add(new Coordinate(lineNumber, columnNumber))
						listLine.add(FramedImage.BLACK)
					} else
						listLine.add(FramedImage.WHITE)
				}
			}
			lineNumber++
		}

		for (i : 0..<objectives.size) {
			val source = objectives.get(i)
			for (j : i+1..<objectives.size) {
				val target = objectives.get(j)
				val astar = new AStar(new CoordinateState(source,target)).run
				distances.put(newHashSet(source,target),astar.minDistance)
				val path = astar.minPath
				paths.put(new Pair(source,target),path)
				paths.put(new Pair(target,source),new ArrayList(path).reverse)
			}
		}

		val finalAStar = new AStar(new OverState(initial,new HashSet(objectives))).run
		println(finalAStar.minDistance)
		
//		val fi = new FramedImage("Labyrinthe",map)
//		fi.scale(5)
//		fi.commit
//		fi.show
//		val finalPath = finalAStar.minPath
//		for (i : 0..<finalPath.size-1) {
//			paths.get(new Pair(
//				(finalPath.get(i) as OverState).currentPosition,
//				(finalPath.get(i+1) as OverState).currentPosition
//			)).map[it as Coordinate].forEach[ c |
//				map.get(c.x).set(c.y,FramedImage.RED)
//				fi.imageFromPixels = map
//				fi.scale(5)
//				fi.commit(100)
//			]
//		}
	}
}

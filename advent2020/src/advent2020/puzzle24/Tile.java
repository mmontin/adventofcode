package advent2020.puzzle24;

public class Tile {
	
	private boolean isWhite ;
	private int blackNeighbours ;
	
	public Tile(boolean white) {
		this.isWhite = white ;
		this.blackNeighbours = 0 ;
	}
	
	public Tile(boolean white, int neighbours) {
		this.isWhite = white ;
		this.blackNeighbours = neighbours ;
	}
	
	public Tile addBlackNeighbour() {
		this.blackNeighbours ++ ;
		return this ;
	}
	
	public boolean getNextColor() {
		return isWhite ? !(this.blackNeighbours == 2) : (this.blackNeighbours == 0 || this.blackNeighbours > 2) ;
	}
	
	public Tile flip() {
		this.isWhite = !this.isWhite ;
		return this ;
	}
	
	public boolean isWhite() {
		return isWhite ;
	}
	
	@Override
	public String toString() {
		return "" + (isWhite ? "White" : "Black") + " : " + blackNeighbours ; 
	}
	
	public Tile setColor(boolean color) {
		this.isWhite = color ;
		return this ;
	}
}

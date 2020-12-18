package advent2020.puzzle4;

public class Passport {

	private boolean ecl;
	private boolean eyr;
	private boolean hcl;
	private boolean byr;
	private boolean iyr;
	private boolean pid;
	private boolean hgt;

	public Passport() {
		this.ecl = false;
		this.eyr = false;
		this.hcl = false;
		this.byr = false;
		this.iyr = false;
		this.pid = false;
		this.hgt = false;
	}

	public boolean isValid() {
		return ecl && eyr && hcl && byr && iyr && pid && hgt;
	}

	public void update(String up) {
		String id = up.split(":")[0];
		String val = up.split(":")[1];
		switch (id) {
		case "ecl": {
			ecl = val.equals("amb") || val.equals("blu") || val.equals("brn") || val.equals("gry") || val.equals("grn")
					|| val.equals("hzl") || val.equals("oth");
			break;
		}
		case "eyr": {
			int year = Integer.parseInt(val);
			eyr = year >= 2020 && year <= 2030 ;
			break;
		}
		case "hcl": {
			hcl = val.matches("#[0-9a-z]{6}+");
			break;
		}
		case "byr": {
			int year = Integer.parseInt(val);
			byr = year >= 1920 && year <= 2002 ;
			break;
		}
		case "iyr": {
			int year = Integer.parseInt(val);
			iyr = year >= 2010 && year <= 2020 ;
			break;
		}
		case "pid": {
			pid = val.matches("[0-9]{9}+");
			break;
		}
		case "hgt": {
			if (val.endsWith("in")) {
				int size = Integer.parseInt(val.split("in")[0]) ;
				hgt = 59 <= size && size <= 76 ;
			} else if (val.endsWith("cm")) {
				int size = Integer.parseInt(val.split("cm")[0]) ;
				hgt = 150 <= size && size <= 193 ;
			} 
			break;
		}
		default:
			break;
		}
	}
}

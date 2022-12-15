package advent2015.puzzle16;

import com.google.common.base.Objects;

@SuppressWarnings("all")
public class Sue {
  protected Integer number;

  private Integer children;

  private Integer cats;

  private Integer samoyeds;

  private Integer pomeranians;

  private Integer akitas;

  private Integer vizslas;

  private Integer goldfish;

  private Integer trees;

  private Integer cars;

  private Integer perfumes;

  public Sue(final String input) {
    this.children = null;
    this.cats = null;
    this.samoyeds = null;
    this.pomeranians = null;
    this.akitas = null;
    this.vizslas = null;
    this.goldfish = null;
    this.trees = null;
    this.cars = null;
    this.perfumes = null;
    final String[] split = input.split(" ");
    this.number = Integer.valueOf(Integer.parseInt(this.removeLast(split[1])));
    this.assign(this.removeLast(split[2]), Integer.valueOf(Integer.parseInt(this.removeLast(split[3]))));
    this.assign(this.removeLast(split[4]), Integer.valueOf(Integer.parseInt(this.removeLast(split[5]))));
    this.assign(this.removeLast(split[6]), Integer.valueOf(Integer.parseInt(split[7])));
  }

  public Integer assign(final String input, final Integer value) {
    Integer _switchResult = null;
    boolean _matched = false;
    if (Objects.equal(input, "children")) {
      _matched=true;
      _switchResult = this.children = value;
    }
    if (!_matched) {
      if (Objects.equal(input, "cats")) {
        _matched=true;
        _switchResult = this.cats = value;
      }
    }
    if (!_matched) {
      if (Objects.equal(input, "samoyeds")) {
        _matched=true;
        _switchResult = this.samoyeds = value;
      }
    }
    if (!_matched) {
      if (Objects.equal(input, "pomeranians")) {
        _matched=true;
        _switchResult = this.pomeranians = value;
      }
    }
    if (!_matched) {
      if (Objects.equal(input, "akitas")) {
        _matched=true;
        _switchResult = this.akitas = value;
      }
    }
    if (!_matched) {
      if (Objects.equal(input, "vizslas")) {
        _matched=true;
        _switchResult = this.vizslas = value;
      }
    }
    if (!_matched) {
      if (Objects.equal(input, "goldfish")) {
        _matched=true;
        _switchResult = this.goldfish = value;
      }
    }
    if (!_matched) {
      if (Objects.equal(input, "trees")) {
        _matched=true;
        _switchResult = this.trees = value;
      }
    }
    if (!_matched) {
      if (Objects.equal(input, "cars")) {
        _matched=true;
        _switchResult = this.cars = value;
      }
    }
    if (!_matched) {
      _switchResult = this.perfumes = value;
    }
    return _switchResult;
  }

  public String removeLast(final String s) {
    int _length = s.length();
    int _minus = (_length - 1);
    return s.substring(0, _minus);
  }

  public boolean valid() {
    return (((((((((((this.children == null) || ((this.children).intValue() == 3)) && ((this.cats == null) || ((this.cats).intValue() > 7))) && ((this.samoyeds == null) || ((this.samoyeds).intValue() == 2))) && ((this.pomeranians == null) || ((this.pomeranians).intValue() < 3))) && ((this.akitas == null) || ((this.akitas).intValue() == 0))) && ((this.vizslas == null) || ((this.vizslas).intValue() == 0))) && ((this.goldfish == null) || ((this.goldfish).intValue() < 5))) && ((this.trees == null) || ((this.trees).intValue() > 3))) && ((this.cars == null) || ((this.cars).intValue() == 2))) && ((this.perfumes == null) || ((this.perfumes).intValue() == 1)));
  }
}

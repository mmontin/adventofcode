package advent2021.puzzle22;

import java.math.BigInteger;
import java.util.HashSet;
import java.util.Set;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;

@SuppressWarnings("all")
public class Cuboid {
  private int minx;
  
  private int maxx;
  
  private int miny;
  
  private int maxy;
  
  private int minz;
  
  private int maxz;
  
  public Cuboid(final int minx_, final int maxx_, final int miny_, final int maxy_, final int minz_, final int maxz_) {
    this.minx = minx_;
    this.maxx = maxx_;
    this.miny = miny_;
    this.maxy = maxy_;
    this.minz = minz_;
    this.maxz = maxz_;
  }
  
  public Cuboid(final String s) {
    final String[] split = s.split(",");
    final String[] split2 = (split[0]).split("\\.\\.");
    this.minx = Integer.parseInt((split2[0]).substring(2));
    this.maxx = Integer.parseInt(split2[1]);
    final String[] split3 = (split[1]).split("\\.\\.");
    this.miny = Integer.parseInt((split3[0]).substring(2));
    this.maxy = Integer.parseInt(split3[1]);
    final String[] split4 = (split[2]).split("\\.\\.");
    this.minz = Integer.parseInt((split4[0]).substring(2));
    this.maxz = Integer.parseInt(split4[1]);
  }
  
  public BigInteger size() {
    return BigInteger.valueOf(((this.maxx - this.minx) + 1)).multiply(BigInteger.valueOf(((this.maxy - this.miny) + 1))).multiply(BigInteger.valueOf(((this.maxz - this.minz) + 1)));
  }
  
  public Set<Cuboid> subtract(final Cuboid other) {
    HashSet<Cuboid> _xifexpression = null;
    if (((((((other.minx > this.maxx) || (other.maxx < this.minx)) || (other.miny > this.maxy)) || (other.maxy < this.miny)) || (other.minz > this.maxz)) || (other.maxz < this.minz))) {
      _xifexpression = CollectionLiterals.<Cuboid>newHashSet(this);
    } else {
      HashSet<Cuboid> _xblockexpression = null;
      {
        final HashSet<Cuboid> output = CollectionLiterals.<Cuboid>newHashSet();
        if ((other.minx > this.minx)) {
          Cuboid _cuboid = new Cuboid(this.minx, (other.minx - 1), this.miny, this.maxy, this.minz, this.maxz);
          output.add(_cuboid);
          this.minx = other.minx;
        }
        if ((other.maxx < this.maxx)) {
          Cuboid _cuboid_1 = new Cuboid((other.maxx + 1), this.maxx, this.miny, this.maxy, this.minz, this.maxz);
          output.add(_cuboid_1);
          this.maxx = other.maxx;
        }
        if ((other.miny > this.miny)) {
          Cuboid _cuboid_2 = new Cuboid(this.minx, this.maxx, this.miny, (other.miny - 1), this.minz, this.maxz);
          output.add(_cuboid_2);
          this.miny = other.miny;
        }
        if ((other.maxy < this.maxy)) {
          Cuboid _cuboid_3 = new Cuboid(this.minx, this.maxx, (other.maxy + 1), this.maxy, this.minz, this.maxz);
          output.add(_cuboid_3);
          this.maxy = other.maxy;
        }
        if ((other.minz > this.minz)) {
          Cuboid _cuboid_4 = new Cuboid(this.minx, this.maxx, this.miny, this.maxy, this.minz, (other.minz - 1));
          output.add(_cuboid_4);
          this.minz = other.minz;
        }
        if ((other.maxz < this.maxz)) {
          Cuboid _cuboid_5 = new Cuboid(this.minx, this.maxx, this.miny, this.maxy, (other.maxz + 1), this.maxz);
          output.add(_cuboid_5);
          this.maxz = other.maxz;
        }
        _xblockexpression = output;
      }
      _xifexpression = _xblockexpression;
    }
    return _xifexpression;
  }
}

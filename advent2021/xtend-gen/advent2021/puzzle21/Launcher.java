package advent2021.puzzle21;

import com.google.common.base.Objects;
import java.math.BigInteger;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;

@SuppressWarnings("all")
public class Launcher {
  public static class Player {
    private int square;

    private int score;

    public Player(final int square_) {
      this.square = (square_ - 1);
      this.score = 0;
    }

    public int play(final int dice) {
      int _xblockexpression = (int) 0;
      {
        this.square = ((this.square + dice) % 10);
        int _score = this.score;
        _xblockexpression = this.score = (_score + (this.square + 1));
      }
      return _xblockexpression;
    }

    public int getScore() {
      return this.score;
    }
  }

  public static class Result {
    private BigInteger nb1;

    private BigInteger nb2;

    public Result(final boolean p1) {
      BigInteger _xifexpression = null;
      if (p1) {
        _xifexpression = BigInteger.ONE;
      } else {
        _xifexpression = BigInteger.ZERO;
      }
      this.nb1 = _xifexpression;
      BigInteger _xifexpression_1 = null;
      if (p1) {
        _xifexpression_1 = BigInteger.ZERO;
      } else {
        _xifexpression_1 = BigInteger.ONE;
      }
      this.nb2 = _xifexpression_1;
    }

    public Launcher.Result add(final Launcher.Result r, final int coeff) {
      Launcher.Result _xblockexpression = null;
      {
        final BigInteger coeffb = BigInteger.valueOf(coeff);
        this.nb1 = this.nb1.add(r.nb1.multiply(coeffb));
        this.nb2 = this.nb2.add(r.nb2.multiply(coeffb));
        _xblockexpression = this;
      }
      return _xblockexpression;
    }

    public String toString() {
      return (((("(" + this.nb1) + ",") + this.nb2) + ")");
    }
  }

  public static class Game {
    private int square1;

    private int score1;

    private int square2;

    private int score2;

    private boolean p1;

    public Game(final int square1_, final int score1_, final int square2_, final int score2_, final boolean p1_) {
      this.square1 = square1_;
      this.square2 = square2_;
      this.score1 = score1_;
      this.score2 = score2_;
      this.p1 = p1_;
    }

    public Game(final Launcher.Game other) {
      this(other.square1, other.score1, other.square2, other.score2, other.p1);
    }

    public Launcher.Result step() {
      Launcher.Result _xifexpression = null;
      if ((this.p1 && (this.score2 > 20))) {
        _xifexpression = new Launcher.Result(false);
      } else {
        Launcher.Result _xifexpression_1 = null;
        if (((!this.p1) && (this.score1 > 20))) {
          _xifexpression_1 = new Launcher.Result(true);
        } else {
          Launcher.Result _xblockexpression = null;
          {
            final Launcher.Result r1 = new Launcher.Game(this).play(3).step();
            final Launcher.Result r2 = new Launcher.Game(this).play(4).step();
            final Launcher.Result r3 = new Launcher.Game(this).play(5).step();
            final Launcher.Result r4 = new Launcher.Game(this).play(6).step();
            final Launcher.Result r5 = new Launcher.Game(this).play(7).step();
            final Launcher.Result r6 = new Launcher.Game(this).play(8).step();
            final Launcher.Result r7 = new Launcher.Game(this).play(9).step();
            _xblockexpression = r1.add(r2, 3).add(r3, 6).add(r4, 7).add(r5, 6).add(r6, 3).add(r7, 1);
          }
          _xifexpression_1 = _xblockexpression;
        }
        _xifexpression = _xifexpression_1;
      }
      return _xifexpression;
    }

    public Launcher.Game play(final int dice) {
      Launcher.Game _xblockexpression = null;
      {
        if (this.p1) {
          this.square1 = ((this.square1 + dice) % 10);
          int _score1 = this.score1;
          this.score1 = (_score1 + (this.square1 + 1));
        } else {
          this.square2 = ((this.square2 + dice) % 10);
          int _score2 = this.score2;
          this.score2 = (_score2 + (this.square2 + 1));
        }
        this.p1 = (!this.p1);
        _xblockexpression = this;
      }
      return _xblockexpression;
    }
  }

  public static void main(final String[] args) {
    final Launcher.Player p1 = new Launcher.Player(10);
    final Launcher.Player p2 = new Launcher.Player(9);
    Launcher.Player current = p2;
    int dice = 0;
    int rolls = 0;
    do {
      {
        int value = 0;
        IntegerRange _upTo = new IntegerRange(0, 2);
        for (final Integer i : _upTo) {
          {
            rolls++;
            int _value = value;
            value = (_value + (dice + 1));
            dice = ((dice + 1) % 100);
          }
        }
        Launcher.Player _xifexpression = null;
        boolean _equals = Objects.equal(current, p1);
        if (_equals) {
          _xifexpression = p2;
        } else {
          _xifexpression = p1;
        }
        current = _xifexpression;
        current.play(value);
      }
    } while((current.score < 1000));
    Launcher.Player _xifexpression = null;
    boolean _equals = Objects.equal(current, p1);
    if (_equals) {
      _xifexpression = p2;
    } else {
      _xifexpression = p1;
    }
    InputOutput.<Integer>println(Integer.valueOf((rolls * _xifexpression.score)));
    InputOutput.<Launcher.Result>println(new Launcher.Game(9, 0, 8, 0, true).step());
  }
}

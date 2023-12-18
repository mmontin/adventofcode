package adventutils.geometry;

import com.google.common.base.Objects;
import java.util.Set;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;

@SuppressWarnings("all")
public class Dir {
  public static Set<Direction> allDirections() {
    return CollectionLiterals.<Direction>newHashSet(Direction.DOWN, Direction.UP, Direction.RIGHT, Direction.LEFT);
  }

  public static Direction fromLeftRight(final String s) {
    Direction _switchResult = null;
    boolean _matched = false;
    if (Objects.equal(s, "<")) {
      _matched=true;
      _switchResult = Direction.LEFT;
    }
    if (!_matched) {
      _switchResult = Direction.RIGHT;
    }
    return _switchResult;
  }

  public static Direction directionFromPole(final String s) {
    Direction _switchResult = null;
    boolean _matched = false;
    if (Objects.equal(s, "N")) {
      _matched=true;
      _switchResult = Direction.UP;
    }
    if (!_matched) {
      if (Objects.equal(s, "S")) {
        _matched=true;
        _switchResult = Direction.DOWN;
      }
    }
    if (!_matched) {
      if (Objects.equal(s, "W")) {
        _matched=true;
        _switchResult = Direction.LEFT;
      }
    }
    if (!_matched) {
      _switchResult = Direction.RIGHT;
    }
    return _switchResult;
  }

  public static Direction opposite(final Direction d) {
    Direction _switchResult = null;
    if (d != null) {
      switch (d) {
        case UP:
          _switchResult = Direction.DOWN;
          break;
        case LEFT:
          _switchResult = Direction.RIGHT;
          break;
        case DOWN:
          _switchResult = Direction.UP;
          break;
        case RIGHT:
          _switchResult = Direction.LEFT;
          break;
        default:
          break;
      }
    }
    return _switchResult;
  }

  public static Direction directionFromString(final String s) {
    Direction _switchResult = null;
    boolean _matched = false;
    if (Objects.equal(s, "U")) {
      _matched=true;
      _switchResult = Direction.UP;
    }
    if (!_matched) {
      if (Objects.equal(s, "D")) {
        _matched=true;
        _switchResult = Direction.DOWN;
      }
    }
    if (!_matched) {
      if (Objects.equal(s, "L")) {
        _matched=true;
        _switchResult = Direction.LEFT;
      }
    }
    if (!_matched) {
      _switchResult = Direction.RIGHT;
    }
    return _switchResult;
  }

  public static Direction directionFromStringNb(final String s) {
    Direction _switchResult = null;
    boolean _matched = false;
    if (Objects.equal(s, "0")) {
      _matched=true;
      _switchResult = Direction.RIGHT;
    }
    if (!_matched) {
      if (Objects.equal(s, "1")) {
        _matched=true;
        _switchResult = Direction.DOWN;
      }
    }
    if (!_matched) {
      if (Objects.equal(s, "2")) {
        _matched=true;
        _switchResult = Direction.LEFT;
      }
    }
    if (!_matched) {
      if (Objects.equal(s, "3")) {
        _matched=true;
        _switchResult = Direction.UP;
      }
    }
    return _switchResult;
  }

  public static Direction nextDirection(final Direction d) {
    Direction _switchResult = null;
    if (d != null) {
      switch (d) {
        case UP:
          _switchResult = Direction.LEFT;
          break;
        case LEFT:
          _switchResult = Direction.DOWN;
          break;
        case DOWN:
          _switchResult = Direction.RIGHT;
          break;
        case RIGHT:
          _switchResult = Direction.UP;
          break;
        default:
          break;
      }
    }
    return _switchResult;
  }

  public static Direction clockWise(final Direction d) {
    Direction _switchResult = null;
    if (d != null) {
      switch (d) {
        case UP:
          _switchResult = Direction.RIGHT;
          break;
        case RIGHT:
          _switchResult = Direction.DOWN;
          break;
        case DOWN:
          _switchResult = Direction.LEFT;
          break;
        case LEFT:
          _switchResult = Direction.UP;
          break;
        default:
          break;
      }
    }
    return _switchResult;
  }

  public static Direction counterClockWise(final Direction d) {
    return Dir.nextDirection(d);
  }

  public static int directionValue(final Direction d) {
    int _switchResult = (int) 0;
    if (d != null) {
      switch (d) {
        case UP:
          _switchResult = 3;
          break;
        case RIGHT:
          _switchResult = 0;
          break;
        case DOWN:
          _switchResult = 1;
          break;
        case LEFT:
          _switchResult = 2;
          break;
        default:
          break;
      }
    }
    return _switchResult;
  }
}

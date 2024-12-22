package adventutils.geometry;

import java.util.Set;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;

@SuppressWarnings("all")
public class Dir {
  public static Set<Direction> allDirections() {
    return CollectionLiterals.<Direction>newHashSet(Direction.DOWN, Direction.UP, Direction.RIGHT, Direction.LEFT);
  }

  public static Direction fromLeftRight(final String s) {
    Direction _switchResult = null;
    if (s != null) {
      switch (s) {
        case "<":
          _switchResult = Direction.LEFT;
          break;
        default:
          _switchResult = Direction.RIGHT;
          break;
      }
    } else {
      _switchResult = Direction.RIGHT;
    }
    return _switchResult;
  }

  public static Direction directionFromPole(final String s) {
    Direction _switchResult = null;
    if (s != null) {
      switch (s) {
        case "N":
          _switchResult = Direction.UP;
          break;
        case "S":
          _switchResult = Direction.DOWN;
          break;
        case "W":
          _switchResult = Direction.LEFT;
          break;
        default:
          _switchResult = Direction.RIGHT;
          break;
      }
    } else {
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
    if (s != null) {
      switch (s) {
        case "U":
          _switchResult = Direction.UP;
          break;
        case "D":
          _switchResult = Direction.DOWN;
          break;
        case "L":
          _switchResult = Direction.LEFT;
          break;
        default:
          _switchResult = Direction.RIGHT;
          break;
      }
    } else {
      _switchResult = Direction.RIGHT;
    }
    return _switchResult;
  }

  public static Direction directionFromStringNb(final String s) {
    Direction _switchResult = null;
    if (s != null) {
      switch (s) {
        case "0":
          _switchResult = Direction.RIGHT;
          break;
        case "1":
          _switchResult = Direction.DOWN;
          break;
        case "2":
          _switchResult = Direction.LEFT;
          break;
        case "3":
          _switchResult = Direction.UP;
          break;
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

  public static Direction directionFromStringArrows(final String s) {
    Direction _switchResult = null;
    if (s != null) {
      switch (s) {
        case "^":
          _switchResult = Direction.UP;
          break;
        case "v":
          _switchResult = Direction.DOWN;
          break;
        case ">":
          _switchResult = Direction.RIGHT;
          break;
        default:
          _switchResult = Direction.LEFT;
          break;
      }
    } else {
      _switchResult = Direction.LEFT;
    }
    return _switchResult;
  }

  public static String directionToStringArrows(final Direction d) {
    String _switchResult = null;
    if (d != null) {
      switch (d) {
        case UP:
          _switchResult = "^";
          break;
        case RIGHT:
          _switchResult = ">";
          break;
        case DOWN:
          _switchResult = "v";
          break;
        case LEFT:
          _switchResult = "<";
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

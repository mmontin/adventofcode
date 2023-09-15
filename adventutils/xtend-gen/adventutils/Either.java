package adventutils;

@SuppressWarnings("all")
public class Either<L extends Object, R extends Object> {
  private final L left;

  private final R right;

  private Either(final L _left, final R _right) {
    this.left = _left;
    this.right = _right;
  }

  public static <L extends Object, R extends Object> Either<L, R> fromLeft(final L _left) {
    return new Either<L, R>(_left, ((R) null));
  }

  public static <L extends Object, R extends Object> Either<L, R> fromRight(final R _right) {
    return new Either<L, R>(((L) null), _right);
  }

  public boolean isRight() {
    return (this.right != null);
  }

  public boolean isLeft() {
    return (this.left != null);
  }

  public L getLeft() {
    return this.left;
  }

  public R getRight() {
    return this.right;
  }
}

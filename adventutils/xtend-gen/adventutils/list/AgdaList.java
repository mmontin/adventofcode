package adventutils.list;

import java.util.ArrayList;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class AgdaList<T extends Object> extends ArrayList<T> {
  public String toString() {
    String _join = IterableExtensions.join(this, " ∷ ");
    String _plus = ("(" + _join);
    return (_plus + " ∷ [])");
  }
}

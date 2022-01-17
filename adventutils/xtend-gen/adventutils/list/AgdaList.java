package adventutils.list;

import java.util.ArrayList;
import java.util.List;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class AgdaList<T extends Object> extends ArrayList<T> {
  public String toString() {
    String _join = IterableExtensions.join(this, " ∷ ");
    String _plus = ("(" + _join);
    return (_plus + " ∷ [])");
  }
  
  public AgdaList(final List<T> list) {
    super(list);
  }
  
  public AgdaList(final Integer size) {
    super((size).intValue());
  }
  
  public AgdaList() {
    super();
  }
}

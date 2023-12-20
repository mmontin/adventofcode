package advent2023;

import java.util.List;
import java.util.Map;
import java.util.Optional;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class Conjunction extends advent2023.Module {
  protected Map<String, Boolean> sources;

  public Conjunction(final List<String> targets_) {
    super(targets_);
    this.sources = CollectionLiterals.<String, Boolean>newHashMap();
  }

  public Boolean addSource(final String source) {
    return this.sources.put(source, Boolean.valueOf(false));
  }

  public Optional<Boolean> generateSignal(final String source, final boolean highPulse) {
    Optional<Boolean> _xblockexpression = null;
    {
      this.sources.put(source, Boolean.valueOf(highPulse));
      final Function2<Boolean, Boolean, Boolean> _function = new Function2<Boolean, Boolean, Boolean>() {
        public Boolean apply(final Boolean x, final Boolean y) {
          return Boolean.valueOf(((x).booleanValue() && (y).booleanValue()));
        }
      };
      Boolean _reduce = IterableExtensions.<Boolean>reduce(this.sources.values(), _function);
      boolean _not = (!(_reduce).booleanValue());
      _xblockexpression = Optional.<Boolean>of(Boolean.valueOf(_not));
    }
    return _xblockexpression;
  }

  public String toString() {
    String _string = super.toString();
    return ((("Receives from " + this.sources) + " ; ") + _string);
  }
}

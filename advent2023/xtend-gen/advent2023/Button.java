package advent2023;

import java.util.Optional;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;

@SuppressWarnings("all")
public class Button extends advent2023.Module {
  public Button() {
    super(CollectionLiterals.<String>newArrayList("broadcaster"));
  }

  public Optional<Boolean> generateSignal(final String source, final boolean highPulse) {
    return Optional.<Boolean>of(Boolean.valueOf(false));
  }
}

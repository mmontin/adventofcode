package advent2021.puzzle18;

import advent2021.Utils;
import com.google.common.base.Objects;
import java.io.BufferedReader;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.List;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.ExclusiveRange;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class Launcher {
  public static void main(final String[] args) {
    try {
      final ArrayList<SNumber> sNumbers = CollectionLiterals.<SNumber>newArrayList();
      final BufferedReader br = Utils.getInputReader(18);
      while (br.ready()) {
        {
          sNumbers.add(SNumber.createSNumber(br, null));
          br.read();
        }
      }
      br.close();
      final Function2<SNumber, SNumber, SNumber> _function = new Function2<SNumber, SNumber, SNumber>() {
        public SNumber apply(final SNumber s1, final SNumber s2) {
          return new Pair(s1, s2, null).reduce();
        }
      };
      InputOutput.<Integer>println(Integer.valueOf(IterableExtensions.<SNumber>reduce(sNumbers, _function).magnitude()));
      int max_magnitude = 0;
      int _size = sNumbers.size();
      ExclusiveRange _doubleDotLessThan = new ExclusiveRange(0, _size, true);
      for (final Integer i : _doubleDotLessThan) {
        int _size_1 = sNumbers.size();
        ExclusiveRange _doubleDotLessThan_1 = new ExclusiveRange(0, _size_1, true);
        for (final Integer j : _doubleDotLessThan_1) {
          boolean _notEquals = (!Objects.equal(i, j));
          if (_notEquals) {
            List<String> input = Utils.getInputs(18);
            String _get = input.get((i).intValue());
            StringReader _stringReader = new StringReader(_get);
            BufferedReader _bufferedReader = new BufferedReader(_stringReader);
            SNumber _createSNumber = SNumber.createSNumber(_bufferedReader, null);
            String _get_1 = input.get((j).intValue());
            StringReader _stringReader_1 = new StringReader(_get_1);
            BufferedReader _bufferedReader_1 = new BufferedReader(_stringReader_1);
            SNumber _createSNumber_1 = SNumber.createSNumber(_bufferedReader_1, null);
            max_magnitude = Math.max(max_magnitude, 
              new Pair(_createSNumber, _createSNumber_1, 
                null).reduce().magnitude());
            br.close();
          }
        }
      }
      InputOutput.<Integer>println(Integer.valueOf(max_magnitude));
    } catch (Throwable _e) {
      throw Exceptions.sneakyThrow(_e);
    }
  }
}

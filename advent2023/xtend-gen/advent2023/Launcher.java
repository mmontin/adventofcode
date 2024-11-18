package advent2023;

import java.lang.reflect.Method;
import java.util.Collections;
import java.util.Objects;
import java.util.function.Consumer;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IntegerRange;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class Launcher {
  public static void main(final String[] args) {
    final long initial = System.currentTimeMillis();
    final Function1<Integer, Class<?>> _function = (Integer it) -> {
      try {
        return Class.forName(("advent2023.Day" + it));
      } catch (Throwable _e) {
        throw Exceptions.sneakyThrow(_e);
      }
    };
    final Consumer<Class<?>> _function_1 = (Class<?> it) -> {
      try {
        final Function1<Method, Boolean> _function_2 = (Method it_1) -> {
          String _name = it_1.getName();
          return Boolean.valueOf(Objects.equals(_name, "main"));
        };
        final Method meth = IterableExtensions.<Method>findFirst(((Iterable<Method>)Conversions.doWrapArray(it.getMethods())), _function_2);
        InputOutput.<String>println("---------------------------");
        String _get = it.getName().split("Day")[1];
        String _plus = ("Day " + _get);
        InputOutput.<String>println(_plus);
        final long ts = System.currentTimeMillis();
        final Object[] args1 = { ((String[]) ((String[])Conversions.unwrapArray(Collections.<Object>unmodifiableList(CollectionLiterals.<Object>newArrayList()), String.class))) };
        meth.invoke(null, args1);
        long _currentTimeMillis = System.currentTimeMillis();
        long _minus = (_currentTimeMillis - ts);
        String _plus_1 = ("Computed in " + Long.valueOf(_minus));
        String _plus_2 = (_plus_1 + "ms");
        InputOutput.<String>println(_plus_2);
      } catch (Throwable _e) {
        throw Exceptions.sneakyThrow(_e);
      }
    };
    IterableExtensions.<Integer, Class<?>>map(new IntegerRange(1, 25), _function).forEach(_function_1);
    long _currentTimeMillis = System.currentTimeMillis();
    final long duration = (_currentTimeMillis - initial);
    InputOutput.<String>println("---------------------------------");
    InputOutput.<String>println("Total computation time for 2023: ");
    InputOutput.<String>println((((("-- " + Long.valueOf((duration / 1000))) + " seconds and ") + Long.valueOf((duration % 1000))) + " ms       --"));
    InputOutput.<String>println("---------------------------------");
  }
}

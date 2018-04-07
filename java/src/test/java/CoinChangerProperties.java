import com.pholser.junit.quickcheck.Property;
import com.pholser.junit.quickcheck.generator.InRange;
import com.pholser.junit.quickcheck.runner.JUnitQuickcheck;
import org.junit.runner.RunWith;

import static org.assertj.core.api.Assertions.assertThat;

@RunWith(JUnitQuickcheck.class)
public class CoinChangerProperties {

    @Property
    public void should_do_some_magic(@InRange(minInt = 11, maxInt = 20) int value) {
        assertThat(value).isLessThan(10);
    }
}
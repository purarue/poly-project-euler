import java.math.BigInteger

val all: MutableSet<BigInteger> = HashSet<BigInteger>()

for (i in 2..100) {
    for (j in 2..100) {
        all.add(i.toBigInteger().pow(j))
    }
}

println(all.count())

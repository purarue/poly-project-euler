import java.util.ArrayList;
import java.util.Collections;

public class Main {

	public static boolean isPalindrome(Integer i) {
		String original = String.valueOf(i);
		String reversed = new StringBuffer(original).reverse().toString();
		return original.equals(reversed);
	}

	public static void main(String args[]) {
		ArrayList<Integer> palindromes = new ArrayList<Integer>();
		int k;
		for (int i = 100; i < 999; i++) {
			for (int j = 100; j < 999; j++) {
				k = i * j;
				if (Main.isPalindrome(k)) {
					palindromes.add(k);
				}
			}
		}
		System.out.println(Collections.max(palindromes).toString());
	}
}

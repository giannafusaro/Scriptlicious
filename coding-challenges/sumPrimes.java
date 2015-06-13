import java.lang.*;
import java.util.ArrayList;

// Write a program to find the sum of the first 1000 prime numbers.
public class sumPrimes {
  ArrayList<Integer> prime_sums = new ArrayList<Integer>();
  int max_known_sum;

  public static void main (String args[]) {
    // test isPrime
    System.out.printf("is 9 prime? %s\n", isPrime(9));
    System.out.printf("is 2 prime? %s\n", isPrime(2));
    System.out.printf("is 11 prime? %s\n", isPrime(11));
    System.out.printf("is 27 prime? %s\n", isPrime(27));
    System.out.printf("is 8 prime? %s\n", isPrime(8));
    System.out.printf("is 101 prime? %s\n", isPrime(101));
    System.out.printf("is 100 prime? %s\n", isPrime(100));

    System.out.printf("sumPrime(100): %d\n", sumPrimes(100,0));
    System.out.printf("sumPrime(5) %d\n", sumPrimes(5,0));
    System.out.printf("sumPrime(29) %d\n", sumPrimes(29,0));
    System.out.printf("sumPrime(29) %d\n", sumPrimes(1000,0));

  }

  public static int sumPrimes(int n, int sum) {
    if (n<2) {
      return sum;
    }
    else {
      if (isPrime(n)) {
        sum+=n;
      }
      return sumPrimes((n-1), sum );
    }
  }
  public static boolean isPrime(int n) {
    if (n==1) { return false; }
    for(int i=2; i<n; i++) {
      if(n%i == 0) {
        return false;
      }
    }
    return true;
  }
  }

import java.util.Scanner;

public class 백준_1463 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        int n = scanner.nextInt();
        result = new int[n+1];

        System.out.println(makeOne(n));

    }

    public static int makeOne(int n) {
        if (n == 1) { return 0; }
        if (n>0) { return result[n]; }

        result[n] = makeOne(n-1) + 1;

        if (n % 3 == 0) {
            int i = makeOne(n%3)+1;
            if (result[n % 3] > i) {
                result[n % 3] = i;
            }
        }

        if (n % 2 == 0) {
            int i = makeOne(n%2) + 1;
            if (result[n % 2 ] > i) {
                result[n%2] = i;
            }
        }

        return result[n];
    }

    public static int[] result;

}

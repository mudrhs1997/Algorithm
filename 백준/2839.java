import java.util.Scanner;

public class 백준_2839 {

    static int[] result;

    static int d(int n) {
        if (n == 3) { return result[n]+1; }
        if (n == 5) { return result[n]+1; }
        if (n == 6) { return result[n]+2; }
        if (n == 7 || n == 4) { return result[n]=-1; }
        if (result[n] > 0) {
            return result[n];
        }
        if (n > 7) {

            if (n % 5 == 0) {
                result[n] = d(n - 5) + 1;
            } else if (n % 5 == 3) {
                result[n] = d(n - 3) + 1;
            } else if (n % 3 == 0) {
                result[n] = d(n - 3) + 1;
            } else if (n % 3 == 2) {
                result[n] = d(n - 5) + 1;
            } else if (n % 3 == 1) {
                result[n] = d(n - 5) + 1;
            }else {
                result[n] = -1;
            }
        }

        return result[n];
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        int n = scanner.nextInt();
        result = new int[n + 1];

        System.out.println(d(n));
    }
}

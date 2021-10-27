import java.util.ArrayList;
import java.util.Scanner;

public class 백준_1934 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        int n = scanner.nextInt();

        int[] a = new int[n];
        int[] b = new int[n];
        int[] c = new int[n];


        for (int i = 0; i < n; i++) {
            a[i] = scanner.nextInt();
            b[i] = scanner.nextInt();
            c[i] = 1;
            int min = (a[i]<=b[i]) ? a[i] : b[i];
            for (int j = 2; j <= min; j++) {
                if (a[i] % j == 0 && b[i] % j == 0) {
                    c[i] = j;
                }
            }
            System.out.println(a[i]/c[i]*b[i]);
        }

    }
}

import java.util.Scanner;

public class 백준_11726 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        int n = scanner.nextInt();
        Long[] a = new Long[n+1];

        for (int i = 1; i <= n; i++) {
            if (i == 1) { a[i] = 1L; }
            if (i == 2) { a[i] = 2L; }
            if (i > 2) {
                a[i] = (a[i-1] + a[i-2])%10007;
            }
        }

        System.out.println(a[n]);

    }
}

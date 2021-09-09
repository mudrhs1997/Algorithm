import java.util.Scanner;

public class 백준_2609 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        int a = scanner.nextInt();
        int b = scanner.nextInt();

        int min = 0;

        if (a <= b) {
            min = a;
        } else {
            min = b;
        }

        int max = 1;

        for (int i = 2; i <= min; i++) {
            if (a % i == 0 && b % i == 0) {
                max = i;
            }
        }

        System.out.println(max);
        System.out.println(b/max*a);
    }
}

import java.util.Scanner;

public class 백준_2798 {
    /**
     * 블랙잭
     */
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        int n = scanner.nextInt();
        int m = scanner.nextInt();
        int[] card = new int[101];
        int sum = 0;
        int max = 0;

        for (int i = 0; i < n; i++) {
            card[i] = scanner.nextInt();
        }

        for (int i = 0; i < n - 2; i++) {
            for (int j = i+1; j < n - 1; j++) {
                for (int k = j+1; k < n; k++) {
                    sum = card[i] + card[j] + card[k];
                    if (sum >= max && sum <= m) {
                        max = sum;
                    }
                }
            }
        }

        System.out.println(max);
    }
}

import java.util.Scanner;

public class GCD합_9613 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        int n = scanner.nextInt();
        int[][] arr = new int[100][];
        Long sum = 0L;
        int result = 0;
        int go = 0;

        for (int i = 0; i < n; i++) {
            int m = scanner.nextInt();
            arr[i] = new int[m];
            for (int j = 0; j < m; j++) {
                arr[i][j] = scanner.nextInt();
            }
        }

        for (int k = 0; k < n; k++) {
            for (int i = 0; i < arr[k].length ; i++) {
                for (int j = i + 1; j < arr[k].length ; j++) {
                    if (arr[k][i] >= arr[k][j]) {
                        result = GCD(arr[k][i], arr[k][j]);
                    } else{
                        result = GCD(arr[k][j], arr[k][i]);
                    }
                    sum +=result;
                    result = 0;
                }
            }
            System.out.println(sum);
            sum = 0L;
        }
    }


    static int GCD(int a, int b) {
        if (b == 0) {
            return a;
        } else {
            return GCD(b, a%b);
        }
    }
}

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Arrays;

// Long 비교는 .equals()로...
public class 카드_11652 {
    public static void main(String[] args) throws IOException {
        BufferedReader bf = new BufferedReader(new InputStreamReader(System.in));

        int N = Integer.parseInt(bf.readLine());
        Long[] arr = new Long[N];

        for (int i = 0; i < N; i++) {
            arr[i] = Long.parseLong(bf.readLine());
        }

        Arrays.sort(arr);

        int max = 0;
        int sum = 1;
        Long p = 0L;


        if (arr.length > 1) {
            for (int i = 0; i < N - 1; i++) {
                if (arr[i].equals(arr[i + 1])) {
                    sum++;
                    if (max < sum) {
                        max = sum;
                        p = arr[i];
                    }
                } else{
                    if (max < sum) {
                        max = sum;
                        p = arr[i];
                    }
                    sum = 1;
                }
            }
        } else {
            p = arr[0];
        }

        System.out.println(p);
    }
}

import java.util.Scanner;
import java.util.Stack;

public class 진법변환2_11005 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        int n = scanner.nextInt();
        int b = scanner.nextInt();
        Stack arr = new Stack();

        while (n > 0) {
            arr.add(n % b);
            n /= b;
        }

        int size = arr.size();

        for (int i = 0; i < size; i++) {
            int pop = (int)arr.pop();
            if (pop >= 10) {
                char result = (char) (pop + 55);
                System.out.print(result);
            } else {
                System.out.print(pop);
            }

        }
    }
}

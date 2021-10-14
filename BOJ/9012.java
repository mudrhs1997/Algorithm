import java.util.Scanner;
import java.util.Stack;

public class 백준_9012 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        int n = Integer.parseInt(scanner.nextLine());

        for (int i = 0; i < n; i++) {

            String s = scanner.nextLine();

            Stack stack = new Stack();

            String[] string = s.split("");

            int yes = 1;

                for (int j = 0; j < string.length; j++) {
                    stack.push(string[j]);
                }

                if((string.length % 2 == 0) && stack.pop().equals(")")) {

                    int size = stack.size();

                    for (int k = 0; k < size - 1; k++) {
                        Object pop = stack.pop();
                        if (pop.equals("(")) {
                            yes -= 1;
                        } else {
                            yes += 1;
                        }

                        if (yes == -1) {
                            break;
                        }
                    }

                    yes += 100;

                }
            if ((yes == 101) && stack.pop().equals("(")) {
                System.out.println("YES");

            } else {
                System.out.println("NO");
            }

        }
    }
}

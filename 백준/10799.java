import java.util.Scanner;
import java.util.Stack;

public class 백준_10799 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        String bracket = scanner.nextLine();

        String[] s = bracket.split("");
        Stack stack = new Stack();
        int length = s.length;
        int line = 0;
        int piece = 0;

        for (int k = 0; k < length; k++) {
            stack.push(s[k]);
        }

        for (int i = 0; i < length-1; i++) {
            Object pop = stack.pop();

            if (pop.equals(")") && stack.peek().equals(")")) {
                line++;
                piece++;
            }

            if (pop.equals(")") && stack.peek().equals("(")) {
                piece += line;
            }

            if (pop.equals("(") && stack.peek().equals("(")) {
                line--;
            }


        }

        System.out.println(piece);

    }
}

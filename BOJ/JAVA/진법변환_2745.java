import java.util.LinkedList;
import java.util.Scanner;
import java.util.Stack;

public class 진법변환_2745 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        String n = scanner.next();
        int b = scanner.nextInt();
        Stack arr = new Stack();
        int result = 0;

        int size = n.length();

        for (int i = 0; i < size; i++) {
            if ('A' <= n.charAt(i) && n.charAt(i) <= 'Z') {
                arr.add(n.charAt(i)-55);
            } else {
                arr.add(n.charAt(i)-48);
            }
        }

        for (int i = 0; i < size; i++) {
            result += (int)arr.pop() * Math.pow(b,i);
        }

        System.out.println(result);
    }
}

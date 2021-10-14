import java.util.Scanner;
import java.util.TreeSet;

public class 백준_11656 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        TreeSet<String> ts = new TreeSet<>();

        String str = scanner.nextLine();

        for (int i = 0; i < str.length(); i++) {
            ts.add(str.substring(i,str.length()));
        }

        for (int i = 0; i < str.length(); i++) {
            System.out.println(ts.pollFirst());
        }
    }
}

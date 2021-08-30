import java.util.Scanner;

public class 백준_10824 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        String[] s = new String[4];

        for (int i = 0; i < 4; i++) {
            s[i] = scanner.next();
        }

        System.out.println(Long.parseLong(s[0]+s[1])+Long.parseLong(s[2]+s[3]));

    }
}

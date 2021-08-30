import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import java.util.StringTokenizer;

public class 백준_10820 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        int n = 100;

        while (scanner.hasNext()) {
            String text = scanner.nextLine();
            int small = 0;
            int big = 0;
            int num = 0;
            int empty = 0;

            for (int j = 0; j < text.length(); j++) {
                if ('a' <= text.charAt(j) && text.charAt(j) <= 'z') {
                    small++;
                } else if ('A' <= text.charAt(j) && text.charAt(j) <= 'Z') {
                    big++;
                } else if ('0' <= text.charAt(j) && text.charAt(j) <= '9') {
                    num++;
                } else if (text.charAt(j) == ' ') {
                    empty++;
                }
            }

            System.out.println(small + " " + big + " " + num + " " + empty);

        }

        }

    }

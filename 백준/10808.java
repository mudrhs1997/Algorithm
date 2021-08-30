import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Scanner;

public class 백준_10808 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);


        String s = scanner.nextLine();

        List list = Arrays.asList(s.split(""));

        int[] alpa = new int[26];
        Arrays.fill(alpa, 0);

        for (int i = 0; i < s.length(); i++) {
            String ch = (String)list.get(i);
            int index = ch.charAt(0) - 'a';
            alpa[index]++;
        }

        for (int i = 0; i < alpa.length; i++) {
            System.out.print(alpa[i] + " ");
        }
    }
}

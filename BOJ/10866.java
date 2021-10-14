import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Deque;
import java.util.LinkedList;
import java.util.Scanner;
import java.util.StringTokenizer;

public class 백준_10866 {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        int n = Integer.parseInt(br.readLine());
        Deque deque = new LinkedList();

        for (int i = 1; i <= n; i++) {

            StringTokenizer st = new StringTokenizer(br.readLine());
            String p = st.nextToken();

            if (p.equals("push_front")) {
                deque.addFirst(st.nextToken());
            } else if (p.equals("push_back")) {
                deque.addLast(st.nextToken());
            } else if (p.equals("front")) {
                if (!deque.isEmpty()) {
                    Object first = deque.peekFirst();
                    System.out.println(first);
                } else {
                    System.out.println("-1");
                }
            } else if (p.equals("back")) {
                if (!deque.isEmpty()) {
                    Object last = deque.peekLast();
                    System.out.println(last);
                } else {
                    System.out.println("-1");
                }
            } else if (p.equals("size")) {
                System.out.println( deque.size() );
            } else if (p.equals("empty")) {
                if (deque.size() == 0) {
                    System.out.println("1");
                } else {
                    System.out.println("0");
                }
            } else if (p.equals("pop_front")) {
                if (!deque.isEmpty()) {
                    Object first = deque.pollFirst();
                    System.out.println(first);
                } else {
                    System.out.println("-1");
                }
            } else if (p.equals("pop_back")) {
                if (!deque.isEmpty()) {
                    Object last = deque.pollLast();
                    System.out.println(last);
                } else {
                    System.out.println("-1");
                }

            }

        }


    }
}

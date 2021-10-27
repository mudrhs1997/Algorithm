import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.LinkedList;
import java.util.Queue;
import java.util.StringTokenizer;

public class 백준_10845 {
    public static void main(String[] args) throws IOException {
        BufferedReader bf = new BufferedReader(new InputStreamReader(System.in));

        int n = Integer.parseInt(bf.readLine());

        Queue<String> queue = new LinkedList<>();
        int size = 0;
        String last = "";

        for (int i = 1; i <= n; i++) {

            StringTokenizer st = new StringTokenizer(bf.readLine());
            String p = st.nextToken();

            if (p.equals("push")) {
                String num = st.nextToken();
                queue.add(num);
                last = num;
                size++;
            } else if (p.equals("pop")) {
                Object pop = queue.poll();
                if (pop==null) {
                    System.out.println("-1");
                } else {
                    System.out.println(pop);
                    size--;
                    if (size == 0) {
                        last = "";
                    }
                }
            } else if (p.equals("size")) {
                System.out.println(size);
            } else if (p.equals("empty")) {
                if (size == 0) {
                    System.out.println("1");
                } else {
                    System.out.println("0");
            }
            } else if (p.equals("front")) {
                Object peek = queue.peek();
                if (peek==null) {
                    System.out.println("-1");
                } else {
                    System.out.println(peek);
                }
            } else if (p.equals("back")) {
                if (last.equals("")) {
                    System.out.println("-1");
                } else {
                    System.out.println(last);
                }
            }
            }
    }
}

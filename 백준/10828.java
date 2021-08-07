import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Stack;
import java.util.StringTokenizer;

public class 백준_10828 {
    public static void main(String args[]) throws IOException {
        BufferedReader bf = new BufferedReader(new InputStreamReader(System.in));

        int n = Integer.parseInt(bf.readLine());

        Stack<String> stack = new Stack<String>();


        for (int i = 0; i < n; i++) {

            StringTokenizer st = new StringTokenizer(bf.readLine());
            String p = st.nextToken();

            // push
            if (p.equals("push")) {

                String num = st.nextToken();

                stack.push(num);
            } else if (p.equals("pop")) {

                if (!stack.isEmpty()) {
                    String pop = stack.pop();
                    System.out.println(pop);
                } else {
                    System.out.println("-1");
                }
            } else if (p.equals("size")) {
                int size = stack.size();
                System.out.println(size);
            } else if (p.equals("empty")) {
                if (stack.isEmpty()) {
                    System.out.println("1");
                } else {
                    System.out.println("0");
                }
            } else if (p.equals("top")) {
                if (stack.isEmpty()) {
                    System.out.println("-1");
                } else {
                    String peek = stack.peek();
                    System.out.println(peek);
                }


            }
        }
    }

}

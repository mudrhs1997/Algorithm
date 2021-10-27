import java.util.*;

public class 백준_1158 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        int n = scanner.nextInt();
        int k = scanner.nextInt();
        Queue<Integer> queue = new LinkedList<Integer>();
        List list = new ArrayList();

        for (int i = 1; i <= n; i++) {
            queue.add(i);
        }

        while (!queue.isEmpty()) {

            for (int i = 1; i < k; i++) {

                Integer poll = queue.poll();
                queue.add(poll);
            }

            Integer pollFinal = queue.poll();
            list.add(pollFinal);

        }

        System.out.print("<");

        for (int i = 0; i < list.size(); i++) {

            if (i == list.size()-1) {
                System.out.print(list.get(i));
            } else {
                System.out.print(list.get(i) + ", ");
            }
        }

        System.out.println(">");
    }
}

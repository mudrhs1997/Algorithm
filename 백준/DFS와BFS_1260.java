import java.util.LinkedList;
import java.util.Queue;
import java.util.Scanner;

public class DFS와BFS_1260 {
    static int edge;    // 간선의 수
    static int vertex;  // 정점의 수
    static int[][] map; // 연결정보
    static boolean[] visit; // 방문여부 체크
    static boolean[] visit_bfs; // 방문여부 체크

    static Queue<Integer> visited;

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        vertex = scanner.nextInt();
        edge = scanner.nextInt();
        int start = scanner.nextInt();
        map = new int[vertex + 1][vertex + 1];
        visit = new boolean[vertex + 1];
        visit_bfs = new boolean[vertex + 1];
        visited = new LinkedList<>();

        for (int i = 0; i < edge; i++) {
            int n = scanner.nextInt();
            int m = scanner.nextInt();
            map[n][m] = 1;
            map[m][n] = 1;
        }

        dfs(start);
        System.out.println("");

        bfs(start);

    }
    static void dfs(int start) {
        visit[start] = true;
        System.out.print(start + " ");

        for (int i = 1; i <= vertex; i++) {
            if (map[start][i] == 1 && visit[i] == false) {
                dfs(i);
            }
        }
    }
    static void bfs(int start) {
        visit_bfs[start] = true;
        System.out.print(start + " ");

        for (int i = 1; i <= vertex; i++) {
            if (map[start][i] == 1 && visit_bfs[i] == false) {
                visit_bfs[i] = true;
                visited.add(i);
            }
        }

        if (!visited.isEmpty()) {
            Integer poll1 = visited.poll();
            bfs(poll1);
        }

    }
}

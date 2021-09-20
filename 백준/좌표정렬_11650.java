import java.io.*;
import java.util.*;

// comparable 사용

public class 좌표정렬_11650 {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        int n = Integer.parseInt(br.readLine());

        Point[] arr = new Point[n];

        for (int i = 0; i < n; i++) {
            String s = br.readLine();
            StringTokenizer st = new StringTokenizer(s);
            arr[i] = new Point(Integer.parseInt(st.nextToken()), Integer.parseInt(st.nextToken()));
        }

        Arrays.sort(arr);

        for (Point point : arr) {
            System.out.println(point);
        }
    }
}
class Point implements Comparable<Point> {

    int x;
    int y;

    public Point(int x, int y) {
        this.x = x;
        this.y = y;
    }

    @Override
    public int compareTo(Point p) {

        if (this.x == p.x) {
            return this.y - p.y;
        }

        return this.x - p.x;
    }

    @Override
    public String toString() {
        return "" + x + " " + y + "";
    }
}


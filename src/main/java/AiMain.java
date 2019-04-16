import java.util.Scanner;

public class AiMain {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String str;
        while (true){
            str = scanner.next();
            str.replace("吗","");
            str.replace("？","！");
            str.replace("?","!");
            System.out.println(str);
        }
    }
}

import java.io.*;
import java.net.*;

public class Client {
	public static void main(String[] args) throws Exception {
		Socket socket = new Socket("127.0.0.1", 7399);
		PrintWriter out = new PrintWriter(socket.getOutputStream(), true);
		BufferedReader in = new BufferedReader(new InputStreamReader(socket.getInputStream()));

		out.println("4");  // protocol version
		out.println("en");
		out.println("Hello");
		out.println("World");
		out.println("ENDOFSTREAM");
		System.out.println(in.readLine());
		System.out.println();

		for (String a : args) out.println(a);
		while (true) System.out.print((char)in.read());
	}
}

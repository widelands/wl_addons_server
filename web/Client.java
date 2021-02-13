import java.io.*;
import java.net.*;

public class Client {
	public static void main(String[] args) throws Exception {
		Socket socket = new Socket("127.0.0.1", 7399);
		PrintWriter out = new PrintWriter(socket.getOutputStream(), true);
		BufferedReader in = new BufferedReader(new InputStreamReader(socket.getInputStream()));
		BufferedReader stdIn = new BufferedReader(new InputStreamReader(System.in));

		System.out.print("\n>>> ");
		String text = stdIn.readLine();
		if (text == null) return;
		System.out.println("Sending:        " + text);
		out.println(text);
		System.out.println("Received reply:");
		while (true) System.out.print((char)in.read());
	}
}

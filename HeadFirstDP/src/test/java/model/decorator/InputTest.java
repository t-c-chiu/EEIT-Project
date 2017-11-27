package model.decorator;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

public class InputTest {

	public static void main(String[] args) {
		int c;
		try {
			InputStream in = new LowerCaseInputStream(
					new BufferedInputStream(new FileInputStream("C:\\Users\\Student\\Desktop\\test.txt")));

			while ((c = in.read()) != -1) {
				System.out.print((char) c);
			}
			in.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}

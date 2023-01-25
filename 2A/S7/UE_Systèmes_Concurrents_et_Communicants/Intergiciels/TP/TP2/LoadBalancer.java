import java.util.Random;
import java.net.*;
import java.io.*;

public class LoadBalancer extends Thread {
  static String hosts[] = {"host1", "host2"};
  static int ports[] = {8081, 8082};
  static int nbHosts = 2;
  static Random rand = new Random();
  static String document[] = new String[nbHosts];
  Socket input;

  public LoadBalancer (Socket i) {
    this.input = i;
  }

  public void run() {
    try {
      int i = rand.nextInt(nbHosts);
      Socket output = new Socket("localhost", ports[i]);
      OutputStream input_output_stream = input.getOutputStream();
      InputStream input_input_stream = input.getInputStream();
      OutputStream output_output_stream = output.getOutputStream();
      InputStream output_input_stream = output.getInputStream();

      byte[] buffer = new byte[1024];
      int bytesRead = input_input_stream.read(buffer);
      output_output_stream.write(buffer, 0, bytesRead);
      bytesRead = output_input_stream.read(buffer);
      String s = new String(buffer, 0, bytesRead);
      System.out.println("["+s+"]");
      input_output_stream.write(buffer, 0, bytesRead);
      input_output_stream.close();
      input_input_stream.close();
      output_output_stream.close();
      output_input_stream.close();
      output.close();
      input.close();
  


    } catch (Exception e) {
      e.printStackTrace();
    }
  }
  public static void main (String[] args) {
    try {
      ServerSocket ss = new ServerSocket(8080);
      while (true) {
        Thread t = new LoadBalancer(ss.accept());
        t.start();
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
}

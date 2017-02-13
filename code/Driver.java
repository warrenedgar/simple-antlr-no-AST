package src.demo.noast;

import java.util.Scanner;
import java.util.LinkedList;

import org.antlr.v4.runtime.*;

/**
 *
 */
public class Driver{

  public Driver(){

    Scanner scanner = new Scanner(System.in);
    StringBuilder sb = new StringBuilder();

    while (scanner.hasNextLine()) {
      String str = scanner.nextLine();
      if (str.length() > 0) {
        sb.append(str).append('\n');
      }
    }

    LoremIpsumLexer lexer = new LoremIpsumLexer(new ANTLRInputStream(sb.toString()));
    CommonTokenStream tokens = new CommonTokenStream(lexer);
    LoremIpsumParser parser = new LoremIpsumParser(tokens);
    parser.prog();
    LinkedList<Paragraph> lipsum = parser.getParagraphs();

  
    lipsum.forEach(Paragraph::printE);
  }



  public static void main(String[] args){
    new Driver();
  }
}

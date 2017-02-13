package src.demo.noast;

import java.util.LinkedList;

/**
 *Class represents a paragraph.
 */
public class Paragraph{

    LinkedList<Sentence> sentences = null;
    
    public Paragraph(LinkedList<Sentence> sentences){
        this.sentences = sentences;
    }

   // print out a paragraph to system err
   public void printE(){
      
      String prefix = "";
      for(Sentence s: sentences){
          for(String str: s.words){
            System.err.print(prefix);
            prefix = " ";
            System.err.print(str);
          }
            System.err.print(".");
      }
      System.err.println("");
      System.err.println("");
   }
}


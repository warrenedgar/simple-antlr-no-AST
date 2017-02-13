grammar LoremIpsum;

@header{
  package src.demo.noast;
  import java.util.List;
  import java.util.LinkedList;
}

@parser::members{
   // any containers and methods to get them
   private LinkedList<Paragraph> paragraphs = new LinkedList<>();
   public LinkedList<Paragraph> getParagraphs(){
     return paragraphs;
   }  
}

// starter rule
prog
  : paragraphList EOF?
  ;

paragraphList
  : sl=sentenceList NEWLINE+ paragraphList
    {paragraphs.addFirst(new Paragraph($sl.lval));}
  | sl=sentenceList
    {paragraphs.addFirst(new Paragraph($sl.lval));}
  | 
    // null production
  ;

sentenceList
  returns [LinkedList<Sentence> lval]
  : s=sentence (SPACE+)? sl=sentenceList
    {$sl.lval.addFirst($s.lval); $lval = $sl.lval;}
  | s=sentence
    {$lval = new LinkedList<Sentence>(); $lval.add($s.lval);}
  ;

sentence
  returns[ Sentence lval]
  : wl=wordList PERIOD
    { $lval = new Sentence($wl.lval);}
  ;

wordList
  returns [LinkedList<String> lval]
  : w=word (SPACE+)? wl=wordList
    {$wl.lval.addFirst($w.lval); $lval = $wl.lval;}
  | w=word
    {$lval = new LinkedList<String>(); $lval.add($w.lval);}
  ;

word
 returns[ String lval]
 : STRING
  {$lval = new String($STRING.text);}
 | COMMA
  {$lval = new String(",");}
 ;

WS
   : [\r\t] + -> channel (HIDDEN)
   ;

STRING : [A-Za-z]+;
COMMA : ',';
PERIOD : '.';
NEWLINE : '\n';
SPACE : ' ';

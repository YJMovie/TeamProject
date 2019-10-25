package movie.dto;

import java.sql.Date;

public class RankDTO {
   private String title;
   private double score;
   private Date open;
   private String grname;
   private String psname;
   private String postfname;
   
   public String getTitle() {
      return title;
   }
   public void setTitle(String title) {
      this.title = title;
   }
   public double getScore() {
      return score;
   }
   public void setScore(double score) {
      this.score = score;
   }
   public Date getOpen() {
      return open;
   }
   public void setOpen(Date open) {
      this.open = open;
   }
   public String getgrname() {
      return grname;
   }
   public void setgrname(String grname) {
      this.grname = grname;
   }
   public String getpsname() {
      return psname;
   }
   public void setpsname(String psname) {
      this.psname = psname;
   }
   public String getPostfname() {
      return postfname;
   }
   public void setPostfname(String postfname) {
      this.postfname = postfname;
   }
   @Override
   public String toString() {
      return "RankDTO [title=" + title + ", score=" + score + ", open=" + open + ", grname=" + grname
            + ", psname=" + psname + ", postfname=" + postfname + "]";
   }

   
   
   
}
package com.scit.doujo.vo;

public class board {
     String id;
     String title;
     String content;
     String location;
     String originalfile;
     String savedfile;
     
     public board() {
        
     }

   public board(String id, String title, String content, String location, String originalfile, String savedfile) {
      super();
      this.id = id;
      this.title = title;
      this.content = content;
      this.location = location;
      this.originalfile = originalfile;
      this.savedfile = savedfile;
   }

   public String getId() {
      return id;
   }

   public void setId(String id) {
      this.id = id;
   }

   public String getTitle() {
      return title;
   }

   public void setTitle(String title) {
      this.title = title;
   }

   public String getContent() {
      return content;
   }

   public void setContent(String content) {
      this.content = content;
   }

   public String getLocation() {
      return location;
   }

   public void setLocation(String location) {
      this.location = location;
   }

   public String getOriginalfile() {
      return originalfile;
   }

   public void setOriginalfile(String originalfile) {
      this.originalfile = originalfile;
   }

   public String getSavedfile() {
      return savedfile;
   }

   public void setSavedfile(String savedfile) {
      this.savedfile = savedfile;
   }

   @Override
   public String toString() {
      return "board [id=" + id + ", title=" + title + ", content=" + content + ", location=" + location
            + ", originalfile=" + originalfile + ", savedfile=" + savedfile + "]";
   }
     
     
     
}
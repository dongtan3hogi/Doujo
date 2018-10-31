package com.scit.doujo.util;

import java.io.File;
import java.util.Date;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

/**
 * 파일 관련 유틸
 * 업로드한 파일의 저장 & 서버에 저장된 파일 삭제 등의 기능 제공
 */
public class FileService {

   /**
    * 업로드 된 파일을 지정된 경로에 저장하고, 저장된 파일명을 리턴
    * @param mfile 업로드된 파일
    * @param path 저장할 경로
    * @return 저장된 파일명
    */
   public static String saveFile(MultipartFile upload, String uploadPath) {
      //保存フォルダがなければ生成
      File path = new File(uploadPath);
      if (!path.isDirectory()) {
         path.mkdirs();
      }

    
      String originalFilename = upload.getOriginalFilename();
      if (originalFilename.trim().length() == 0) {
         return "";
      }
      
      //저장할 파일명 뒤에 을 오늘 날짜의 년월일로 생성
      //SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
      // 日付やランダム値をつけて保存するファイル名を作成する。 ランダムデータサイズは36
       String sdf = UUID.randomUUID().toString();
      
      //原型ファイルの拡張子とファイル名分離
      String filename;      // 拡張子を外したファイル名
      String ext;            // 拡張子
      String savedFilename;   // ディスク名
      
      int lastIndex = originalFilename.lastIndexOf('.');
      
      
     
      if (lastIndex == -1) {
         ext = "";
         filename = originalFilename;
      }
      
      
      else {
         ext = "." + originalFilename.substring(lastIndex + 1);
         filename = originalFilename.substring(0, lastIndex);
      }
      
      // DBに保存されるファイル名
      savedFilename = filename+"_"+sdf + ext;
      File serverFile = null;
    //HDDに保存するファイル名。 同じ名前のファイルがある場合の処理
      while (true) {
         serverFile = new File(uploadPath + "/" + savedFilename);
         //同じ名前のファイルがなければbreak
         if ( !serverFile.isFile()) break;   
         //同じ名前のファイルがあれば名前の後ろにlong タイプの時間情報を付け足す。
         savedFilename = savedFilename + new Date().getTime();
      }      
      
      try {
         upload.transferTo(serverFile);  // 指定された名前の指定位置にファイル保存 
      } catch (Exception e) {
         savedFilename = null;
         e.printStackTrace();
      }
      
      return savedFilename;
   }
   
   /**
    * サーバに保存されたファイルの全経路を受信し,該当ファイルを削除
    * @param fullpath 삭제할 파일의 경로
    * @return 삭제 여부
    */
   public static boolean deleteFile(String fullpath) {
      
      boolean result = false;
      
      File delFile = new File(fullpath);
      
      if (delFile.isFile()) {
         delFile.delete();
         result = true;
      }
      
      return result;
   }
}
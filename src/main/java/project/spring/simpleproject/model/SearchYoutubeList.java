package project.spring.simpleproject.model;

import java.util.List;

import com.google.gson.annotations.SerializedName;

import lombok.Data;

@Data
public class SearchYoutubeList {
	
	   @SerializedName("kind")            private String kind;
	   @SerializedName("etag")            private String etag;
	   @SerializedName("nextPageToken")   private String nextPageToken;
	   @SerializedName("regionCode")      private String regionCode;
	   @SerializedName("items")           private List<Items> items;   
	   
	 
	   @Data
	   public class Items{
	      @SerializedName("kind")      private String kind;    // API 리소스 유형
	      @SerializedName("etag")      private String etag;    // 리소스 유형
	      @SerializedName("id")      private Id id;
	      @SerializedName("snippet")   private Snippet snippet;
	      
	      @Data
	      public class Id{
	         @SerializedName("videoId")   private String videoId;   //비디오 아이디
	         @SerializedName("kind")   private String kind;
	      }
	      
	      @Data    // 유튜브 영상정보
	      public class Snippet{
	    	 @SerializedName("publishedAt")  private String publishedAt;
	         @SerializedName("channelId")   private String channelId;
	         @SerializedName("title")      private String title;
	         @SerializedName("description")   private String description;
	         
	         
	      }
	   } 
	
	
	
}

package com.jungeun.todoservice.dto;

import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.Positive;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
public class PageRequestDTO {
  @Builder.Default
  @Min(value = 1)
  @Positive
  private int page = 1;

  @Builder.Default
  @Min(value = 3)
  @Max(value = 100)
  @Positive
  private int size = 3;

  private String link;

  public int getSkip(){
    return (page - 1) * size;
  }

  public String getLink(){
    if(link == null){
      StringBuilder builder = new StringBuilder();
      builder.append("page=" + this.page);
      builder.append("&size=" + this.size);
      link = builder.toString();
    }
    return link;
  }
}

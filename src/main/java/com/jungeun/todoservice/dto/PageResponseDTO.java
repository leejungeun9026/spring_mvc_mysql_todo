package com.jungeun.todoservice.dto;

import lombok.Builder;
import lombok.Getter;
import lombok.ToString;

import java.util.List;

@Getter
@ToString
public class PageResponseDTO<E> {
  private int page;   // 현재 페이지 번호
  private int size;   // 한 페이지당 표시할 리스트 개수
  private int total;  // 전체 데이터 개수
  private int pageBlockSize; // 한 번에 표시할 페이지 번호 개수

  private int start;  // 페이지 블록 시작
  private int end;    // 페이지 블록 마지막
  private boolean prev; // 이전 블록 유무
  private boolean next; // 다음 블록 유무
  private List<E> dtoList;  // 실제 데이터 목록

  @Builder(builderMethodName = "withAll")
  public PageResponseDTO(PageRequestDTO pageRequestDTO, List<E> dtoList, int total) {
    this.page = pageRequestDTO.getPage();
    this.size = pageRequestDTO.getSize();
    this.total = total;
    this.pageBlockSize = 10;
    this.dtoList = dtoList;
    this.end = (int)(Math.ceil(this.page/(double)this.size))*this.size;
    this.start = this.end-(this.size-1);
//    int last = (int)(Math.ceil(total/(double)this.size));
//    this.end = end > last ? last : end;
//    this.prev = this.start>1;
//    this.next = total>this.end*this.size;

    // 전체 마지막 페이지 (total이 0이면 1페이지로 간주)
    int lastPage = Math.max(1, (int) Math.ceil((double) total / this.size));

    // 현재 블록의 end / start 계산
    this.end = (int) (Math.ceil(this.page / (double) this.pageBlockSize)) * this.pageBlockSize;
    this.start = this.end - (this.pageBlockSize - 1);

    // 보정
    if (this.end > lastPage) this.end = lastPage;
    if (this.start < 1) this.start = 1;

    // 이전/다음 블록 여부
    this.prev = this.start > 1;
    this.next = this.end < lastPage;
  }
}

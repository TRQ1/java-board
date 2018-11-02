package utils;

import vo.PagingVo;

public class PagingUtil {


    /**
     if(request.getParameter("pg")!=null) {//받아온 pg값이 있을때, 다른페이지일때 
     pg = Integer.parseInt(request.getParameter("pg"));// pg값을 저장
     }
     int start = (pg * pageSize) - (pageSize - 1);// 해당페이지에서 시작번호 5 - 4  = 1 //id 값에 대한 시작 번호
     int end = (pg * pageSize);// 해당페이지에서 끝번호 5  // id 값에 대한 끝 번호
     int allPage = 0;// 전체 페이지수 
     int startPage = ((pg - 1) / countPage * countPage) + 1;// 시작블럭숫자 (1~5페이지일경우 1, 6~10일경우 6) 시작페이지를 구하기
     int endPage = ((pg - 1) / countPage * countPage) + countPage;/
     */

    public static PagingVo setPaging(PagingVo pagingVo, int pageNum) {
        int pg = pageNum;
        pagingVo.setStart(pg * pagingVo.getPageSize() - (pagingVo.getPageSize() - 1));
        pagingVo.setEnd(pg * pagingVo.getPageSize());

        pagingVo.setStartPage(((pg - 1) / pagingVo.getPageSize() * pagingVo.getCountPage()) + 1);
        pagingVo.setEndPage(((pg - 1) / pagingVo.getCountPage() * pagingVo.getCountPage()) + pagingVo.getCountPage());

        return pagingVo;
    }
}

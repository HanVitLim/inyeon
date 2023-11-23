function classclick(classname){

    window.location.href = "/sportsclubSelect" + '?club_nm=' + encodeURIComponent(classname);
}

    function selectCity(data){

        var data1 = data.list;
        var paging = data.paging;
        console.log(data1[0]);


        var ctprvn_nm = $('#ctprvn_nm option:selected').val();
        var item_nm = $('#item_nm option:selected').val();

        console.log(ctprvn_nm);
        console.log(item_nm);

        $("#sportsclublist").empty();
        $("#paging").empty();

        $("#sportsclublist").append('<tr class="club_title">' + '<td class="club_title_1">' + '종목명' + '</td>'
            + '<td class="club_title_2">' + '상세종목' + '</td>'
            + '<td class="club_title_2">' + '지역' + '</td>'
            + '<td class="club_title_2">' + '시군구' + '</td>'
            + '<td class="club_title_name">' + '동호회명' + '</td>'
            +'</tr>');
        var selecteddata = '';

        $.each(data1, function (index, lists){

            selecteddata += '<tr>' + '<td class="column1">' + lists.item_nm + '</td>'
                + '<td class="column2">' + lists.subitem_nm + '</td>'
                + '<td class="column2">' + lists.ctprvn_nm + '</td>'
                + '<td class="column2">' + lists.signgu_nm + '</td>'
                + '<td class="clubname" onclick="classclick(\'' + lists.club_nm + '\')">' + lists.club_nm + '</td>'
            +'</tr>'

        });

        $("#sportsclublist").append(selecteddata);

        console.log(paging);

        if (paging.prev) {
            $("#paging").append('<span><a href="this.javascript:void(0)" onclick="ajaxselect(\'' + ctprvn_nm + '\', \'' + item_nm + '\', ' + (parseInt(paging.startPage) - 1) + ')"><img src="img/prev_icon.png" width="15px">이전</a></span>');
        }
        // 페이지 숫자 링크
        for (var num = paging.startPage; num <= paging.endPage; num++) {
            $("#paging").append('<span><a href="javascript:void(0)" onclick="ajaxselect(\'' + ctprvn_nm + '\', \'' + item_nm + '\', ' + num + ')">' + num + '</a></span>');

            num_color(paging.cri.page, num);
        }
        // 다음 페이지 링크
        if (paging.next && paging.endPage > 0) {
            $("#paging").append('<span><a href="javascript:void(0)" onclick="ajaxselect(\'' + ctprvn_nm + '\', \'' + item_nm + '\', ' + (parseInt(paging.endPage) + 1) + ')">다음<img src="img/next_icon.png" width="15px"></a></span>');
        }

    }

    function paging(prev, startPage, endPage, next){
        console.log("start page : " + startPage);
        console.log("end page : " + endPage);
        console.log(prev);
        console.log(next);

        if (prev) {
            $("#paging").append('<span><a href="/sportsclub?page=' + (parseInt(startPage) - 1) + '"><img src="img/prev_icon.png" width="15px">이전</a></span>');
        }
        // 페이지 숫자 링크
        for (var num = startPage; num <= endPage; num++) {
            $("#paging").append('<span><a href="/sportsclub?page=' + num + '">' + num + '</a></span>');
        }

        // 다음 페이지 링크
        if (next && endPage > 0) {
            $("#paging").append('<span><a href="/sportsclub?page=' + (parseInt(endPage) + 1) + '">다음<img src="img/next_icon.png" width="15px"></a></span>');
        }
    }

    function ajaxselect(ctprvn_nm, item_nm, page){
        console.log("bbbb : " + ctprvn_nm);
        console.log("bbbb : " + item_nm);
        console.log("bbbb : " + page);

        if(page == null){
            page = 1;
        }

        var ajaxData = {
            page : page,
            ctprvn_nm : ctprvn_nm,
            item_nm : item_nm,
        }

        $.ajax({
            url: "/sportsclubcityname",
            method: "GET",
            data: ajaxData,
            success: function (data) {
                console.log(data);
                selectCity(data);

            }, error: function (e) {
                console.log(e.responseText);
            }

        });

    }
function num_color(cur_page, cur_num ) {
    // 현재 페이지 URL 가져오기
    var currentPage = cur_page;
    var num = cur_num;
    // 모든 링크에 대해 반복
    var links = document.querySelectorAll("a");
    links.forEach(function(link, index) {
        console.log("index : ", index);
        // 링크의 href 속성과 현재 페이지 URL 비교
        if (num === currentPage) {
            // 현재 페이지와 일치하면 클래스 추가
            if(currentPage > 10){
                var currentPage_unit = currentPage % 10;
                if(currentPage_unit!==0){
                    if(index === currentPage_unit+3){
                        link.classList.add("current-page");
                    }
                } else {
                    if(index === currentPage_unit+13){
                        link.classList.add("current-page");
                    }
                }
            }else {
                if(index-2 === currentPage){
                    link.classList.add("current-page");
                }
            }
        }
    });
};


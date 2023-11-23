function classclick(classname){

    window.location.href = "/sportsclassselect" + '?clssrm_nm=' + encodeURIComponent(classname);
}

    function selectCity(data){

        var data1 = data.list;
        var paging = data.paging;
        console.log(data1[0]);


        var ctprvn_nm = $('#ctprvn_nm option:selected').val();
        var item_nm = $('#item_nm option:selected').val();

        console.log(ctprvn_nm);
        console.log(item_nm);

        $("#sportsclasslist").empty();
        $("#paging").empty();

        $("#sportsclasslist").append('<tr>' + '<td>' + '종목명' + '</td>'
            + '<td>' + '부종목명' + '</td>'
            + '<td>' + '시도명' + '</td>'
            + '<td>' + '시군구명' + '</td>'
            + '<td>' + '교실명' + '</td>'
            +'</tr>');
        var selecteddata = '';

        $.each(data1, function (index, lists){

            selecteddata += '<tr>' + '<td>' + lists.item_nm + '</td>'
                + '<td>' + lists.subitem_nm + '</td>'
                + '<td>' + lists.ctprvn_nm + '</td>'
                + '<td>' + lists.signgu_nm + '</td>'
                + '<td onclick="classclick(\'' + lists.clssrm_nm + '\')">' + lists.clssrm_nm + '</td>'
            +'</tr>'

        });

        $("#sportsclasslist").append(selecteddata);

        console.log(paging);

        if (paging.prev) {
            $("#paging").append('<span><a href="this.javascript:void(0)" onclick="ajaxselect(\'' + ctprvn_nm + '\', \'' + item_nm + '\', ' + (parseInt(paging.startPage) - 1) + ')">이전</a></span>');
        }
        // 페이지 숫자 링크
        for (var num = paging.startPage; num <= paging.endPage; num++) {
            $("#paging").append('<span><a href="javascript:void(0)" onclick="ajaxselect(\'' + ctprvn_nm + '\', \'' + item_nm + '\', ' + num + ')">' + num + '</a></span>');
        }
        // 다음 페이지 링크
        if (paging.next && paging.endPage > 0) {
            $("#paging").append('<span><a href="javascript:void(0)" onclick="ajaxselect(\'' + ctprvn_nm + '\', \'' + item_nm + '\', ' + (parseInt(paging.endPage) + 1) + ')">다음</a></span>');
        }

    }

    function paging(prev, startPage, endPage, next){
        console.log("start page : " + startPage);
        console.log("end page : " + endPage);
        console.log(prev);
        console.log(next);

        if (prev) {
            $("#paging").append('<span><a href="/sportsclass?page=' + (parseInt(startPage) - 1) + '">이전</a></span>');
        }
        // 페이지 숫자 링크
        for (var num = startPage; num <= endPage; num++) {
            $("#paging").append('<span><a href="/sportsclass?page=' + num + '">' + num + '</a></span>');
        }
        // 다음 페이지 링크
        if (next && endPage > 0) {
            $("#paging").append('<span><a href="/sportsclass?page=' + (parseInt(endPage) + 1) + '">다음</a></span>');
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
            url: "/sportsclasscityname",
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


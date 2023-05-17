<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<script>
    // 화면에 접속 되면 로그인폼 객체에 이닛을 출력해라
    $(function (){
        login_form.init();
    });
</script>
<div class="col-sm-8 text-left">
    <div class="container col-sm-12">
        <div class="col-sm-6">
            <div class=col-sm-6">
                <h1>CFR1</h1>
                <h2>${result}</h2>
                <form action="/cfr1impl" method="post" enctype="multipart/form-data" id="cfr1_form" class="form-horizontal well">
                    <div class="form-group">
                        <input type="file" class="form-control" id="img" name="img" placeholder="Input Image" >
                    </div>

                    <div class="btns">
                        <button id="cfr1_btn" type="submit" class="btn btn-primary">Send</button>
                    </div>
                </form>

            </div>
        </div>
    </div>
</div>
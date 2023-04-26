<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<script>
    // 화면에 접속 되면 로그인폼 객체에 이닛을 출력해라
    $(function (){
        register_form.init();
    });
</script>

<div class="col-sm-8 text-left">
  <div class="container col-sm-8">
      <h1>Register Page</h1></br>
      <form id="register_form" class="form-horizontal well">
          <div class="form-group">
              <input type="ID" class="form-control" id="id" name="id" placeholder="Make Your ID" >
          </div>

          <div class="form-group">
              <input type="password" class="form-control" id="pwd" name="pwd" placeholder="Enter password" >
          </div>

          <div class="form-group">
              <input type="name" class="form-control" id="name" name="name" placeholder="name" >
          </div>

              <div>
                  <button type="button" id="register_btn" class="btn btn-primary">Regsiter</button>
              </div>
      </form>


  </div>
</div>
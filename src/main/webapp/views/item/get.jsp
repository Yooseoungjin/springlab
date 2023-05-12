<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    #img{
        width:200px;
    }
</style>

<script>
    item_get = {
        init:function (){
            $('#cart_btn').click(function (){
                let cust_id = '${logincust.id}';
                let item_id = ${gitem.id};  //숫자라서 싱글커테이션 쓰지 않는다!
                let cnt = $('#cnt').val();
                $.ajax({
                    url:'/addcart',
                    data:{cust_id:cust_id,item_id:item_id,cnt:cnt},
                    success:function (){
                        $('#myModal').modal();
                    }
                });

                // 변수잘 들어 갔는지 확인 얼랏
                // alert(cust_id);
                // alert(item_id);
                // alert(cnt);

               // $('#cart_form').attr({
               //     method:'get', /*여기서는 get방식으로 써야한다*/
               //     action:'/item/addcart'
               // });
               //  $('#cart_form').submit();
            });
        }
    };
    $(function (){

    });
    // 화면에 접속 되면 로그인폼 객체에 이닛을 출력해라
    $(function (){
        item_get.init();
    });
</script>

<div class="col-sm-8 text-left">
    <div class="container">
        <h3>Item Info</h3>
        <img id="img" src="/uimg/${gitem.imgname}">
        <h4>${gitem.id}</h4>
        <h4>${gitem.name}</h4>
        <h4>${gitem.price}</h4>

        <c:if test="${logincust !=null}">
        <form id="cart_form" class="form-inline well col-sm-5">
            <input type="hidden" name="cust_id" value="${logincust.id}">
            <input type="hidden" name="item_id" value="${gitem.id}">
            <div class="form-group">
                <label class="control-label col-sm-3" for="cnt">Count: </label>
                <input type="number" class="form-control" id="cnt" name="cnt" placeholder="Enter Count" >
            </div>

            <div class="btns">
                <div class = "col-sm-offset-2 col-sm-5">
                    <button type="button" id="cart_btn" class="btn btn-primary">CART</button>
                </div>
            </div>
        </form>
        </c:if>
    </div>
</div>

<!-- My Modal -->
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <a href="/item/allcart?id=${logincust.id}" class="btn btn-info" role="button">장바구니로이동</a>
                <a href="/item/allpage" class="btn btn-info" role="button">계속샤핑</a>
            </div>
            <div class="modal-footer">
            </div>
        </div>

    </div>
</div>

</div>
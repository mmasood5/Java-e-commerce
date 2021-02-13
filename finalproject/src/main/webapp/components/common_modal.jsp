<%-- 
    Document   : common_modal
    Created on : Dec. 4, 2020, 8:39:55 p.m.
    Author     : minha
--%>

<!-- Button trigger modal -->

<!-- Modal -->
<div class="modal fade" id="cart" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Your Cart</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <div class ="cart-body">
              
          </div>
      </div>
      <div class="modal-footer">

          <a href="checkout.jsp"><button type="button" class="btn btn-warning checkout-btn">Checkout</button></a>
        <button type="button" class="btn btn-outline-dark" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<div id ="toast">This is our Toast text</div>
/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

//Fetching products and adding them to cart
function add_item_to_cart(pid,pname,price)
{
    
    let cart = localStorage.getItem("cart");
    if(cart == null)
    {
        let products = [];
        let product = {productId:pid, productName:pname, productQuantity: 1, productPrice: price};
        products.push(product);
        localStorage.setItem("cart", JSON.stringify(products));
        //console.log("Your first product has been added to the cart");
        showToast("Added to cart.");
    }
    
    else
    {
       let pCart = JSON.parse(cart);
        
       let existingProduct = pCart.find((item)=>item.productId == pid);
       if(existingProduct)
       {
           //if the item already in the cart is clicked again, increment the quantity of the product
           existingProduct.productQuantity = existingProduct.productQuantity+1;
           pCart.map((item)=>
           {
               if(item.productId == existingProduct.productId)
               {
                   item.productQuantity = existingProduct.productQuantity;
               }
           });
           localStorage.setItem("cart", JSON.stringify(pCart));
           //console.log("Product quantity has been increased");
           showToast(existingProduct.productName + " quantity has been increased.");
        }
       
       else{
           
           //new product added to cart
            let product = {productId:pid, productName:pname, productQuantity: 1, productPrice: price};
            pCart.push(product);
            localStorage.setItem("cart", JSON.stringify(pCart));
            //console.log("Product has been added to the cart");
            showToast("Product has been added to your cart.");
       }
    }

    
    updateCart();

}


//Update Cart function
function updateCart()
{
    let cartString = localStorage.getItem("cart");
    let cart = JSON.parse(cartString);
    if(cart == null || cart.length == 0)
    {
        console.log("Cart is empty!");
        $(".cart-items").html("( 0 )");
        $(".cart-body").html("<h3>Your cart is empty</h3>");
        $(".checkout-btn").attr('disabled', true);
        
    }
    else
    {
        console.log(cart);
        $(".cart-items").html(`( ${cart.length} )`);
        let table = `
            <table class = 'table'>
            <thead class = 'thead-light'>
                <tr>
                    <th>Item Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total Price</th>
                    <th>Action</th>
                    
        
                </tr>
            
            </thead>

        `;
        let totalPrice = 0;
        cart.map((item)=>{
            
            table+=`
                <tr>
                    <td>${item.productName}</td>
                    <td>${item.productPrice}</td>
                    <td>${item.productQuantity}</td>
                    <td>${item.productQuantity * item.productPrice}</td>
                    <td><button onclick = 'deleteItems(${item.productId})' class = 'btn btn-dark'>Remove</button></td>
                    
                </tr>
            
            `;
            totalPrice += item.productPrice * item.productQuantity;
        });
        
        
        
        table =table + `
        
            <tr><td colspan = '5' class = 'text-center font-weight-bold'>Your Total: ${totalPrice}</td></tr>

        </table>`;
        $(".cart-body").html(table);
       $(".checkout-btn").attr('disabled', false);
    }
    
    
}

//Function for removing items from cart
function deleteItems(pid)
{
    let cart = JSON.parse(localStorage.getItem('cart'));
    let newCart = cart.filter((item)=>item.productId != pid);
    localStorage.setItem('cart',JSON.stringify(newCart));
    updateCart();
    showToast("Item has been removed from your cart!");
}
$(document).ready(function(){
    updateCart();
});


function showToast(content)
{
    $("#toast").addClass("display");
    $("#toast").html(content);
    setTimeout(() =>{
        $("#toast").removeClass("display");
    }, 2000);
}
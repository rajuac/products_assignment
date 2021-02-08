$(".price").html("<%= escape_javascript(render(partial: 'product_price', locals: { price: @price , currency: @currency}))%>")

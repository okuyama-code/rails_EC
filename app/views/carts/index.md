<%# ここを編集する %>
<div class="row g-5">
  <div class="col-md-5 col-lg-4 order-md-last">
    <h4 class="d-flex justify-content-between align-items-center mb-3">
      <span class="text-primary">カート内アイテム</span>
      <span class="badge bg-primary rounded-pill">3</span>
    </h4>
    <ul class="list-group mb-3">
      <li class="list-group-item d-flex justify-content-between lh-sm">
        <div>
          <h6 class="my-0"><%= cart_item.product.name %></h6>
          <small class="text-body-secondary">Brief description</small>
        </div>
        <span class="text-body-secondary"><%= cart_item.product.price %></span>
      </li>
      <li class="list-group-item d-flex justify-content-between lh-sm">
        <div>
          <h6 class="my-0">Second product</h6>
          <small class="text-body-secondary">Brief description</small>
        </div>
        <span class="text-body-secondary">$8</span>
      </li>
      <li class="list-group-item d-flex justify-content-between lh-sm">
        <div>
          <h6 class="my-0">Third item</h6>
          <small class="text-body-secondary">Brief description</small>
        </div>
        <span class="text-body-secondary">$5</span>
      </li>
      <li class="list-group-item d-flex justify-content-between bg-body-tertiary">
        <div class="text-success">
          <h6 class="my-0">Promo code</h6>
          <small>EXAMPLECODE</small>
        </div>
        <span class="text-success">−$5</span>
      </li>
      <li class="list-group-item d-flex justify-content-between">
        <span>Total (USD)</span>
        <strong>$20</strong>
      </li>
    </ul>
 </div>
<%# ここまでを編集する %>

        ==================

<li class="list-none">
  <%= cart_item.product.name %>
  <%= cart_item.product.price %>
  <%= form_with url: carts_path, method: :post,local: true do |f| %>
    <%= f.number_field :quantity ,value: cart_item.quantity %>
    <%= f.submit "更新", class: "" %>
  <% end %>

  <%= button_to "削除", delete_item_path(product_id: cart_item.product.id), method: :delete, data: { confirm: "商品を削除しますか？" } %>
</li>


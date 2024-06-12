package model;

import java.util.HashMap;
import java.util.Map;

public class Cart {
    private Map<String, CartItem> items = new HashMap<>();
    private double totalCost;

    public void addItem(Product product, int quantity) {
        String productId = String.valueOf(product.getProID()); // Chuyển đổi int thành String
        if (items.containsKey(productId)) {
            // Nếu sản phẩm đã tồn tại trong giỏ hàng, tăng số lượng lên
            items.get(productId).incrementQuantity();
        } else {
            // Nếu sản phẩm chưa tồn tại trong giỏ hàng, thêm mới vào
            items.put(productId, new CartItem(product, quantity));
        }
    }

    public void removeItem(int productId) {
        items.remove(String.valueOf(productId));
    }

    public void updateItemQuantity(int productId, int quantity) {
        CartItem item = items.get(String.valueOf(productId));
        if (item != null) {
            item.setQuantity(quantity);
        }
    }


    public Map<String, CartItem> getItems() {
        return items;
    }

    public double getTotalCost() {
        return items.values().stream()
                .mapToDouble(item -> item.getProduct().getPrice() * item.getQuantity())
                .sum();
    }

    public void updateQuantity(String productId, int newQuantity) {
        // Kiểm tra xem sản phẩm có trong giỏ hàng không
        if (items.containsKey(productId)) {
            // Nếu sản phẩm tồn tại trong giỏ hàng, cập nhật số lượng mới
            CartItem cartItem = items.get(productId);
            cartItem.setQuantity(newQuantity);
            // Cập nhật giỏ hàng
            items.put(productId, cartItem);
            // Cập nhật tổng cộng
            updateTotalCost();
        }
    }

    private void updateTotalCost() {
        // Khởi tạo tổng cộng
        double totalCost = 0.0;

        // Duyệt qua mỗi mục trong giỏ hàng
        for (CartItem cartItem : items.values()) {
            // Lấy giá của sản phẩm và số lượng của sản phẩm trong mục giỏ hàng
            double price = cartItem.getProduct().getPrice();
            int quantity = cartItem.getQuantity();

            // Tính tổng tiền cho sản phẩm này và cộng vào tổng cộng
            totalCost += price * quantity;
        }

        // Cập nhật tổng cộng của giỏ hàng
        this.totalCost = totalCost;
    }

    public int getTotalItems() {
        return items.size();

    }
}

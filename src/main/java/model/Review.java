package model;

public class Review {
    private int userId;
    private int productId;
    private String name;
    private String email;
    private String content;
    private int star;
    private int status;

    public Review(int userId, int productId, String content, int star, int status, String name, String email) {
        this.userId = userId;
        this.productId = productId;
        this.content = content;
        this.star = star;
        this.status = status;
        this.name = name;
        this.email = email;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getStar() {
        return star;
    }

    public void setStar(int star) {
        this.star = star;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Review{" +
                "userId=" + userId +
                ", productId=" + productId +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", content='" + content + '\'' +
                ", star=" + star +
                ", status=" + status +
                '}';
    }
}

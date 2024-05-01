package model;

public class Product {
    private int proID;
    private int catID;
    private String namePro;
    private String img;
    private double price;
    private String description;
    private String color;
    private String size;
    private int period;
    private int quantity;

    public Product(int proID, int catID, String namePro, String img, double price,  String description,String color, String size, int period, int quantity) {
        this.proID = proID;
        this.catID = catID;
        this.namePro = namePro;
        this.img = img;
        this.price = price;
        this.description= description;
        this.color = color;
        this.size = size;
        this.period = period;
        this.quantity = quantity;
    }

    public int getProID() {
        return proID;
    }

    public void setProID(int proID) {
        this.proID = proID;
    }

    public int getCatID() {
        return catID;
    }

    public void setCatID(int catID) {
        this.catID = catID;
    }

    public String getNamePro() {
        return namePro;
    }

    public void setNamePro(String namePro) {
        this.namePro = namePro;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public int getPeriod() {
        return period;
    }

    public void setPeriod(int period) {
        this.period = period;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "Product{" +
                "proID=" + proID +
                ", catID=" + catID +
                ", namePro='" + namePro + '\'' +
                ", img='" + img + '\'' +
                ", price=" + price +
                ", description='" + description + '\'' +
                ", color='" + color + '\'' +
                ", size='" + size + '\'' +
                ", period=" + period +
                ", quantity=" + quantity +
                '}';
    }
}

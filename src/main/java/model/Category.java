package model;

public class Category {
    private int catID;
    private String nameCate;

    public Category(int catID, String nameCate) {
        this.catID = catID;
        this.nameCate = nameCate;
    }

    public Category() {

    }

    public int getCatID() {
        return catID;
    }

    public void setCatID(int catID) {
        this.catID = catID;
    }

    public String getNameCate() {
        return nameCate;
    }

    public void setNameCate(String nameCate) {
        this.nameCate = nameCate;
    }

    @Override
    public String toString() {
        return "Category{" +
                "catID=" + catID +
                ", nameCate='" + nameCate + '\'' +
                '}';
    }
}

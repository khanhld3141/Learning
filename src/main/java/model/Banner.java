package model;

public class Banner {

    private int Id;
    private  String Image,Content,StartDay,EndDay;

    public Banner() {
    }

    public Banner(String image, String content, String startDay, String endDay) {
        Image = image;
        Content = content;
        StartDay = startDay;
        EndDay = endDay;
    }

    public Banner(int id, String image, String content, String startDay, String endDay) {
        Id = id;
        Image = image;
        Content = content;
        StartDay = startDay;
        EndDay = endDay;
    }

    public int getId() {
        return Id;
    }

    public void setId(int id) {
        Id = id;
    }

    public String getImage() {
        return Image;
    }

    public void setImage(String image) {
        Image = image;
    }

    public String getContent() {
        return Content;
    }

    public void setContent(String content) {
        Content = content;
    }

    public String getStartDay() {
        return StartDay;
    }

    public void setStartDay(String startDay) {
        StartDay = startDay;
    }

    public String getEndDay() {
        return EndDay;
    }

    public void setEndDay(String endDay) {
        EndDay = endDay;
    }
}

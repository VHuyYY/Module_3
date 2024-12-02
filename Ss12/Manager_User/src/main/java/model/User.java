package model;

public class User {
    private int id;
    private String name;
    private String mail;
    private String country;

    public User(String name, String mail, String country) {
        this.name = name;
        this.mail = mail;
        this.country = country;
    }

    public User(int id, String name, String mail, String country) {
        this.id = id;
        this.name = name;
        this.mail = mail;
        this.country = country;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }
}


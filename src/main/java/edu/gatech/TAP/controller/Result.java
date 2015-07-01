package edu.gatech.TAP.controller;
import java.util.*;

/**
 * Created by Bjfmoore on 6/23/14.
 */
public class Result {

    private String id;
    private String name;
    private String url; // number of search terms returned
    private String imgUrl;
    private String phone;
    private String display_phone;
    private String address;
    private String review_count;
    private double distance; //meters
    private double rating;
    private String rating_img_url;
    private List location;
    private List deals;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getDisplay_phone() {
        return display_phone;
    }

    public void setDisplay_phone(String display_phone) {
        this.display_phone = display_phone;
    }

    public String getReview_count() {
        return review_count;
    }

    public void setReview_count(String review_count) {
        this.review_count = review_count;
    }

    public double getDistance() {
        return distance;
    }

    public void setDistance(double distance) {
        this.distance = distance;
    }

    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

    public String getRating_img_url() {
        return rating_img_url;
    }

    public void setRating_img_url(String rating_img_url) {
        this.rating_img_url = rating_img_url;
    }

    public List getLocation() {
        return location;
    }

    public void setLocation(List location) {
        this.location = location;
    }

    public List getDeals() {
        return deals;
    }

    public void setDeals(List deals) {
        this.deals = deals;
    }
    public Result(){
        super();
    }

    public Result(String id, String name, String url, String mobileUrl, String phone, String display_phone,
                  String review_count, double distance, double rating, String rating_img_url, List location, List deals) {
        this.id = id;
        this.name = name;
        this.url = url;
        this.phone = phone;
        this.display_phone = display_phone;
        this.review_count = review_count;
        this.distance = distance;
        this.rating = rating;
        this.rating_img_url = rating_img_url;
        this.location = location;
        this.deals = deals;
    }

    }



package edu.gatech.TAP.controller;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.scribe.builder.ServiceBuilder;
import org.scribe.model.OAuthRequest;
import org.scribe.model.Response;
import org.scribe.model.Token;
import org.scribe.model.Verb;
import org.scribe.oauth.OAuthService;


import java.util.ArrayList;

import com.beust.jcommander.JCommander;
import com.beust.jcommander.Parameter;

/**
 * Code sample for accessing the Yelp API V2.
 * 
 * This program demonstrates the capability of the Yelp API version 2.0 by using the Search API to
 * query for businesses by a search term and location, and the Business API to query additional
 * information about the top result from the search query.
 * 
 * <p>
 * See <a href="http://www.yelp.com/developers/documentation">Yelp Documentation</a> for more info.
 * 
 */
public class YelpAPI {

  private static final String API_HOST = "api.yelp.com";
  private static final String DEFAULT_TERM = "dinner";
  private static final String DEFAULT_LOCATION = "San Francisco, CA";
  private static final int SEARCH_LIMIT = 50;
  private static final String SEARCH_PATH = "/v2/search";
  private static final String BUSINESS_PATH = "/v2/business";
  private static final int MAX_RESULTS = 10;

  /*
   * Update OAuth credentials below from the Yelp Developers API site:
   * http://www.yelp.com/developers/getting_started/api_access
   */
  private static final String CONSUMER_KEY = "tkIdopX3-l3IqP4gtrfI1w";
  private static final String CONSUMER_SECRET = "kFSpjZGwyjY3WvI-CpwEZu0MQzY";
  private static final String TOKEN = "GNJYbSKeRhb-eXnce8UGAez9z1ZLx-qB";
  private static final String TOKEN_SECRET = "ejloFZM_KD6BY6p6-neSK9RFPho";

  OAuthService service;
  Token accessToken;

  /**
   * Setup the Yelp API OAuth credentials.
   * 
   * @param consumerKey Consumer key
   * @param consumerSecret Consumer secret
   * @param token Token
   * @param tokenSecret Token secret
   */
  public YelpAPI(String consumerKey, String consumerSecret, String token, String tokenSecret) {
    this.service =
        new ServiceBuilder().provider(TwoStepOAuth.class).apiKey(consumerKey)
            .apiSecret(consumerSecret).build();
    this.accessToken = new Token(token, tokenSecret);
  }

  /**
   * Creates and sends a request to the Search API by term, location, price, distance, and rating.
   * <p>
   * See <a href="http://www.yelp.com/developers/documentation/v2/search_api">Yelp Search API V2</a>
   * for more info.
   * 
   * @param term <tt>String</tt> of the search term to be queried
   * @param location <tt>String</tt> of the location
   * @param price
   * @param distance
   * @param rating
   * @return <tt>String</tt> JSON Response
   */
  public String searchForBusinessesByLocation(String term, String location,  
    String distance, String rating) {

    OAuthRequest request = createOAuthRequest(SEARCH_PATH);

    request.addQuerystringParameter("radius_filter", "10000");
    request.addQuerystringParameter("term", term);
    request.addQuerystringParameter("location", location);
    return sendRequestAndGetResponse(request);
  }

  /**
   * Creates and sends a request to the Business API by business ID.
   * <p>
   * See <a href="http://www.yelp.com/developers/documentation/v2/business">Yelp Business API V2</a>
   * for more info.
   * 
   * @param businessID <tt>String</tt> business ID of the requested business
   * @return <tt>String</tt> JSON Response
   */
  public String searchByBusinessId(String businessID) {
    OAuthRequest request = createOAuthRequest(BUSINESS_PATH + "/" + businessID);
    return sendRequestAndGetResponse(request);
  }

  /**
   * Creates and returns an {@link OAuthRequest} based on the API endpoint specified.
   * 
   * @param path API endpoint to be queried
   * @return <tt>OAuthRequest</tt>
   */
  private OAuthRequest createOAuthRequest(String path) {
    OAuthRequest request = new OAuthRequest(Verb.GET, "http://" + API_HOST + path);
    return request;
  }

  /**
   * Sends an {@link OAuthRequest} and returns the {@link Response} body.
   * 
   * @param request {@link OAuthRequest} corresponding to the API request
   * @return <tt>String</tt> body of API response
   */
  private String sendRequestAndGetResponse(OAuthRequest request) {
    System.out.println("Querying " + request.getCompleteUrl() + " ...");
    this.service.signRequest(this.accessToken, request);
    Response response = request.send();
    return response.getBody();
  }

  /**
   * Queries the Search API based on the command line arguments and takes the first result to query
   * the Business API.
   * 
   * @param yelpApi <tt>YelpAPI</tt> service instance
   * @param yelpApiCli <tt>YelpAPICLI</tt> command line arguments
   */
  private static ArrayList<Result> queryAPI(YelpAPI yelpApi, String term, String location, 
    String distance, String rating) {
    String searchResponseJSON =
        yelpApi.searchForBusinessesByLocation(term, location, distance, rating);

    JSONParser parser = new JSONParser();
    JSONObject response = null;
    try {
      response = (JSONObject) parser.parse(searchResponseJSON);
    } catch (ParseException pe) {
      System.out.println("Error: could not parse JSON response:");
      System.out.println(searchResponseJSON);
      System.exit(1);
    }

    //gets results
    JSONArray businesses = (JSONArray) response.get("businesses");
    if(rating == null){
      rating = "2";
    }
    ArrayList<Result> searchResults = new ArrayList<Result>();
    if(businesses != null){
      for(int i = 0; i < businesses.size(); i++){
        JSONObject loc = (JSONObject) businesses.get(i);
        Result result = new Result ();
        result.setId(loc.get("id").toString());
        result.setName(loc.get("name").toString());
        result.setUrl(loc.get("url").toString());
        result.setPhone(loc.get("phone").toString());
        result.setDisplay_phone(loc.get("display_phone").toString());
        JSONObject locObject = (JSONObject) loc.get("location");
        JSONArray locArray = (JSONArray)locObject.get("display_address");
        String address = locArray.get(0).toString() + ", " + locArray.get(1).toString();
        result.setAddress(address);
        result.setImgUrl(loc.get("image_url").toString());
        result.setRating_img_url(loc.get("rating_img_url").toString());
        if((Double.parseDouble(loc.get("rating").toString()) >= Double.parseDouble(rating)) && searchResults.size() < MAX_RESULTS){
          searchResults.add(result);
        }
      }
    }
    return searchResults;
  }

  public static ArrayList<Result> getResults(String term, String location, 
    String distance, String rating) {
    YelpAPI yelpApi = new YelpAPI(CONSUMER_KEY, CONSUMER_SECRET, TOKEN, TOKEN_SECRET);
    return queryAPI(yelpApi, term, location, distance, rating);
  }
}
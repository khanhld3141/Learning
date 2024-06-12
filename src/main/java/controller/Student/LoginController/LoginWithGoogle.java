package controller.Student.LoginController;

import java.io.*;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import controller.Ulti.Constants;
import dal.UserDAO;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.User;
import model.UserGoogle;
import org.apache.http.HttpResponse;
import org.apache.http.client.*;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;
import org.apache.http.client.fluent.Response;
import org.apache.http.util.EntityUtils;

@WebServlet(name = "LoginWithGoogleServlet", value = "/loginwithgoogle")
public class LoginWithGoogle extends HttpServlet {
    private String message;
    private UserDAO userDAO;

    public void init() {
        message = "Hello World!";
        userDAO=new UserDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String code=request.getParameter("code");
        String token=getToken(code);
        UserGoogle userGoogle=getUserInfo(token);

        User user=userDAO.getByEmail(userGoogle.getEmail());
        if(user==null){
            userDAO.create(new User(
                    0,
                    "User",
                    "",
                    "",
                    "R3",
                    userGoogle.getEmail(),
                    ""
            ));
        }
        user=userDAO.getByEmail(userGoogle.getEmail());
        HttpSession session=request.getSession();
        session.setAttribute("user",user);
        response.sendRedirect("/home");
    }
    public static String getToken(String code) throws ClientProtocolException, IOException {
        // call api to get token
        HttpResponse response = null;
        try {
            response = Request.Post(Constants.GOOGLE_LINK_GET_TOKEN)
                    .bodyForm(Form.form()
                            .add("client_id", Constants.GOOGLE_CLIENT_ID)
                            .add("client_secret", Constants.GOOGLE_CLIENT_SECRET)
                            .add("redirect_uri", Constants.GOOGLE_REDIRECT_URI)
                            .add("code", code)
                            .add("grant_type", Constants.GOOGLE_GRANT_TYPE)
                            .build())
                    .execute().returnResponse();

            int statusCode = response.getStatusLine().getStatusCode();
            String responseString = EntityUtils.toString(response.getEntity());

            System.out.println("HTTP Status Code: " + statusCode);
            System.out.println("Response from Google Token Endpoint: " + responseString);

            if (statusCode != 200) {
                throw new IOException("Failed : HTTP error code : " + statusCode + ", response: " + responseString);
            }

            JsonObject jobj = new Gson().fromJson(responseString, JsonObject.class);
            if (jobj.has("access_token")) {
                return jobj.get("access_token").getAsString();
            } else {
                throw new IOException("Failed to obtain access token, response: " + responseString);
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new IOException("Error during HTTP request to Google token endpoint", e);
        } finally {
            if (response != null) {
                EntityUtils.consumeQuietly(response.getEntity());
            }
        }
    }
    public static UserGoogle getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String link = Constants.GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();

        UserGoogle googlePojo = new Gson().fromJson(response, UserGoogle.class);

        return googlePojo;
    }
    public void destroy() {
    }
}
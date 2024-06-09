package controller.Student.BlogController;

import java.io.*;
import java.util.List;

import controller.Ulti.FileUploadUtil;
import dal.HashtagDAO;
import dal.PostDAO;
import dal.PostHashtagDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Hashtag;
import model.Post;
import model.PostHashtag;

@WebServlet(name = "UpdateMyPostServlet", value = "/update-my-post")
public class UpdateMyPost extends HttpServlet {
    private String message;
    private PostDAO postDAO;
    private HashtagDAO hashtagDAO;
    private PostHashtagDAO postHashtagDAO;
    public void init() {
        message = "Hello World!";
        postDAO=new PostDAO();
        hashtagDAO=new HashtagDAO();
        postHashtagDAO=new PostHashtagDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if(request.getParameter("id")!=null){
            HttpSession session=request.getSession();
            try{
                int id=Integer.parseInt(request.getParameter("id"));
                Post post=postDAO.get(id);
                List<Hashtag> hashtags = hashtagDAO.getAllHashTagOfPost(id);
                request.setAttribute("hashtags", hashtags);
                request.setAttribute("post", post);
                request.getRequestDispatcher("/Manage-users-blog/update-post.jsp").forward(request,response);
            }catch (Exception e){
                session.setAttribute("error","Error while updating post");
                response.sendRedirect("/my-posts");
            }
        }else{
            request.getRequestDispatcher("/404notfound/index.jsp").forward(request, response);
        }
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String content = request.getParameter("content");
        String comment = request.getParameter("comment");
        String title = request.getParameter("title");
        String id = request.getParameter("id");

        Post post = postDAO.get(Integer.parseInt(id));
        HttpSession session=request.getSession();

        try {
            //delete old hashtag
            List<PostHashtag> postHashtags=postHashtagDAO.get(post.getId());
            postHashtagDAO.deleteHashtagOfPost(post.getId());
            for(PostHashtag postHashtag : postHashtags){
                if(postHashtagDAO.getByTagId(postHashtag.getHashtagId()).size() == 0){
                    hashtagDAO.delete(postHashtag.getHashtagId());
                }
            }



            String[] hashtags = request.getParameterValues("hashtag[]");
            if (hashtags != null) {
                for (String hashtag : hashtags) {
                    if (!hashtag.isEmpty()) {
                        Hashtag hashtag1 = hashtagDAO.getByHashtag(hashtag.toLowerCase());
                        if (hashtag1 != null) {
                            postHashtagDAO.create(new PostHashtag(
                                    post.getId(),
                                    hashtag1.getId()
                            ));
                        } else {
                            int hashtagid= hashtagDAO.create(new Hashtag(post.getId(),hashtag));
                            postHashtagDAO.create(new PostHashtag(
                                    post.getId(),
                                    hashtagid
                            ));
                        }
                    }
                }
            }
            post.setComment(comment);
            post.setTitle(title);
            post.setContent(content);
            postDAO.update(post);
            session.setAttribute("success","Updated post successfully");
        } catch (Exception e) {
            session.setAttribute("error", "Error while updating post");
        }
        response.sendRedirect("/my-posts");
    }

    public void destroy() {
    }
}
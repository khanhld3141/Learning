package controller.Ulti;

import model.PostComment;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.util.ArrayList;
import java.util.List;

public class CommentUtils {

    public static List<PostComment> getChildComments(List<PostComment> comments, int parentId) {
        List<PostComment> childComments = new ArrayList<>();
        for (PostComment comment : comments) {
            if (comment.getIdParent() == parentId) {
                childComments.add(comment);
            }
        }
        return childComments;
    }

    public static void displayComments(List<PostComment> comments, int parentId, int level, PrintWriter out) throws IOException
            , IOException {
        List<PostComment> childComments = getChildComments(comments, parentId);
        for (PostComment comment : childComments) {
//            out.write("<div style=\"margin-left: " + (level * 20) + "px;\">");
//            // Display comment information (modify as needed)
            out.write("<p>"+comment.getContent()+"</p>");
//            // Recursive call using Writer parameter
            displayComments(comments, comment.getId(), level + 1, out);
//            out.write("</div>");
        }
    }
}
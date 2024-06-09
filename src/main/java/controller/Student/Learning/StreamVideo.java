package controller.Student.Learning;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;

import com.google.gson.Gson;
import dal.LessionDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Lession;

@WebServlet(name = "StreamVideoServlet", value = "/video")
public class StreamVideo extends HttpServlet {
    private String message;
    private LessionDAO lessionDAO;

    public void init() {
        message = "Hello World!";
        lessionDAO = new LessionDAO();
    }


    private static final int DEFAULT_BUFFER_SIZE = 65536; // 64KB

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        boolean responseCommitted = false;
        try {
            if (request.getParameter("id") != null && request.getParameter("courseid") != null) {
                int videoId = Integer.parseInt(request.getParameter("id"));
                Lession lession = lessionDAO.get(videoId);
                String videoUrl = "/images/" + lession.getLink();
                if (videoUrl == null || videoUrl.isEmpty()) {
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing video URL parameter");
                    return;
                }

                String videoPath = getServletContext().getRealPath(videoUrl);
                File videoFile = new File(videoPath);
                if (!videoFile.exists()) {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND);
                    return;
                }

                String rangeHeader = request.getHeader("Range");
                if (rangeHeader == null) {
                    serveFile(response, videoFile, 0, videoFile.length() - 1);
                } else {
                    long[] range = parseRangeHeader(rangeHeader, videoFile.length());
                    serveFile(response, videoFile, range[0], range[1]);
                }
                responseCommitted = true;
            } else {
                request.getRequestDispatcher("/404notfound/index.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            if (!responseCommitted) {
                request.getRequestDispatcher("/404notfound/index.jsp").forward(request, response);
            }
        }
    }

    private long[] parseRangeHeader(String rangeHeader, long fileLength) {
        long start = 0, end = fileLength - 1;
        String[] parts = rangeHeader.replace("bytes=", "").split("-");
        try {
            if (parts.length > 0) {
                start = Long.parseLong(parts[0]);
            }
            if (parts.length > 1) {
                end = Long.parseLong(parts[1]);
                if (end >= fileLength) {
                    end = fileLength - 1;
                }
            }
        } catch (NumberFormatException e) {
            // Ignore parsing errors and use defaults
        }
        return new long[]{start, end};
    }

    private void serveFile(HttpServletResponse response, File file, long start, long end) throws IOException {
        response.setStatus(HttpServletResponse.SC_PARTIAL_CONTENT);
        response.setContentType("video/mp4");
        response.setHeader("Accept-Ranges", "bytes");
        response.setHeader("Content-Range", "bytes " + start + "-" + end + "/" + file.length());
        response.setContentLengthLong(end - start + 1);

        try (RandomAccessFile raf = new RandomAccessFile(file, "r");
             OutputStream outputStream = response.getOutputStream()) {
            raf.seek(start);
            byte[] buffer = new byte[DEFAULT_BUFFER_SIZE];
            int bytesRead;
            long bytesLeft = end - start + 1;

            while (bytesLeft > 0 && (bytesRead = raf.read(buffer, 0, (int) Math.min(buffer.length, bytesLeft))) != -1) {

                try{
                    outputStream.write(buffer, 0, bytesRead);
                    outputStream.flush();
                    bytesLeft -= bytesRead;
                }catch (IOException e){
                    //WARNING
                }
            }
        } catch (IOException e) {
//            System.err.println("Error streaming file: " + e.getMessage());
//            e.printStackTrace();
            if (!response.isCommitted()) {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error streaming file");
            }
        }
    }

    public void destroy() {
    }
}
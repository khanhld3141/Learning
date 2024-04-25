package controller.Ulti;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;

public class FileUploadUtil {

    public static String uploadFile(Part filePart, String realPath) throws IOException {
        String filename =
                Path.of(UUID.randomUUID().toString()+"_"+filePart.getSubmittedFileName() ).getFileName().toString();
        if (!Files.exists(Path.of(realPath))) {
            Files.createDirectory(Path.of(realPath));
        }
        filePart.write(realPath + "/" + filename);
        return filename;
    }
    public static void deleteFile(String realPath,String filename) {
        Path filePath = Paths.get(realPath, filename);
        try {
            Files.delete(filePath);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
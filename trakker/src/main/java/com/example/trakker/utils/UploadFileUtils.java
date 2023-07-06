package com.example.trakker.utils;


import org.springframework.util.FileCopyUtils;


import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

public class UploadFileUtils {

    public static String uploadFile(String uploadPath
            , String originalName, byte[] fileData) throws Exception {
        UUID uid = UUID.randomUUID();
        String savedName = uid.toString() + "_" + originalName;
        String savedPath = calcPath(uploadPath);
        File target = new File(uploadPath+savedPath,savedName);
        FileCopyUtils.copy(fileData, target);
        String formatName = originalName.substring(originalName.lastIndexOf(".")+1);
        String uploadedFileName = null;
        MediaUtils.getMediaType(formatName);
        uploadedFileName = makeFile(uploadPath, savedPath, savedName);
        return uploadedFileName;
    }
    public static String makeFile(String uploadPath,
                                  String path, String fileName) throws Exception {
        String fullFilePath = uploadPath + path +File.separator+fileName;
        return fullFilePath.substring(uploadPath.length())
                .replace(File.separatorChar, '/');
    }
    public static String calcPath(String uploadPath) {
        Calendar cal = Calendar.getInstance();
        String yearPath = File.separator + cal.get(Calendar.YEAR);
        String monthPath = yearPath + File.separator
                + new DecimalFormat("00").format(cal.get(Calendar.MONTH) +1);
        String datePath = monthPath + File.separator +
                new DecimalFormat("00").format(cal.get(Calendar.DATE));
        makeDir(uploadPath, yearPath, monthPath, datePath);
        return datePath;
    }
    public static void makeDir(String uploadPath, String... paths) {
        if(new File(paths[paths.length - 1]).exists()) {
            return;
        }
        for(String path: paths) {
            File dirPath = new File(uploadPath + path);
            if(!dirPath.exists()) {
                dirPath.mkdir();
            }
        }
    }
}

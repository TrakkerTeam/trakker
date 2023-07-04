package com.example.trakker.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;




import com.example.trakker.service.trip.TripService;
import com.example.trakker.utils.MediaUtils;
import com.example.trakker.utils.UploadFileUtils;
import org.apache.commons.io.IOUtils;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;


@Controller
public class AjaxUploadController {


    @Autowired
    TripService tripService;


    @Resource(name = "uploadTripPath")
    String uploadPath;

    @ResponseBody
    @RequestMapping(value = "/upload/uploadAjax", method = RequestMethod.POST,
            produces = "text/plain;charset=utf-8")
    public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception{
        return new ResponseEntity<String>(UploadFileUtils.uploadFile(uploadPath,
                file.getOriginalFilename(), file.getBytes()), HttpStatus.OK);
    }

    @ResponseBody
    @RequestMapping("/upload/displayFile")
    public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {
        InputStream in = null;
        ResponseEntity<byte[]> entity = null;
        try {
            String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
            MediaType mType = MediaUtils.getMediaType(formatName);
            HttpHeaders headers = new HttpHeaders();
            in = new FileInputStream(uploadPath + fileName);
            fileName = fileName.substring(fileName.indexOf("_")+1);
            headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
            headers.add("Content-Disposition", "attachment; fileName=\""
                    + new String(fileName.getBytes("utf-8"), "iso-8859-1")+"\"");
            entity = new ResponseEntity<byte[]>(
                    IOUtils.toByteArray(in), headers, HttpStatus.OK);

        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
        } finally {
            if(in != null)
                in.close();
        }
        return entity;
    }

    @ResponseBody
    @RequestMapping(value = "/upload/deleteFile")
    public ResponseEntity<String> deleteFile(String fileName){

        String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
        MediaType mType = MediaUtils.getMediaType(formatName);
        if(mType != null) {
            String front=fileName.substring(0, 12);
            String end=fileName.substring(14);
            new File(uploadPath+(front+end).replace(
                    '/', File.pathSeparatorChar)).delete();
        }

        new File(uploadPath+fileName.replace('/', File.separatorChar)).delete();
        tripService.deleteFile(fileName);
        return new ResponseEntity<String>("deleted", HttpStatus.OK);

    }
}



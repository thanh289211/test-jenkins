package vn.com.foxtek.src_tool_generate_be.controllers;

import lombok.Data;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import vn.com.foxtek.src_tool_generate_be.request.SourceInfoRequest;
import vn.com.foxtek.src_tool_generate_be.services.ProjectGenerateServices;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

@Controller
@Data
@RequestMapping()
public class ToolGenController {

    private final ProjectGenerateServices projectGenerateServices;

//    @PostMapping("/be-generate")
//    public ResponseEntity<?> beGenerate(@RequestBody SourceInfoRequest sourceInfoRequest) throws IOException, SQLException {
//        byte[] fileData = projectGenerateServices.beTemplateGenerate(sourceInfoRequest);
//        HttpHeaders headers = new HttpHeaders();
//        headers.add(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=src_backend_template.zip");
//        headers.add(HttpHeaders.ACCESS_CONTROL_EXPOSE_HEADERS, HttpHeaders.CONTENT_DISPOSITION);
//        return new ResponseEntity<>(fileData, headers, HttpStatus.OK);
//    }

    @PostMapping("/project-generate")
    public ResponseEntity<?> feGenerate(@RequestBody SourceInfoRequest sourceInfoRequest) throws IOException, SQLException {
        byte[] fileData = projectGenerateServices.templateGenerate(sourceInfoRequest);
        final HttpHeaders headers = new HttpHeaders();
        headers.add(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=src_project_template.zip");
        headers.add(HttpHeaders.ACCESS_CONTROL_EXPOSE_HEADERS, HttpHeaders.CONTENT_DISPOSITION);
        return new ResponseEntity<>(fileData, headers, HttpStatus.OK);
    }


}

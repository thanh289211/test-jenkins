package ${sourceInfo.packageName}.business.controllers;

import ${sourceInfo.packageName}.business.entities.UserEntity;
import ${sourceInfo.packageName}.business.request.PageRequest;
import ${sourceInfo.packageName}.business.request.SearchRequest;
import ${sourceInfo.packageName}.business.request.${entityInfo.className}Request;
import ${sourceInfo.packageName}.business.response.BaseResponse;
import ${sourceInfo.packageName}.business.services.implement.${entityInfo.className}ServiceImpl;
import ${sourceInfo.packageName}.core.configurations.ResourcePath;
import ${sourceInfo.packageName}.helpers.constants.BusinessConstants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping(ResourcePath.BASE + "/${path}")
public class ${entityInfo.className}Controller extends BaseController<${entityInfo.className}, Long> {

    @Autowired
    public ${entityInfo.className}Controller(${entityInfo.className}ServiceImpl service){
        super(service);
    }

    @GetMapping("search")
    public ResponseEntity<?> search(@ModelAttribute SearchRequest searchRequest){
        BaseResponse baseResponse;
        try {
            baseResponse = ((${entityInfo.className}ServiceImpl) getBaseServiceImpl()).search(searchRequest);
        }catch (Exception ex){
            return new ResponseEntity<>(BaseResponse.error("Error"), HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return new ResponseEntity<>(baseResponse, HttpStatus.OK);
    }

    @PostMapping()
    public ResponseEntity<?> insert(@RequestBody ${entityInfo.className}Request request){
        BaseResponse baseResponse;
        try {
            baseResponse = ((${entityInfo.className}ServiceImpl) getBaseServiceImpl()).insert(request);
        }catch (Exception ex){
            return new ResponseEntity<>(BaseResponse.error("Error"), HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return new ResponseEntity<>(baseResponse, HttpStatus.OK);
    }

    @PutMapping("{id}")
    public ResponseEntity<?> update(@RequestBody ${entityInfo.className}Request request, @PathVariable long id){
        BaseResponse baseResponse;
        try {
            baseResponse = ((${entityInfo.className}ServiceImpl) getBaseServiceImpl()).update(request,id);
        }catch (Exception ex){
            return new ResponseEntity<>(BaseResponse.error("Error"), HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return new ResponseEntity<>(baseResponse, HttpStatus.OK);
    }
}


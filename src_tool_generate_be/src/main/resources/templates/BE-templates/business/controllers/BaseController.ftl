package ${sourceInfo.packageName}.business.controllers;

import ${sourceInfo.packageName}.business.entities.BaseEntity;
import ${sourceInfo.packageName}.business.request.PageRequest;
import ${sourceInfo.packageName}.business.response.BaseResponse;
import ${sourceInfo.packageName}.business.services.base.implement.BaseServiceImpl;
import ${sourceInfo.packageName}.helpers.constants.BusinessConstants;
import lombok.AllArgsConstructor;
import lombok.Getter;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.io.Serializable;

@AllArgsConstructor
@Getter
public abstract class BaseController<T extends BaseEntity, ID extends Serializable> {

    private final BaseServiceImpl<T, ID> baseServiceImpl;

    @GetMapping()
    public ResponseEntity<?> listAll (@ModelAttribute PageRequest pageRequest){
        BaseResponse baseResponse;
        try{
            baseResponse = baseServiceImpl.findByDelete(BusinessConstants.Delete.NOT_DELETE, pageRequest);
        }catch (Exception ex){
            return new ResponseEntity<>(BaseResponse.error("Error"), HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return new ResponseEntity<>(baseResponse, HttpStatus.OK);
    }

    @GetMapping("{id}")
    public ResponseEntity<?> getById(@PathVariable long id){
        BaseResponse baseResponse;
        try {
            baseResponse = baseServiceImpl.getById(id);
        }catch (Exception ex){
            return new ResponseEntity<>(BaseResponse.error("Error"), HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return new ResponseEntity<>(baseResponse, HttpStatus.OK);
    }

    @DeleteMapping("{id}")
    public ResponseEntity<?> delete(@PathVariable long id){
        BaseResponse baseResponse;
        try {
            baseResponse = baseServiceImpl.delete(id);
        }catch (Exception ex){
            return new ResponseEntity<>(BaseResponse.error("Error"), HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return new ResponseEntity<>(baseResponse, HttpStatus.OK);
    }

    @GetMapping("by-id-and-client-id")
    public ResponseEntity<?> findFirstByIdAndClientId(@RequestParam long id, @RequestParam long clientId){
        BaseResponse baseResponse;
        try{
            baseResponse = baseServiceImpl.findFirstByIdAndClientId(id, clientId);
        }catch (Exception ex){
            return new ResponseEntity<>(BaseResponse.error("Error"), HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return new ResponseEntity<>(baseResponse, HttpStatus.OK);
    }

    @GetMapping("by-client-id")
    public ResponseEntity<?> findAllByClientId(@RequestParam long clientId){
        BaseResponse baseResponse;
        try{
            baseResponse = baseServiceImpl.findAllByClientId(clientId);
        }catch (Exception ex){
            return new ResponseEntity<>(BaseResponse.error("Error"), HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return new ResponseEntity<>(baseResponse, HttpStatus.OK);
    }

    @GetMapping("page-by-client-id")
    public ResponseEntity<?> findAllByClientId(@RequestParam long clientId, @ModelAttribute PageRequest pageRequest){
        BaseResponse baseResponse;
        try{
            baseResponse = baseServiceImpl.findAllByClientId(clientId, pageRequest);
        }catch (Exception ex){
            return new ResponseEntity<>(BaseResponse.error("Error"), HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return new ResponseEntity<>(baseResponse, HttpStatus.OK);
    }

    @GetMapping("by-client-id-and-status")
    public ResponseEntity<?> findByClientIdAndStatus(@RequestParam long clientId, @RequestParam Integer status){
        BaseResponse baseResponse;
        try{
            baseResponse = baseServiceImpl.findByClientIdAndStatus(clientId, status);
        }catch (Exception ex){
            return new ResponseEntity<>(BaseResponse.error("Error"), HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return new ResponseEntity<>(baseResponse, HttpStatus.OK);
    }

    @GetMapping("page-by-client-id-and-status")
    public ResponseEntity<?> findByClientIdAndStatus(@RequestParam long clientId, @RequestParam Integer status, @ModelAttribute PageRequest pageRequest){
        BaseResponse baseResponse;
        try{
            baseResponse = baseServiceImpl.findByClientIdAndStatus(clientId, status, pageRequest);
        }catch (Exception ex){
            return new ResponseEntity<>(BaseResponse.error("Error"), HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return new ResponseEntity<>(baseResponse, HttpStatus.OK);
    }

    @GetMapping("by-status")
    public ResponseEntity<?> findByStatus(@RequestParam Integer status, @ModelAttribute PageRequest pageRequest){
        BaseResponse baseResponse;
        try{
            baseResponse = baseServiceImpl.findByStatus(status, pageRequest);
        }catch (Exception ex){
            return new ResponseEntity<>(BaseResponse.error("Error"), HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return new ResponseEntity<>(baseResponse, HttpStatus.OK);
    }
}

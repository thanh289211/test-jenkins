package ${sourceInfo.packageName}.business.services.base.implement;

import ${sourceInfo.packageName}.business.entities.BaseEntity;
import ${sourceInfo.packageName}.business.repositories.BaseRepository;
import ${sourceInfo.packageName}.business.response.BaseResponse;
import ${sourceInfo.packageName}.business.services.base.BaseService;
import ${sourceInfo.packageName}.business.request.PageRequest;
import ${sourceInfo.packageName}.helpers.constants.BusinessConstants;
import lombok.Getter;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Component;

import java.io.Serializable;
import java.util.List;

@Getter
@Component
public abstract class BaseServiceImpl<T extends BaseEntity, ID extends Serializable> implements BaseService {
    private final BaseRepository<T, ID> baseRepository;
    protected BaseServiceImpl(BaseRepository<T, ID> baseRepository) {
        this.baseRepository = baseRepository;
    }

    @Override
    public BaseResponse findFirstByIdAndClientId(long id, long clientId) {
    T obj = baseRepository.findFirstByIdAndClientId(id, clientId);
    return BaseResponse.success(obj);
    }

    @Override
    public BaseResponse findAllByClientId(long clientId) {
    List<T> list = baseRepository.findAllByClientId(clientId);
        return BaseResponse.success(list);
    }

    @Override
    public BaseResponse findAllByClientId(long clientId, PageRequest pageRequest) {
        org.springframework.data.domain.PageRequest pageable = org.springframework.data.domain.PageRequest
                .of(pageRequest.getPageNumber() - 1, pageRequest.getPageSize(), Sort.by("id"));
        Page<T> page = baseRepository.findAllByClientId(clientId, pageable);
        return BaseResponse.success(new PageImpl<>(page.toList(), pageable, page.getTotalElements()));
    }

    @Override
    public BaseResponse findByClientIdAndStatus(long clientId, Integer status) {
        List<T> list = baseRepository.findByClientIdAndStatus(clientId, status);
        return BaseResponse.success(list);
    }

    @Override
    public BaseResponse findByClientIdAndStatus(long clientId, Integer status, PageRequest pageRequest) {
        org.springframework.data.domain.PageRequest pageable = org.springframework.data.domain.PageRequest
                .of(pageRequest.getPageNumber() - 1, pageRequest.getPageSize(), Sort.by("id"));
        Page<T> page = baseRepository.findByClientIdAndStatus(clientId, status, pageable);
        return BaseResponse.success(new PageImpl<>(page.toList(), pageable, page.getTotalElements()));
    }

    @Override
    public BaseResponse findByStatus(Integer status, PageRequest pageRequest) {
        org.springframework.data.domain.PageRequest pageable = org.springframework.data.domain.PageRequest
                 .of(pageRequest.getPageNumber() - 1, pageRequest.getPageSize(), Sort.by("id"));
        Page<T> page = baseRepository.findByStatus(status, pageable);
        return BaseResponse.success(new PageImpl<>(page.toList(), pageable, page.getTotalElements()));
    }

    @Override
    public BaseResponse findByDelete(Integer delete, PageRequest pageRequest){
         org.springframework.data.domain.PageRequest pageable = org.springframework.data.domain.PageRequest
                  .of(pageRequest.getPageNumber() - 1, pageRequest.getPageSize(), Sort.by("id"));
         Page<T> page = baseRepository.findByDelete(delete, pageable);
         return BaseResponse.success(new PageImpl<>(page.toList(), pageable, page.getTotalElements()));
    }

    @Override
    public BaseResponse deactive(long id) {
         T entity = findById(id);
         entity.setStatus(BusinessConstants.Status.DEACTIVE);
         baseRepository.save(entity);
         return BaseResponse.success(entity);
    }

    @Override
    public BaseResponse active(long id) {
         T entity = findById(id);
         entity.setStatus(BusinessConstants.Status.ACTIVE);
         baseRepository.save(entity);
         return BaseResponse.success(entity);
    }

    @Override
    public BaseResponse getById(long id) {
         return BaseResponse.success(findById(id));
    }

    @Override
    public BaseResponse delete(long id){
         T entity = findById(id);
         entity.setDelete(BusinessConstants.Delete.DELETE);
         baseRepository.save(entity);
         return BaseResponse.success("success");
    }

    protected T findById(long id){
         return baseRepository.findById(id);
    }
}

package ${sourceInfo.packageName}.business.services.base;

import ${sourceInfo.packageName}.business.request.PageRequest;
import ${sourceInfo.packageName}.business.response.BaseResponse;

public interface BaseService {
    BaseResponse findFirstByIdAndClientId(long id, long clientId);

    BaseResponse findAllByClientId(long clientId);

    BaseResponse findAllByClientId(long clientId, PageRequest pageRequest);

    BaseResponse findByClientIdAndStatus(long clientId, Integer status);

    BaseResponse findByClientIdAndStatus(long clientId, Integer status, PageRequest pageRequest);

    BaseResponse findByStatus(Integer status, PageRequest pageRequest);

    BaseResponse findByDelete(Integer delete, PageRequest pageRequest);

    BaseResponse deactive(long id);

    BaseResponse active(long id);

    BaseResponse getById(long id);

    BaseResponse delete(long id);
}

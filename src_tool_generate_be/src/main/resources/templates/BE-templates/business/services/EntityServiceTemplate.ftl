package ${sourceInfo.packageName}.business.services;

import ${sourceInfo.packageName}.business.request.SearchRequest;
import ${sourceInfo.packageName}.business.request.${entityInfo.className}Request;
import ${sourceInfo.packageName}.business.response.BaseResponse;

public interface ${entityInfo.className}Service {
    BaseResponse search(SearchRequest searchRequest);
    BaseResponse insert(${entityInfo.className}Request request);
    BaseResponse update(${entityInfo.className}Request request, long id);
}
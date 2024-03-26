package ${sourceInfo.packageName}.business.services.implement;


import ${sourceInfo.packageName}.business.entities.${entityInfo.className};
import ${sourceInfo.packageName}.business.repositories.${entityInfo.className}Repository;
import ${sourceInfo.packageName}.business.request.SearchRequest;
import ${sourceInfo.packageName}.business.request.${entityInfo.className}Request;
import ${sourceInfo.packageName}.business.response.BaseResponse;
import ${sourceInfo.packageName}.business.services.${entityInfo.className}Service;
import ${sourceInfo.packageName}.business.services.base.implement.BaseServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

@Service
public class ${entityInfo.className}ServiceImpl extends BaseServiceImpl<${entityInfo.className}, Long> implements ${entityInfo.className}Service {
    @Autowired
    public ${entityInfo.className}ServiceImpl(${entityInfo.className}Repository repository) {
        super(repository);
    }

    public BaseResponse search(SearchRequest request){
        org.springframework.data.domain.PageRequest pageable = org.springframework.data.domain.PageRequest.of(request.getPageNumber() - 1, request.getPageSize(), Sort.by("id"));
        Page<${entityInfo.className}> list = ((${entityInfo.className}Repository)getBaseRepository()).search(request.getValue(), pageable);
        return BaseResponse.success(new PageImpl<>(list.toList(), pageable, list.getTotalElements()));
    }

    public BaseResponse insert(${entityInfo.className}Request request){
        ${entityInfo.className} entity = new ${entityInfo.className}();
        <#list entityInfo.columns as column>
            <#if column.columnName != "id">
            entity.set${column.entityName?substring(0, 1)?upper_case}${column.entityName?substring(1)}(request.get${column.entityName?substring(0, 1)?upper_case}${column.entityName?substring(1)}());
            </#if>
        </#list>
        getBaseRepository().save(entity);
        return BaseResponse.success(entity);
    }

    public BaseResponse update(${entityInfo.className}Request request, long id){
       ${entityInfo.className} entity = findById(id);
       <#list entityInfo.columns as column>
           <#if column.columnName != "id">
           entity.set${column.entityName?substring(0, 1)?upper_case}${column.entityName?substring(1)}(request.get${column.entityName?substring(0, 1)?upper_case}${column.entityName?substring(1)}());
           </#if>
       </#list>
       getBaseRepository().save(entity);
       return BaseResponse.success(entity);
    }
}


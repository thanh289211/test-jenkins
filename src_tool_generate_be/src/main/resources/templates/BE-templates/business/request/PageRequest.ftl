package ${sourceInfo.packageName}.business.request;

import ${sourceInfo.packageName}.helpers.constants.SystemConstants;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PageRequest extends BaseRequest{
    private int pageSize = SystemConstants.DEFAULT_PAGE_SIZE;
    private int pageNumber = SystemConstants.DEFAULT_PAGE_NUMBER;
}
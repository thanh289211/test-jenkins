package ${sourceInfo.packageName}.business.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ${sourceInfo.packageName}.business.entities.${entityInfo.className};
import org.springframework.stereotype.Repository;

@Repository
public interface ${entityInfo.className}Repository extends BaseRepository<${entityInfo.className}, Long> {
    // Add custom query methods if needed
    // them search all find all
}

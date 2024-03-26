package ${sourceInfo.packageName}.business.repositories;

import ${sourceInfo.packageName}.business.entities.BaseEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.NoRepositoryBean;

import java.io.Serializable;
import java.util.List;

@NoRepositoryBean
public interface BaseRepository<T extends BaseEntity, ID extends Serializable>
    extends JpaRepository<T, ID> {
    T findFirstByIdAndClientId(long id, long clientId);

    T findById(long id);

    List< T > findAllByClientId(long clientId);

    Page<T> findAllByClientId(long clientId, Pageable pageable);

    List<T> findByClientIdAndStatus(long clientId, Integer status);

    Page<T> findByClientIdAndStatus(long clientId, Integer status, Pageable pageable);

    Page<T> findByStatus(Integer status, Pageable pageable);

    Page<T> findByDelete(Integer delete, Pageable pageable);
}
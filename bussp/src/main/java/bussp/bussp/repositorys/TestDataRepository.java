package bussp.bussp.repositorys;

import org.springframework.data.jpa.repository.JpaRepository;

import bussp.bussp.domain.entity.TestData;

public interface TestDataRepository extends JpaRepository<TestData, Long> {
    
}

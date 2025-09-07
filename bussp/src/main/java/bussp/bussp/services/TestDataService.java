package bussp.bussp.services;

import java.util.List;

import bussp.bussp.domain.dto.TestDataDTO;
import bussp.bussp.domain.entity.TestData;

public interface TestDataService {
    List<TestData> findAll();

    public TestData save(TestDataDTO dto);
}

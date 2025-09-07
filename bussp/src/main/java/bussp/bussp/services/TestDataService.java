package bussp.bussp.services;

import java.util.List;

import bussp.bussp.domain.entity.TestData;

public interface TestDataService {
    List<TestData> findAll();
}

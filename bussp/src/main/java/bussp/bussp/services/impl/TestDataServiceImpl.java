package bussp.bussp.services.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import bussp.bussp.domain.entity.TestData;
import bussp.bussp.repositorys.TestDataRepository;
import bussp.bussp.services.TestDataService;

@Service
public class TestDataServiceImpl implements TestDataService {

    private final TestDataRepository repository;

    public TestDataServiceImpl(TestDataRepository repository) {
        this.repository = repository;
    }

    @Override
    public List<TestData> findAll() {
        return repository.findAll();
    }
}
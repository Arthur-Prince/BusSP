package bussp.bussp.services.impl;

import java.time.OffsetDateTime;
import java.util.List;

import org.springframework.stereotype.Service;

import bussp.bussp.domain.dto.TestDataDTO;
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

    @Override
    public TestData save(TestDataDTO dto) {
        TestData entity = new TestData();
        entity.setName(dto.getName());
        entity.setCreatedAt(OffsetDateTime.now());
        System.out.println(entity);
        return repository.save(entity);
    }
}
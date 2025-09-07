package bussp.bussp.controllers;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import bussp.bussp.domain.entity.TestData;
import bussp.bussp.services.TestDataService;

@RestController
public class TestController {

    private final TestDataService service;

    public TestController(TestDataService service) {
        this.service = service;
    }

    @GetMapping("/getalltest")
    public List<TestData> getAllTest() {
        return service.findAll();
    }

    @GetMapping("/test")
    public String testEndpoint() {
        return "✅ Backend is running!";
    }
}

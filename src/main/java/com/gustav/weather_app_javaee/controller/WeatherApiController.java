package com.gustav.weather_app_javaee.controller;

import com.gustav.weather_app_javaee.dto.WeatherDTO;
import com.gustav.weather_app_javaee.model.WeatherEntity;
import com.gustav.weather_app_javaee.service.WeatherApiService;
import com.gustav.weather_app_javaee.service.WeatherService;
import io.github.resilience4j.ratelimiter.annotation.RateLimiter;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import reactor.core.publisher.Mono;

@RestController
@RequestMapping("/api/v1")
public class WeatherApiController {

    private final WeatherApiService weatherApiService;
    private final WeatherService weatherService;

    public WeatherApiController(WeatherApiService weatherApiService, WeatherService weatherService) {
        this.weatherApiService = weatherApiService;
        this.weatherService = weatherService;
    }

    @GetMapping("/fetch/{city}")
    @RateLimiter(name = "rateLimiter")
    public Mono<ResponseEntity<WeatherDTO>> fetchWeatherByName(@PathVariable String city) {
        return weatherApiService.getWeatherFromExternalApi(city)
                .map(ResponseEntity::ok)
                .defaultIfEmpty(ResponseEntity.status(HttpStatus.NOT_FOUND).build())
                .doOnError(error -> System.out.println("Error fetching weather data: " + error.getMessage()));
    }

    @PostMapping("/fetch-and-save/{city}")
    @RateLimiter(name = "rateLimiter")
    public Mono<WeatherDTO> fetchWeatherData(@PathVariable String city) {
        return weatherApiService.getWeatherFromExternalApi(city)
                .doOnSuccess(weatherDTO -> weatherService.addWeather(city, weatherDTO))
                .doOnError(error -> System.out.println("Error fetching weather data: " + error.getMessage()));
    }

    @PutMapping("/update/{id}/{city}")
    @RateLimiter(name = "rateLimiter")
    public Mono<ResponseEntity<WeatherEntity>> updateWeather(@PathVariable Long id, @PathVariable String city) {
        return weatherApiService.getWeatherFromExternalApi(city)
                .flatMap(weatherDTO -> {
                    WeatherEntity updatedWeather = weatherService.updateWeather(id, weatherDTO);

                    if (updatedWeather == null) {
                        return Mono.just(
                                ResponseEntity
                                        .status(HttpStatus.NOT_FOUND)
                                        .<WeatherEntity>build()
                        );
                    }
                    return Mono.just(ResponseEntity.ok(updatedWeather));
                })
                .defaultIfEmpty(ResponseEntity.status(HttpStatus.NOT_FOUND).<WeatherEntity>build())
                .doOnError(error -> System.out.println("Error updating weather data: " + error.getMessage()));
    }

}

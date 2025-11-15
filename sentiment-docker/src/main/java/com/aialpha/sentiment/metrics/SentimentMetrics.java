package com.aialpha.sentiment.metrics;

import io.micrometer.core.instrument.*;

import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;

import org.springframework.stereotype.Component;

@Component
public class SentimentMetrics {

    private final MeterRegistry meterRegistry;
    private final AtomicInteger companiesDetectedGauge;


    // Constructor injection of MeterRegistry
    public SentimentMetrics(MeterRegistry meterRegistry) {
        this.meterRegistry = meterRegistry;
    

        // Guage for detected company
        this.companiesDetectedGauge = new AtomicInteger(0);
        Gauge.builder("sentiment.companies.detected", companiesDetectedGauge, AtomicInteger::get)
            .description("Number of companies detected in the last sentiment analysis request")
            .register(meterRegistry);
        
    }

    /**
     * Example implementation: Counter for sentiment analysis requests
     * This counter tracks the total number of sentiment analyses by sentiment type and company
     */
    public void recordAnalysis(String sentiment, String company) {
        Counter counter = Counter.builder("sentiment.analysis.total")
                .tag("sentiment", sentiment)
                .tag("company", company)
                .description("Total number of sentiment analysis requests")
                .register(meterRegistry);

        counter.increment();
    }

    public void recordDuration(long milliseconds, String company, String model) {
        // TODO: Record timer
        Timer timer = Timer.builder("sentiment.api.latency")
                            .description("Latency of sentiment analysis API calls in milliseconds")
                            .tag("company", company)
                            .tag("model", model) // ex:nova-micro
                            .register(meterRegistry);     
        
        timer.record(milliseconds, TimeUnit.MILLISECONDS);
    }

    public void recordCompaniesDetected(int count) {
        // TODO: Update gauge
        companiesDetectedGauge.set(count);
    }

    public void recordConfidence(double confidence, String sentiment, String company) {
        // TODO: Record distribution summary
        DistributionSummary summary = DistributionSummary.builder("sentiment.confidence.distribution")
                                                        .description("Distribution of confidence scores for sentiment analysis")
                                                        .tag("sentiment", sentiment)
                                                        .tag("company", company)
                                                        .baseUnit("score")
                                                        .register(meterRegistry);
        
        summary.record(confidence);
    }
}

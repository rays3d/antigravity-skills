---
name: laravel-job-generator
description: "Scaffold queued Laravel 13 jobs implementing ShouldQueue, PHP 8.5 property promotion, and service injection in handle()."
---

# Laravel Job Generator

## Rules

- Generate jobs in `app/Jobs`.
- Implement `ShouldQueue`.
- Use:
  - `Dispatchable`
  - `InteractsWithQueue`
  - `Queueable`
  - `SerializesModels`
- Use constructor property promotion for job payload.
- Inject services into `handle()`, not the constructor.
- Wrap business logic in `try/catch`.
- Log job start, completion, and failures using project logging conventions.
- Keep jobs orchestration-only; move business logic to Services.

## Optional

- Ask before adding custom retry logic (`$tries`, `backoff`, `release()`).

## Trigger

> "Create a job for ..."
> "/job <JobName>"

## Reference Template

Use the following exact structure when generating new Jobs. Replace the placeholders appropriately.

```php
<?php

namespace App\Jobs;

use Exception;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Log;

// Replace target services if needed
use App\Services\YourService;

class {{JobName}} implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    /**
     * Create a new job instance.
     */
    public function __construct(
        public string $someParameter // Use PHP 8 Constructor Property Promotion
    ) {}

    /**
     * Execute the job.
     * Service injection occurs here, not in the constructor.
     */
    public function handle(YourService $yourService): void
    {
        try {
            Log::info("Starting {{JobName}} for: {$this->someParameter}");

            // TODO: Execute service logic
            // $yourService->processSomething($this->someParameter);

            Log::info("{{JobName}} completed for: {$this->someParameter}");
        } catch (Exception $e) {
            Log::error("{{JobName}} failed: " . $e->getMessage());

            // Optionally release the job back to the queue to retry
            // $this->release(60);
        }
    }
}
```

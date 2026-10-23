---
name: laravel-mailable-generator
description: "Scaffold queued Laravel Mailables implementing ShouldQueue, Envelope, and Content conventions."
---

# Laravel Mailable Generator

## Rules

- Generate mailables in `app/Mail`.
- Implement `ShouldQueue`.
- Use `Queueable` and `SerializesModels`.
- Use constructor property promotion for injected data.
- Use `Envelope` and `Content` APIs.
- Email subjects must use `App\Constants\ApiMessages`; never hardcode strings.
- Use Blade views under `resources/views/emails/`.
- Pass data through `Content::with`.
- If a subject constant doesn't exist, add it to `ApiMessages`.
- Add mail middleware only when explicitly requested.

## Trigger

> "Create a mailable for ..."
> "/mailable <Name>"

## Reference Template

```php
<?php

namespace App\Mail;

use App\Constants\ApiMessages;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
// use Illuminate\Queue\Middleware\RateLimited;
use Illuminate\Queue\SerializesModels;

// use App\Models\SomeModel;

class {{MailableName}} extends Mailable implements ShouldQueue
{
    use Queueable, SerializesModels;

    /**
     * Create a new message instance.
     */
    public function __construct(
        // public SomeModel $model,
        // public string $someString,
    ) {}

    /**
     * Get the message envelope.
     */
    public function envelope(): Envelope
    {
        return new Envelope(
            subject: ApiMessages::SUBJECT_{{YOUR_UPPER_SNAKE_CASE_SUBJECT_VAR}},
        );
    }

    /**
     * Get the message content definition.
     */
    public function content(): Content
    {
        return new Content(
            view: 'emails.{{folder}}.{{name}}',
            with: [
                // 'model' => $this->model,
                // 'extraData' => $this->someString,
            ],
        );
    }

    /* Optional:
    public function middleware(): array
    {
        return [new RateLimited('auth-email')];
    }
    */
}
```

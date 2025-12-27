# Introduction to Temporal

**Date:** 2025-12-27  
**Category:** temporal

## Context
https://github.com/temporalio/temporal

### What is Temporal and why do you need it ?
Temporal is a run time to *manage distributed application state* at scale. It is useful when we want to run workflows (long or short) that is reliable, scalable and resistent to failures.

Modern application architectures are powerful but challenging. Large scale distributed systems has a lot of microservices, where services continuously talk to each other. Things might fail at any step/service of the workflow to complete a signle task.

For example:

1. You are running a workflow / job where you need to query the DB to get some data, process it and submit to another workflow. But what if the database is unavailable / offline. What do you do ??
2. Same as example #1, but now an external API query is failing because that service is down !! What will you do ??
    - yes you can retry and wait for it to come. But will you keep writing retry logic continously across multiple services ? Bad developer experience, ryt ?
    - Will the workflow timeout and fail ? what if you do not want to fail and will retry with larger waits ?
3. And even when things are ryt (without failures); for long running processes taking hours, how do you observe the state of the workflows ?

Handling above correctly for large scale systems affect developer productivity, and complexity increases while reliability decreases (failure-prone)

Temporal abstracts the complexities around retries, managing queues, rollbacks, state machines, timers etc. It has SDK libraies to handle these scenarios and write workflows as code in a more easier, efficient manner.

### Example
Let's see a simple transaction usecase with temporal.

```python
# Pseudo code example: Simple payment processing workflow

@workflow.defn
class PaymentWorkflow:
    @workflow.run
    async def run(self, payment_data: PaymentData) -> PaymentResult:
        # Step 1: Validate payment (activity)
        validation_result = await workflow.execute_activity(
            validate_payment,
            payment_data,
            start_to_close_timeout=timedelta(seconds=30)
        )
        
        if not validation_result.is_valid:
            return PaymentResult(success=False, error="Invalid payment")
        
        # Step 2: Process payment (activity with retry)
        payment_result = await workflow.execute_activity(
            process_payment,
            payment_data,
            start_to_close_timeout=timedelta(minutes=5),
            retry_policy=RetryPolicy(
                maximum_attempts=3,
                initial_interval=timedelta(seconds=1)
            )
        )
        
        # Step 3: Send confirmation (activity)
        await workflow.execute_activity(
            send_confirmation_email,
            payment_result.confirmation_id,
            start_to_close_timeout=timedelta(seconds=10)
        )
        
        return PaymentResult(success=True, transaction_id=payment_result.id)

# Activities (actual work that can fail)
@activity.defn
async def validate_payment(payment_data: PaymentData) -> ValidationResult:
    # Check payment details, card validity, etc.
    # This can fail if external service is down
    pass

@activity.defn
async def process_payment(payment_data: PaymentData) -> PaymentResult:
    # Charge the card, update database
    # Temporal will automatically retry if this fails
    pass
```

## References

- [Youtube - Getting to know Temporal](https://www.youtube.com/watch?v=wIpz4ioK0gI)
- [Youtube - Temporal in 7 minutes](https://www.youtube.com/watch?v=2HjnQlnA5eY&list=PLl9kRkvFJrlQ33RWSj12U3JshJ9kouaTn&index=2)


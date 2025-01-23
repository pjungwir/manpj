See the queues:

```
Sidekiq::Queue.all
Sidekiq::Queue.new("foo").size
```

Retries:

```
rs = Sidekiq::RetrySet.new
rs.size
rs.clear
```

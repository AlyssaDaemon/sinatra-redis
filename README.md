# Sinatra-redis

Dead simple redis module for Sinatra

```
require "sinatra-redis"
require "sinatra/base"

class SinatraRedisExample < Sinatra::Base
  register Sinatra::Redis

  set :redis_url, "redis://localhost:6379" # You don't have to set either, but for completion sake
  set :redis_pool_size, 5

  get "/" do
    @val = redis.get("LastVisit")
    redis.set("LastVisit", Time.now.to_i)
    "Last Visit was at #{Time.at(Integer(@val)) rescue 'Never'}"
  end

end

SinatraRedisExample.run!
```
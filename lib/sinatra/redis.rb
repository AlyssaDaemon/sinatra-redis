#
# -*- coding: utf-8 -*-
# Copyright (c) 2016 Alyssa Herzog <AlyssaDaemon@gmail.com>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense,   and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
# Sinatra::Redis
require 'sinatra/base'
require 'redis/pool'

module Sinatra
  module Redis

    module Helpers
      def redis
        @redis ||= ::Redis::Pool.new( :url => settings.redis_url, :pool => settings.redis_pool_size )
      end
    end

    def self.registered(app)
      app.helpers Redis::Helpers
      app.set :redis_url, "redis://localhost:6379" if !defined?(app.settings.redis_url)
      app.set :redis_pool_size, 5 if !defined?(app.settings.redis_pool_size)
    end


  end
  register Redis
end

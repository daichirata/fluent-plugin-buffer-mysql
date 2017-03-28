require 'fluent/buffer'

module Fluent
  class MysqlBufferChunk < BufferChunk
    def initialize(key, data='')
      super
    end

    def <<(data)
      raise NotImplementedError, "Implement this method in child class"
    end

    def size
      raise NotImplementedError, "Implement this method in child class"
    end

    def close
      raise NotImplementedError, "Implement this method in child class"
    end

    def purge
      raise NotImplementedError, "Implement this method in child class"
    end

    def read
      raise NotImplementedError, "Implement this method in child class"
    end

    def open
      raise NotImplementedError, "Implement this method in child class"
    end
  end

  class MysqlBuffer < BasicBuffer
    Fluent::Plugin.register_buffer('mysql', self)

    config_param :host, :string, default: 'localhost'
    config_param :port, :integer, default: 3306
    config_param :username, :string, default: 'root'
    config_param :password, :string, default: nil, secret: true
    config_param :database, :string, default: nil
    config_param :encoding, :string, default: 'utf8'

    config_param :database, :string, default: nil

    config_param :query, :string
    config_param :prepared_query, :string, :default => nil
    config_param :primary_key, :string, :default => 'id'
    config_param :interval, :string, :default => '1m'
    config_param :enable_delete, :bool, :default => true
    config_param :tag, :string, :default => nil


    def initialize
      super
    end

    def configure(conf)
      super
    end

    def start
      # TODO: connect
      # TODO: create table
    end

    def shutdown
    end

    def before_shutdown(out)
    end

    def new_chunk(key)
      raise NotImplementedError, "Implement this method in child class"
    end

    def resume
      raise NotImplementedError, "Implement this method in child class"
    end

    # enqueueing is done by #push
    # this method is actually 'enqueue_hook'
    def enqueue(chunk)
      raise NotImplementedError, "Implement this method in child class"
    end
  end
end

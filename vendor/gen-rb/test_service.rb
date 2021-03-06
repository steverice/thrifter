#
# Autogenerated by Thrift Compiler (0.9.2)
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#

require 'thrift'
require 'test_types'

module TestService
  class Client
    include ::Thrift::Client

    def echo(message)
      send_echo(message)
      return recv_echo()
    end

    def send_echo(message)
      send_message('echo', Echo_args, :message => message)
    end

    def recv_echo()
      result = receive_message(Echo_result)
      return result.success unless result.success.nil?
      raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'echo failed: unknown result')
    end

    def onewayEcho(message)
      send_onewayEcho(message)
    end

    def send_onewayEcho(message)
      send_oneway_message('onewayEcho', OnewayEcho_args, :message => message)
    end
  end

  class Processor
    include ::Thrift::Processor

    def process_echo(seqid, iprot, oprot)
      args = read_args(iprot, Echo_args)
      result = Echo_result.new()
      result.success = @handler.echo(args.message)
      write_result(result, oprot, 'echo', seqid)
    end

    def process_onewayEcho(seqid, iprot, oprot)
      args = read_args(iprot, OnewayEcho_args)
      @handler.onewayEcho(args.message)
      return
    end

  end

  # HELPER FUNCTIONS AND STRUCTURES

  class Echo_args
    include ::Thrift::Struct, ::Thrift::Struct_Union
    MESSAGE = 1

    FIELDS = {
      MESSAGE => {:type => ::Thrift::Types::STRUCT, :name => 'message', :class => ::TestMessage}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class Echo_result
    include ::Thrift::Struct, ::Thrift::Struct_Union
    SUCCESS = 0

    FIELDS = {
      SUCCESS => {:type => ::Thrift::Types::STRUCT, :name => 'success', :class => ::TestMessage}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class OnewayEcho_args
    include ::Thrift::Struct, ::Thrift::Struct_Union
    MESSAGE = 1

    FIELDS = {
      MESSAGE => {:type => ::Thrift::Types::STRUCT, :name => 'message', :class => ::TestMessage}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class OnewayEcho_result
    include ::Thrift::Struct, ::Thrift::Struct_Union

    FIELDS = {

    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

end


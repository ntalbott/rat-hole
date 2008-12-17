require 'net/http'
require 'rubygems'
require 'rack'
require 'delegate'
require 'util'

class RatHole

  VERSION = '0.1.0'

  def initialize(host)
    @host = host
  end

  def process_user_request(rack_request)
    rack_request
  end

  def process_server_response(rack_response)
    rack_response
  end

  def call(env)
    Net::HTTP.start(@host) do |http|
      http.instance_eval{@socket = MethodSpy.new(@socket){|method| method =~ /write/}} if $DEBUG

      env.delete('HTTP_ACCEPT_ENCODING')
      source_request = process_user_request(Rack::Request.new(env))
      source_headers = request_headers(source_request.env)

      if source_request.get?
        response = http.get(source_request.path_info, source_headers)
      elsif source_request.post?
        post = Net::HTTP::Post.new(source_request.path_info, source_headers)
        class << post
          include HTTPHeaderPatch
        end
        post.form_data = source_request.POST
        response = http.request(post)
      end

      code = response.code.to_i
      headers = response.to_hash
      body = response.body || ''
      headers.delete('transfer-encoding')

      process_server_response(Rack::Response.new(body, code, headers)).finish
    end
  end

  def request_headers(env)
    env.select{|k,v| k =~ /^HTTP/}.inject({}) do |h, e|
      k,v = e
      h.merge(k.split('_')[1..-1].join('-').to_camel_case => v)
    end
  end
end

# This class simply extends RatHole and does nothing.
# It's only useful for making sure that you have everything hooked up correctly.
class EmptyRatHole < RatHole
end

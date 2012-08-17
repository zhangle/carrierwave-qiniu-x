# encoding: utf-8
require "rubygems"
require "rspec"
require "rspec/autorun"
require "rails"
require "active_record"
require "carrierwave"
require "carrierwave/orm/activerecord"
require "carrierwave/processing/mini_magick"

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__),"..","lib"))

require "carrierwave-qiniu"

module Rails
  class <<self
    def root
      [File.expand_path(__FILE__).split('/')[0..-3].join('/'),"spec"].join("/")
    end
  end
end

ActiveRecord::Migration.verbose = false

# 测试的时候需要修改这个地方
::CarrierWave.configure do |config|
  config.storage             = :qiniu
  config.qiniu_access_key    = "fR8TmveK4Eon_9te76mGyLKyC7I0JFwqBr6tVFdp"
  config.qiniu_secret_key    = 'OhEs7BQAGMxoktRHvv1aNrxvosoM4C44cF6pmaMp'
  config.qiniu_bucket        = "spec-test"
  config.qiniu_bucket_domain = "carrierwave-qiniu-example.aspxboy.com"
end

def load_file(fname)
  File.open([Rails.root,fname].join("/"))
end
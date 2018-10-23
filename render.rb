#!/usr/bin/env ruby
require 'bundler'
Bundler.require

Consult.load config_dir: './'
Consult.render!

system 'cat demo-output.yml'

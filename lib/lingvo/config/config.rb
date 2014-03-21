require 'fileutils'
require 'yaml'


module Lingvo
  module Config
    class << self
      attr_accessor :notify, :gui
    end

    LINGVO_DIR = File.expand_path('../..', __FILE__)

    DEFAULT_CONFIG = "#{LINGVO_DIR}/config/default.yaml"
    DEFAULT_IMG = "#{LINGVO_DIR}/gui/img/eng.png"

    BASE_DIR = File.join Dir.home, '.lingvo'
    DB_FILE = File.join BASE_DIR, 'english_words.sqlite3'
    CUSTOM_CONFIG = File.join BASE_DIR, 'config.yaml'

    $stderr = File.open File.join(BASE_DIR + 'app.log'), 'w'

    unless File.exists? BASE_DIR
      FileUtils.mkdir BASE_DIR, mode: 0755
    end

    unless File.exists? DB_FILE
      FileUtils.touch DB_FILE
      FileUtils.chmod 0755, DB_FILE
    end

    unless File.exists? CUSTOM_CONFIG
      FileUtils.cp DEFAULT_CONFIG, CUSTOM_CONFIG
      FileUtils.chmod 0755, CUSTOM_CONFIG
    end

    default_config = YAML.load_file DEFAULT_CONFIG
    custom_config = YAML.load_file CUSTOM_CONFIG

    default_config['gui']['image'] = DEFAULT_IMG
    default_config['notify']['image'] = DEFAULT_IMG

    @gui = {}
    default_config['gui'].map do |key, val|
      @gui[key.to_sym] = custom_config['gui'][key] || val
    end

    @notify = {}
    default_config['notify'].map do |key, val|
      @notify[key.to_sym] = custom_config['notify'][key] || val
    end
  end
end

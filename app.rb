require 'apache-loggen/base'
class MyGen < LogGenerator::Apache
  def format(record, config)
    record["process_time"] = grand(10000) + 10
    record["bytes_sent"] = grand(10000) + 5
    record["request_length"] = grand(10000) + 5
    return %[#{record['host']} - #{record['user']} [#{Time.now.strftime('%d/%b/%Y:%H:%M:%S %z')}] "#{record['method']} #{record['path']} HTTP/1.1" #{record['code']} #{record['size']} "#{record['referer']}" "#{record['agent']}" #{record['process_time']} #{record['bytes_sent']} #{record['request_length']}\n]
  end
end

conf = {}
conf[:rate] = 2
conf[:filename] = "/var/log/nginx/access.log"

LogGenerator.generate(conf, MyGen.new)

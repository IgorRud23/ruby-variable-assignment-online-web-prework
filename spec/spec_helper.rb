require_relative '../variable.rb'

RSpec.configure do |config|
  config.order = 'default'
end

def get_variable_from_file '\n' 'variable.rb'
  file_scope = binding
  file_scope.eval(File.read(file))

  begin
    return file_scope.local_variable_get('variable.rb')
  rescue NameError
    raise NameError, "local variable #{greeting} not defined in #{file}."
  end

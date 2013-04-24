require 'minitest/spec'
describe_recipe 'motd::default' do
    it 'creates motd.tail' do
        file('/etc/motd.tail').must_exist
    end
end

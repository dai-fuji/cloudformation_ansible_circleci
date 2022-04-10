require 'spec_helper'

describe command('date') do
  its(:stdout) { should match /JST/ }
end

describe user('ec2-user') do
  it { should exist }
end

packages = ["git","make","gcc-c++","patch","libyaml-devel","libffi-devel","libicu-devel","zlib-devel","readline-devel","libxml2-devel","ImageMagick","ImageMagick-devel","libxslt-devel","openssl-devel","libcurl","libcurl-devel","curl"]
packages.each do |pkgs|
  describe package(pkgs) do
    it { should be_installed }
  end
end

describe port(80) do
  it { should be_listening }
end

describe port(22) do
  it { should be_listening }
end






require 'spec_helper'
describe 'catfacts' do

  context 'with defaults for all parameters' do
    it { should contain_class('catfacts') }
  end
end

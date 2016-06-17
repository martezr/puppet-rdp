require 'spec_helper'
describe 'rdp', :type => :class do
  context 'with the default parameters' do
    it { should compile.with_all_deps }
    it { should contain_class('rdp')}
  end

  context 'with default parameters on windows' do
    let(:facts) { { :kernel => 'windows' } }
    it { should contain_registry_value('rdp')}
    it { should contain_registry_value('rdp_nla')}
    it { should contain_windows_firewall_exception('rdp_firewall')}
  end
  
  context 'On a non-windows OS' do
    let(:facts) { { :kernel => 'Linux' } }
    it { expect { should raise_error(Puppet::Error) }}
  end
end

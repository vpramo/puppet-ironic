require 'spec_helper'

describe 'ironic::db::sync' do

  context 'with default' do
    it { should contain_exec('ironic_db_sync').with(
      :command   => 'ironic-dbsync',
      :user      => 'ironic',
      :onlyif    => 'ironic-dbsync version | grep None',
      :path      => '/usr/bin:/bin:/usr/local/bin',
      :require   => 'User[ironic]'
    )}
  end
end

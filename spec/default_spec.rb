require 'spec_helper'

shared_examples "slack" do |platform, version|
  context "slack::default on #{platform} #{version}" do
    let(:recipe) {"slack::default"}
    let(:runner) do
      ChefSpec::SoloRunner.new(platform: platform, version: version)
    end

    it 'installs version 0.0.5 of the slack gem' do
      runner.node.set['slack']['should_require_slackr'] = false

      expect(runner.converge(recipe)).to install_chef_gem('slackr').with(version: '0.0.5')
    end

    it 'enables compilation of gem during instatiation' do
      runner.node.set['slack']['should_require_slackr'] = false
      expect(Chef::Resource::ChefGem).to receive(:instance_methods).with(false) {[:compile_time]}

      expect(runner.converge(recipe)).to install_chef_gem('slackr').with(compile_time: true)
    end

    it 'fatally logs if slackr gem is unable to load' do
      expect(Chef::Log).to receive(:fatal).with("Slackr gem load error.")

      runner.converge(recipe)
    end
  end
end

describe 'slack::default' do
  PLATFORMS.each do |platform, versions|
    versions.each do |version|
      include_examples "slack", platform, version
    end
  end
end

require "spec_helper"

describe Coss::Style::Component do
  let(:structure) { Coss::Structure.new }
  before do
   Coss::Style.configure { |config| config.css_path = 'spec/fixtures/coss_folder' }
   structure.create
  end
  describe '#create' do
    subject { described_class.new('sidebar-login', :sass) }
    it 'creates an empty file' do
      subject.create
      file = subject.path + 'sidebar-login.sass'
      exists = File.exist?(file)
      expect(exists).to be_truthy
    end
  end
end

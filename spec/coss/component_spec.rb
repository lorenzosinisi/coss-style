require "spec_helper"

describe Coss::Style::Component do
  let(:structure) { Coss::Structure.new }
  before(:each) do
   Coss::Style.configure { |config| config.css_path = 'spec/fixtures/coss_folder' }
   structure.create
  end

  describe '#create' do
    subject { described_class.new('sidebar-login', :sass) }
    it 'creates a file' do
      subject.create
      file = subject.path + 'sidebar-login.sass'
      exists = File.exist?(file)
      expect(exists).to be_truthy
    end
    it 'the file starts with the name of the component' do
      subject.create
      file = subject.path + 'sidebar-login.sass'
      expect(File.read(file)).to eq('.sidebar-login')
    end
  end

  describe '#exists?' do
    subject { described_class.new('sidebar-login', :sass) }
    it 'is true when a file is present' do
      subject.create
      expect(subject.exists?).to be_truthy
    end
    it 'is false when a file is present' do
      system('rm', '-r', structure.absolute_path)
      expect(subject.exists?).to be_falsey
    end
  end
end

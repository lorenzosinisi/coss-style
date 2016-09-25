require "spec_helper"

describe Coss::Structure do

  before do
   Coss::Style.configure { |config| config.css_path = './fixtures/coss_folder' }
  end

  it "has the configuration set" do
    expect(Coss::Style.configuration.css_path).to eq('./fixtures/coss_folder')
  end

  it "has a folder structure as constant" do
    expect(Coss::Structure::FOLDER).not_to be(nil)
  end

  it "the folder structure is an Array" do
    expect(Coss::Structure::FOLDER).to be_a(Array)
  end

  describe 'initialize' do
    before do
      Coss::Style.configure { |config| config.css_path = './coss_folder' }
    end
    context 'with configs' do
      let(:structure) { Coss::Structure.new('spec/fixtures') }
      it 'has a base path set' do
        expect(structure.base_path).to eq('spec/fixtures')
      end
      it 'has a full_path set' do
        expect(structure.full_path).to eq('spec/fixtures/coss_folder')
      end
      it 'has an absolute_path set' do
        expect(structure.absolute_path).to include('coss-style/spec/fixtures/coss_folder')
      end
    end
    context 'withoud configs' do
      before do
        Coss::Style.configure { |config| config.css_path = nil }
      end
      let(:subject) { Coss::Structure.new(nil) }
      it 'should raise an error' do
        expect {
          subject
        }.to raise_error(RuntimeError, 'base_path must be set')
      end
    end
  end

  describe '#create' do
    let(:structure) { Coss::Structure.new('spec/fixtures') }
    before do
      Coss::Style.configure { |config| config.css_path = './coss_folder' }
    end
    it "should create the folder structure" do
      expect(structure.create).to be(true)
    end
  end

  describe '#test_files' do
    let(:structure) { Coss::Structure.new('spec') }
    before do
      system('rm', '-r', structure.absolute_path)
      Coss::Style.configure { |config| config.css_path = './coss_folder' }
    end

    context 'without files' do
      it "should create the folder structure" do
        s = Coss::Structure.new('spec/fixtures')
        s.test_files
        expect(s.files_missing).
        to eq({
          :files => [:"style.sass"], 
          :folders => [:components, :mixins, :variables]
          })
      end
    end

    context 'with files' do
    end

  end
end

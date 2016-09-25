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

  describe '#files_missing' do
    let(:structure) { Coss::Structure.new('spec/fixtures') }
    before do
      Coss::Style.configure { |config| config.css_path = './coss_folder' }
    end

    context 'without files' do
      it "should create the folder structure" do
        system('rm', '-r', structure.absolute_path)
        expect(structure.files_missing).
        to eq({
          :files => [:"style.sass"], 
          :folders => [:components, :mixins, :variables]
          })
      end
    end

    context 'with files' do
      it "should return an empty hash" do
        structure.create
        expect(structure.files_missing).
        to eq({
          :files => [], 
          :folders => []
          })
      end
    end

  end

  describe '#explain' do
    let(:structure) { Coss::Structure.new('spec/fixtures') }
    it 'should print the structure of a COSS project' do
      expect(structure.explain).to eq('The structure of files in COSS should be components, mixins, variables, style.sass')
    end
  end 
end

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
    before do
      Coss::Style.configure { |config| config.css_path = './coss_folder' } 
    end
    let(:structure) { Coss::Structure.new('spec/fixtures') }

    it "should create the folder structure" do
      expect(structure.create.to_s).to_not be_nil
    end
  end
end

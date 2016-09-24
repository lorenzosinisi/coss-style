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

  it "the folder structure is an hash" do
    expect(Coss::Structure::FOLDER).to be_a(Hash)
  end

  describe 'initialize' do
    context 'with configs' do
      it 'has a base path set'
      it 'has a full_path set'
    end
    context 'withoud configs' do
      it 'should raise an error'
    end
  end

  describe '#create' do
    it "should create the folder structure" do
    end
  end
end

require "spec_helper"

describe Coss::Structure do
  
  before do
   Coss::Style.configure { |config| config.css_path = 'fixtures/coss_folder' }
  end

  it "has the configuration set" do
    expect(Coss::Style.configuration.css_path).to eq('fixtures/coss_folder')
  end

  it "has a folder structure as constant" do
    expect(Coss::Structure::FOLDER).not_to be(nil)
  end

  it "the folder structure is an hash" do
    expect(Coss::Structure::FOLDER).to be_a(Hash)
  end

end

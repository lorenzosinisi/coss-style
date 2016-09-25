require "spec_helper"

describe Coss::Style::Configuration do
  
  context 'with a configuration' do
    before do
     Coss::Style.configure do |config| 
        config.css_path    = 'spec/fixtures/coss_folder'
        config.strict_mode = true
        config.extras      = { something: true }
      end
    end
    
    it "has the css_path set" do
      expect(Coss::Style.configuration.css_path).to eq('spec/fixtures/coss_folder')
    end

    it "has the strict_mode set" do
      expect(Coss::Style.configuration.strict_mode).to be_truthy
    end

    it "has the coss_configs set" do
      expect(Coss::Style.configuration.extras).to eq({ something: true })
    end

  end

end

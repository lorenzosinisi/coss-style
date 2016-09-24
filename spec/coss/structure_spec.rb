require "spec_helper"

describe Coss::Structure do
  it "has a folder structure as constant" do
    expect(Coss::Structure::FOLDER).not_to be(nil)
  end

  it "the folder structure is an hash" do
    expect(Coss::Structure::FOLDER).to be_a(Hash)
  end

end

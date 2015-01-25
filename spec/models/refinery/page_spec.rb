require "spec_helper"

module Refinery
  describe Page, type: :feature do

    subject { Page.create title: "wymiframe" }
    it "treats wymiframe as a reserved word" do
      expect(subject.url[:path]).to eq(["wymiframe-page"])
    end

  end
end

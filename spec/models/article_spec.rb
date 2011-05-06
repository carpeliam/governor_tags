require 'spec_helper'

describe Article do
  let (:article) { Factory(:article, :author => Factory(:user)) }
  it "can accept a list of tags" do
    expect {
      article.tag_list = 'i fell in love again, all things go, all things go'
      article.save
    }.to change{Tag.count}.from(0).to(2)
    article.tags.map(&:name).should == ['i fell in love again', 'all things go']
  end
  
  it "displays the list of tags" do
    article.tags = [Tag.create(:name => 'kicking ass'), Tag.create(:name => 'chewing bubblegum')]
    article.save
    article.tag_list.should == 'kicking ass,chewing bubblegum'
  end
end

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
  
  it "trims blank tags" do
    expect {
      article.tag_list = 'drove to chicago, , all things know, all things know, '
      article.save
    }.to change{Tag.count}.from(0).to(2)
    article.tags.map(&:name).should == ['drove to chicago', 'all things know']
  end
  
  it "displays the list of tags" do
    article.tags = [Tag.create(:name => 'kicking ass'), Tag.create(:name => 'chewing bubblegum')]
    article.save
    article.tag_list.should == 'kicking ass,chewing bubblegum'
  end
  
  context "with a different delimiter" do
    before do
      GovernorTags.delimiter = ' '
    end
    it "can accept a list of tags" do
      expect {
        article.tag_list = 'a woodchuck would chuck all the wood he could chuck, if a woodchuck could chuck wood'
        article.save
      }.to change{Tag.count}.from(0).to(11)
      article.tags.map(&:name).should == %w(a woodchuck would chuck all the wood he could chuck, if)
    end

    it "displays the list of tags" do
      article.tags = [Tag.create(:name => 'kicking ass'), Tag.create(:name => 'chewing bubblegum')]
      article.save
      article.tag_list.should == 'kicking ass chewing bubblegum'
    end
  end
end

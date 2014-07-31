require 'rails_helper'

RSpec.describe "sliders/new", :type => :view do
  before(:each) do
    assign(:slider, Slider.new(
      :name => "MyString",
      :description => "MyText",
      :sliderimage => "MyString",
      :user => nil
    ))
  end

  it "renders new slider form" do
    render

    assert_select "form[action=?][method=?]", sliders_path, "post" do

      assert_select "input#slider_name[name=?]", "slider[name]"

      assert_select "textarea#slider_description[name=?]", "slider[description]"

      assert_select "input#slider_sliderimage[name=?]", "slider[sliderimage]"

      assert_select "input#slider_user_id[name=?]", "slider[user_id]"
    end
  end
end

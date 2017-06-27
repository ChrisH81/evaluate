require 'rails_helper'

RSpec.describe "batches/show", type: :view do
  before(:each) do
    @batch = assign(:batch, Batch.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end

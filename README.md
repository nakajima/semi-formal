# semi-formal

Sort of like `form_for`, but a bit less formal.

## Usage (not ready yet...)

First, include SemiFormal:

    include SemiFormal

Then pass `form_for` an instance of an ActiveRecord model:

    form_for(Article.new)

By default, the model's value columns will have fields generated
for them in a form.

If you want a more custom form than that, you can pass a block:

    form_for(Article.new) do |builder|
      label do
        span "Title:"
        builder.text_field(:title)
      end
      
      label do
        span "Body:"
        builder.text_area(:body)
      end
      
      input :type => "submit", :value => "Save!"
    end

In the block, you can use all of the helpers you get from Nokogiri's
builder, plus you have access to the block arg which will behave like
it does in Rails.

`(c) Copyright 2008 Pat Nakajima, released under MIT License.`
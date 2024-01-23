# frozen_string_literal: true

module ApplicationHelper
  def hidden_field_tag(_name, _value = nil, _options = {})
    raise 'Happiness chainではhidden_field_tagの使用を禁止しています'
  end

  def convert_to_jpy(price)
    "#{price.to_fs(:delimited)}円"
  end
end

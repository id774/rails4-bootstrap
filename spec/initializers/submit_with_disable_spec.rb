# -*- coding: utf-8 -*-

require File.dirname(__FILE__) + '/../spec_helper'

describe ActionView::Helpers::FormTagHelper, '二重押し防止機能' do
  fixtures :all
  include ActionView::Helpers::FormTagHelper

  context '送信ボタンがクリックされた場合' do
    describe '送信すると' do
      it "ボタンがクリック不能になる" do
        expected = "<input type=\"submit\" name=\"commit\" data-disable-with=\"Sending...\" />"
        expect(submit_tag).to eq expected
      end
    end
  end
end

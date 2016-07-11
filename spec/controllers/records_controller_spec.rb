# -*- coding: utf-8 -*-

require File.dirname(__FILE__) + '/../spec_helper'

describe RecordsController, 'Records', type: :controller do
  fixtures :all

  context 'にアクセスする場合' do
    # login_admin

    def create
      post 'create' , :record => {
        "key"=>"ほげ",
        "value"=>"ふが"
      }
    end

    def update
      post 'update' , :record => {
        "key"=>"ぴよ",
        "value"=>"ほげ"
      }, :id => 6
    end

    describe '一覧表示' do
      it "一覧画面が表示される" do
        get 'index'
        expect(response).to be_success
      end
    end

    describe '詳細' do
      it "詳細画面が表示される" do
        get 'show', :id => 1
        expect(response).to be_success
      end
    end

    describe '新規作成' do
      it "新規作成画面が表示される" do
        get 'new'
        expect(response).to be_success
      end
    end

    describe '編集' do
      it "編集画面が表示される" do
        get 'edit', :id => 1
        expect(response).to be_success
      end
    end

    describe '作成' do
      it "作成処理が正常終了する" do
        create
        expect(response.redirect_url).to eq('http://test.host/records/7')
        expect(flash[:notice]).not_to be_nil
        expect(flash[:notice]).to eq 'Record was successfully created.'
      end

      it "新規レコードが作成される" do
        create
        record = Record.find(7)
        expect(record.key).to eq  "ほげ"
        expect(record.value).to eq "ふが"
      end
    end

    describe '更新' do
      it "更新処理が正常終了する" do
        update
        records = Record.all
        expect(response.redirect_url).to eq('http://test.host/records/6')
        expect(flash[:notice]).not_to be_nil
        expect(flash[:notice]).to eq 'Record was successfully updated.'
      end

      it "レコードが更新される" do
        update
        record = Record.find(6)
        expect(record.key).to eq  "ぴよ"
        expect(record.value).to eq "ほげ"
      end
    end

    describe '削除' do
      it "レコードが削除される" do
        post 'destroy', :id => 1

        expect(response).to be_redirect
        expect(response.redirect_url).to eq('http://test.host/records')
        expect(lambda{ Record.find(1) }).to raise_error ActiveRecord::RecordNotFound
      end
    end
  end

end

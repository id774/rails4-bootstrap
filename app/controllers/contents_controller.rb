class ContentsController < ApplicationController
  before_action :set_content, only: [:show, :edit, :update, :destroy]

  def index
    @contents = Content.paginate(:page => params[:page], :order => "id DESC")
  end

  def show
  end

  def new
    @content = Content.new
  end

  def edit
  end

  def create
    @content = Content.new(content_params)

    respond_to do |format|
      if @content.save
        format.html { redirect_to @content, notice: 'Content was successfully created.' }
        format.json { render action: 'show', status: :created, location: @content }
      else
        format.html { render action: 'new' }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @content.update(content_params)
        format.html { redirect_to @content, notice: 'Content was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @content.destroy
    respond_to do |format|
      format.html { redirect_to contents_url }
      format.json { head :no_content }
    end
  end

  private
    def set_content
      @content = Content.find(params[:id])
    end

    def content_params
      params.require(:content).permit(:name, :body)
    end
end

class BootstrapPaginationRenderer < WillPaginate::ActionView::LinkRenderer
  private
  def previous_or_next_page(page, text, classname)
    link(text, page, :class => classname) unless page == false
  end

  public
  def to_html
    html = pagination.map do |item|
      tag(:li,
        ((item.is_a?(Fixnum))?
          page_number(item) :
          send(item)))
    end.map{|x|x.gsub(/><em/, " class=\"active\"><a").gsub(/em/, "a")}.join(@options[:link_separator])

    html = tag(:ul, html)

    @options[:container] ? html_container(html) : html
  end
end

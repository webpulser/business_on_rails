class SitesController < ApplicationController
  before_filter :get_site, :only => [:destroy, :edit, :show, :update]

  def index
    @per_page = 2

    respond_to do |format|
      format.html do
        paginate
      end
      format.json do
        @sites = Site.all
        render :layout => false
      end
    end
  end

  def show
    respond_to do |format|
      format.html
    end
  end

  def new
    #TODO check identity
    @site = Site.new
    respond_to do |format|
      format.html
    end
  end

  def edit
    #TODO check identity
  end

  def create
    #TODO check identity
    @site = Site.new(params[:site])
    respond_to do |format|
      if @site.save
        flash[:notice] = t('site.create.success').capitalize
        format.html { redirect_to(@site) }
      else
        flash[:error] = t('site.create.failed').capitalize
        format.html { render :action => "new" }
      end
    end
  end

  def update
    #TODO check identity
    respond_to do |format|
      if @site.update_attributes(params[:site])
        flash[:notice] = t('site.update.success').capitalize
        format.html { redirect_to(@site) }
      else
        flash[:error] = t('site.update.failed').capitalize
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    #TODO check identity
    if @site.destroy
      flash[:notice] = t('site.destroy.success').capitalize
    else
      flash[:error] = t('site.destroy.failed').capitalize
    end
    respond_to do |format|
      format.html { redirect_to(sites_url) }
    end
  end

private

  def get_site
    @site = Site.find(params[:id])
  end

  def paginate
    per_page = params[:iDisplayLength] ? params[:iDisplayLength].to_i : @per_page
    offset = params[:iDisplayStart] ? params[:iDisplayStart].to_i : 0
    @page = (offset / per_page) + 1

    conditions = {}
    includes = []
    options = { :page => @page, :per_page => per_page }

    if params[:category_id]
      conditions[:categories_elements] = { :category_id => params[:category_id] }
      includes << :site_categories
    else
      @nb_results = Site.count
    end
    options[:conditions] = conditions unless conditions.empty?
    options[:include] = includes unless includes.empty?
    @sites = Site.paginate(:all,options)
    # FIXME not true only for development tests
    @nb_results ||= @sites.length
    puts("\033[01;33m#{@sites}\033[0m")
  end
end

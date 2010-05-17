class Admin::SitesController < Admin::BaseController

  before_filter :get_site, :only => [:edit, :destroy, :show, :update, :activate, :duplicate]
  before_filter :new_site, :only => [:new, :create]
  before_filter :manage_tags, :only => [:create, :update]

  def index
    respond_to do |format|
      format.html
      format.json do
        sort
        render :layout => false
      end
    end
  end

  def show
  end

  def new
  end

  def duplicate
    @site = @site.clone
    render :action => 'new'
  end

  def create
    if @site.save
      flash[:notice] = t('site.create.success').capitalize
      return redirect_to(admin_sites_path)
    else
      flash[:error] = t('site.create.failed').capitalize
      render :new
    end
  end

  def edit
  end

  def update
    if @site.update_attributes(params[:site])
      flash[:notice] = t('site.update.success').capitalize
      return redirect_to(admin_sites_path)
    else
      flash[:error] = t('site.update.failed').capitalize
      render :action => 'edit'
    end
  end

  def destroy
    if @site.destroy
      flash[:notice] = t('site.destroy.success').capitalize
      return redirect_to(admin_sites_path) if !request.xhr?
    else
      flash[:error] = t('site.destroy.failed').capitalize
    end
    render :nothing => true
  end

  def url
    render :text => Forgeos::url_generator(params[:url])
  end

  def activate
    render :text => @site.activate
  end
private
  def manage_tags
    params[:site][:tag_list] = params[:tag_list].join(',') if params[:tag_list]
  end

  def get_tag(name)
    return @tag = Tag.find_by_name(name) ? true : false
  end

  def get_site
    unless @site = Site.find_by_id(params[:id])
      flash[:error] = t('site.found.failed').capitalize
      return redirect_to(admin_sites_path)
    end
  end

  def new_site
    @site = Site.new(params[:site])
  end

  def sort
    columns = %w(id sites.name site.url active)

    per_page = params[:iDisplayLength] ? params[:iDisplayLength].to_i : 10
    offset = params[:iDisplayStart] ? params[:iDisplayStart].to_i : 0
    page = (offset / per_page) + 1
    order = "#{columns[params[:iSortCol_0].to_i]} #{params[:iSortDir_0] ? params[:iSortDir_0].upcase : 'ASC'}"

    conditions = {}
    includes = []
    options = { :page => page, :per_page => per_page }

    if params[:category_id]
      conditions[:categories_elements] = { :category_id => params[:category_id] }
      includes << :site_categories
    end
    if params[:ids]
      conditions[:sites] = { :id => params[:ids].split(',') }
    end
    options[:conditions] = conditions unless conditions.empty?
    options[:include] = includes unless includes.empty?
    options[:order] = order unless order.squeeze.blank?

    if params[:sSearch] && !params[:sSearch].blank?
      @sites = Site.search(params[:sSearch],options)
    else
      @sites = Site.paginate(:all,options)
    end
  end
end

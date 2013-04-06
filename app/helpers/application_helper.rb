module ApplicationHelper

# Title
  # * +new_title+: Title to show
  def title new_title
    content_for :title do
      new_title.titleize
    end
  end

  # Actions
  # * +instance+: Current instance
  # * +args+: Arguments
  def actions instance, args = {}
    # Action
    action = args[:action] || params[:action]

    # Actions
    back = :back#instance.class
    destroy = args[:destroy] ? instance : nil
    edit = args[:edit] ? [:edit, instance] : nil
    show = args[:show] ? instance : nil
    associations = Array.new
    if !args[:association].nil?
      reflections = Array.new
      args[:association].each do |a|
        #reflections = instance.class.reflect_on_all_associations
        reflections = instance.class.reflect_on_all_associations(:has_one) 
        associations.push(a) if !reflections.find{|reflection| reflection.name == a}.blank? 
      end
    end
    associations = nil if associations.blank?
    # Render
    render "shared/actions/#{action}", :back => back, :destroy => destroy, :edit => edit, :show => show, :instance => instance, :associations => associations
  end

  # Index grid
  # * +instance+: Current instance
  # * +fields+: Fields to show
  # * +args+: Arguments
  def index_grid instance, fields = [], args = {}
    args[:paginate] ||= true
    args[:no_title] = false if args[:no_title].nil?
    args[:new] = true if args[:new].nil?
    args[:show] = true if args[:show].nil?
    args[:edit] = true if args[:edit].nil?
    args[:destroy] = true if args[:destroy].nil?
    args[:association] = nil if args[:association].nil?
    render "shared/grids/index/grid", :instance => instance, :fields => fields, :paginate => args[:paginate], :new => args[:new], :show => args[:show], :edit => args[:edit], :destroy => args[:destroy], :no_title => args[:no_title], :association => args[:association]
  end

  # Show grid
  # * +instance+: Current instance
  # * +fields+: Fields to show
  def show_grid instance, fields = [], args = {}
    args[:edit] = true if args[:edit].nil?
    args[:destroy] = true if args[:destroy].nil?
    args[:association] = nil if args[:association].nil?
    render "shared/grids/show/grid", :instance => instance, :fields => fields, :edit => args[:edit], :destroy => args[:destroy], :association => args[:association]
  end

  # New button
  def new_button
    new = [:new, current_controller.singularize]
    render "shared/buttons/new", :new => new
  end

  def test_singularity(str)
    str.pluralize != str and str.singularize == str
  end

end

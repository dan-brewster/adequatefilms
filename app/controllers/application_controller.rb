class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :id_param_fix
  after_filter :set_csrf_cookie_for_ng

  def id_param_fix
    @id_clean = params[:id]
    if @id_clean.is_a?(String)
      #@id_clean = ensure_valid_gr_utf8(@id_clean)
    end
    if !params[:title] && location = (@id_clean =~ /-/)
      @id_clean = @id_clean[0...location]
    end
  end

  def load_resource(klass, var_name = nil, options = {})
    if id_name = options[:id_name]
      id = params[id_name]
    else
      id = @id_clean
    end
  end

  %w(Movie Person Role Update User UserMovie).each do |klass|
    class_eval <<-EOV
      def load_#{klass.underscore}
        load_resource(#{klass})
      end
    EOV
  end

  def set_csrf_cookie_for_ng
    cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
  end

  protected

  def verified_request?
    super || form_authenticity_token == request.headers['X-XSRF-TOKEN']
  end
end

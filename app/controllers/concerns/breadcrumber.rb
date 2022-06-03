module Breadcrumber
  extend ActiveSupport::Concern

  private

  def init_breadcrumbs
    @breadcrumbs = []
  end

  def add_breadcrumb(label, path, active = false)
    @breadcrumbs << { label: label, path: path, active: active }
  end
end

class TreeBuilderTemplatesImagesFilter < TreeBuilderVmsFilter
  def tree_init_options
    super.update(:leaf => 'MiqTemplate')
  end

  def set_locals_for_render
    locals = super
    locals.merge!(:tree_id        => "templates_images_filter_treebox",
                  :tree_name      => "templates_images_filter_tree",
                  :allow_reselect => true)
  end

  def root_options
    {
      :text    => _("All Templates & Images"),
      :tooltip => _("All of the Templates & Images that I can see")
    }
  end
end

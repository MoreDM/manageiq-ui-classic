class TreeBuilderTemplateFilter < TreeBuilderVmsFilter
  def tree_init_options
    super.update(:leaf => 'ManageIQ::Providers::InfraManager::Template')
  end

  def set_locals_for_render
    locals = super
    locals.merge!(
      :tree_id   => "templates_filter_treebox",
      :tree_name => "templates_filter_tree",
      :autoload  => false
    )
  end

  def root_options
    {
      :text    => _("All Templates"),
      :tooltip => _("All of the Templates that I can see")
    }
  end
end

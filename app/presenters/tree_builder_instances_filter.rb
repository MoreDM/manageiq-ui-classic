class TreeBuilderInstancesFilter < TreeBuilderVmsFilter
  def tree_init_options
    super.update(:leaf => 'ManageIQ::Providers::CloudManager::Vm')
  end

  def set_locals_for_render
    locals = super
    locals.merge!(:tree_id   => "instances_filter_treebox",
                  :tree_name => "instances_filter_tree",
                  :autoload  => false)
  end

  def root_options
    {
      :text    => _("All Instances"),
      :tooltip => _("All of the Instances that I can see")
    }
  end
end

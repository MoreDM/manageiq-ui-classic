class TreeBuilderOpsDiagnostics < TreeBuilderOps
  private

  def tree_init_options
    {:open_all => true}
  end

  def set_locals_for_render
    locals = super
    locals.merge!(:autoload => true)
  end

  def root_options
    region = MiqRegion.my_region
    text = _("%{product} Region: %{region_description} [%{region}]") % {:region_description => region.description,
                                                                        :region             => region.region,
                                                                        :product            => Vmdb::Appliance.PRODUCT_NAME}
    {
      :text    => text,
      :tooltip => text,
      :icon    => 'pficon pficon-regions'
    }
  end
end

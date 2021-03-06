class TreeBuilderPxeServers < TreeBuilder
  has_kids_for PxeServer, %i(x_get_tree_pxe_server_kids options)

  private

  def tree_init_options
    {}
  end

  def set_locals_for_render
    locals = super
    locals.merge!(:autoload => true)
  end

  def root_options
    {
      :text    => t = _("All PXE Servers"),
      :tooltip => t
    }
  end

  # Get root nodes count/array for explorer tree
  def x_get_tree_roots(count_only, _options)
    count_only_or_objects(count_only, PxeServer.all, "name")
  end

  def x_get_tree_pxe_server_kids(object, count_only, options)
    pxe_images = object.pxe_images
    win_images = object.windows_images
    if count_only
      options[:open_nodes].push("xx-pxe_xx-#{object.id}") unless options[:open_nodes].include?("xx-pxe_xx-#{object.id}")
      options[:open_nodes].push("xx-win_xx-#{object.id}") unless options[:open_nodes].include?("xx-win_xx-#{object.id}")
      pxe_images.size + win_images.size
    else
      objects = []
      unless pxe_images.empty?
        options[:open_nodes].push("pxe_xx-#{object.id}") unless options[:open_nodes].include?("pxe_xx-#{object.id}")
        objects.push(:id   => "pxe_xx-#{object.id}",
                     :text => _("PXE Images"),
                     :icon => "pficon pficon-folder-close",
                     :tip  => _("PXE Images"))
      end
      unless win_images.empty?
        options[:open_nodes].push("win_xx-#{object.id}") unless options[:open_nodes].include?("win_xx-#{object.id}")
        objects.push(:id   => "win_xx-#{object.id}",
                     :text => _("Windows Images"),
                     :icon => "pficon pficon-folder-close",
                     :tip  => _("Windows Images"))
      end
      objects
    end
  end

  def x_get_tree_custom_kids(object, count_only, _options)
    nodes = (object[:full_id] || object[:id]).split('_')
    ps = PxeServer.find_by(:id => nodes.last.split('-').last)
    objects = if nodes[0].end_with?("pxe")
                ps.pxe_images
              elsif nodes[0].end_with?("win")
                ps.windows_images
              end
    count_only_or_objects(count_only, objects, "name")
  end
end

ActiveAdmin.register Poster do
  index do
    column :image do |poster|
      image_tag(poster.url.thumb)
    end
    column :text
    column :party
    default_actions
  end

  index as: :grid, default: true do |poster|
    link_to(image_tag(poster.url.thumb), admin_poster_path(poster))
  end

  show do
    attributes_table do
      row :id
      row :party
      row :image do
        image_tag(poster.url.w640)
      end
      row :text
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  form(html: {multipart: true}) do |f|
    f.inputs "Poster Details" do
      f.input :url, as: :file, hint: f.template.image_tag(f.object.url.thumb)
      f.input :text
      f.input :party
    end
    f.actions
  end

  controller do
    def permitted_params
      params.permit poster: [:url, :text, :party_id]
    end
  end

end

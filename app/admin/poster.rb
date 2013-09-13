ActiveAdmin.register Poster do
  index do
    column :text
    column :party
    default_actions
  end

  index as: :grid, default: true do |poster|
    link_to(image_tag(poster.url.thumb), admin_poster_path(poster))
  end

  form(html: {multipart: true}) do |f|
    f.inputs "Poster Details" do
      f.input :url, as: :file
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
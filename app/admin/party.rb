ActiveAdmin.register Party do
  index do
    column :name
    column :short_name
    column :slug
    column :homepage
    default_actions
  end

  filter [:name, :short_name]

  form do |f|
    f.inputs "Party Details" do
      f.input :name
      f.input :short_name
      f.input :slug
      f.input :easymode
      f.input :description
      f.input :homepage
    end
    f.actions
  end

  controller do
    def scoped_collection
      Party.friendly
    end

    def permitted_params
      params.permit party: [:name, :short_name, :slug, :description, :homepage, :easymode]
    end
  end
end

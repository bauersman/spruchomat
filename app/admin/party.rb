ActiveAdmin.register Party do
  index do
    column :name
    column :slug
    column :homepage
    default_actions
  end

  filter :name

  form do |f|
    f.inputs "Party Details" do
      f.input :name
      f.input :slug
      f.input :description
      f.input :homepage
    end
    f.actions
  end

  controller do
    def permitted_params
      params.permit party: [:name, :slug, :description, :homepage]
    end
  end
end

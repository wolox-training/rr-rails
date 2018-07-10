ActiveAdmin.register Book do
  permit_params :author, :genre, :image, :title, :publisher, :year

  index do
    selectable_column
    id_column
    column :author
    column :genre
    column :title
    column :publisher
    column :year
    actions
  end

  filter :created_at
end

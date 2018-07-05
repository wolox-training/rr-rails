ActiveAdmin.register Rent do
  permit_params :from, :to, :book, :user

  index do
    selectable_column
    id_column
    column :from
    column :to
    column :user
    column :book
    actions
  end

  filter :created_at
end

ActiveAdmin.register Epic do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :name, :project_id, :sort, member_ids: []
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end

index do
  selectable_column

  column :project
  column :name

  actions
end

form do |f|
  f.input :project
  f.input :name
  f.input :members, :as => :select, :input_html => {:multiple => true}
  f.input :sort

  f.actions
 end

end

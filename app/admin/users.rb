ActiveAdmin.register User do
	form do |f|
    f.inputs "Details" do
      f.input :verified
    end
    f.buttons
  end
  
end

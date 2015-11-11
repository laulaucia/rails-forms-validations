class PetsController < ApplicationController
	def new
		@pet = Pet.new
		@owner = Owner.find(params[:owner_id])
	end
	def show 
		@owner = Owner.find(params[:owner_id])
		@pet = Pet.find(params[:id])
	end
	def create
		@pet = Pet.new(pet_params)
		@owner = Owner.find (params[:owner_id])
		if @pet.save
			@owner.pets << @pet
			redirect_to @owner
		else 
			render 'owners/show'
		end
	end
	private
	def pet_params
		params.require(:pet).permit(:name, :species)
	end
end

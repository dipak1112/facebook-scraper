class Like < ActiveRecord::Base
	belongs_to :mixable, :polymorphic => true
end

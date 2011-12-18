module UsersHelper
	def authenticate
		deny_access unless user_signed_in?
	end
	
	def deny_access
		redirect_to new_user_session_path, :notice => "You need to be signed in to do that"
	end
end

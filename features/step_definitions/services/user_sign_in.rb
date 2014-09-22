def find_create_user role
	test_email = "test@example.com"
	test_password = "passwo$r123"
	CreateAdminService.new.call_custom test_email,
  																	 test_password, role
end

def sign_in_as_admin
	@user = find_create_user admin
	sign_in_with @user.email, @user.password
end

def sign_in_as_moderator
  	@user = find_create_user moderator
	sign_in_with @user.email, @user.password
end

def sign_in_as_instruktor
	@user = find_create_user instruktor
	sign_in_with @user.email, @user.password
end
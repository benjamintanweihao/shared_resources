defmodule SharedResources.User.Password do
  def encrypt(password, salt) do
    :bcrypt.hashpw(password, salt)
  end
  
  def gen_salt do
    {:ok, salt} = :bcrypt.gen_salt
    salt
  end
  
  def create(password) do
    salt = gen_salt
    encrypted_password = encrypt(password, salt)
    {encrypted_password, salt}
  end
end

[1mFrom:[0m /root/Development/Phase_3/ViolinCompetition/app/controllers/users_controller.rb:13 UsersController#create:

    [1;34m10[0m: [32mdef[0m [1;34mcreate[0m
    [1;34m11[0m:     @user = [1;34;4mUser[0m.new(user_params)
    [1;34m12[0m:     [32mif[0m @user.save
 => [1;34m13[0m:         binding.pry  
    [1;34m14[0m:         flash[[33m:message[0m] = [31m[1;31m"[0m[31mSuccessfully signed up.[1;31m"[0m[31m[0m
    [1;34m15[0m:         session[[33m:user_id[0m] = @user.id
    [1;34m16[0m:         redirect_to user_path(@user)
    [1;34m17[0m:     [32melse[0m
    [1;34m18[0m:         render [33m:new[0m
    [1;34m19[0m:     [32mend[0m
    [1;34m20[0m: [32mend[0m


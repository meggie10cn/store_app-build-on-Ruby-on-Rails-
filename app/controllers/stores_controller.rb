
  ##########################################################

  ### StoreController defines all pages and functions ###

## CSC 620 IAD  ##
## HW5
## Lixia Zhao
 ######################################################
class StoresController < ApplicationController
  


  ##########################################################

  ##########################################################
 ### define the identify_user SQL 
  def identify_user(id)

             sql = ActiveRecord::Base.connection()

             sql.begin_db_transaction

             query = "select username from buyers where id = " + id.to_s
             #sql.execute(query).fetch_row
             sql.select_rows(query)
             
  end  
  ##########################################################
  # check if the user is lockable, default is 0 (unlocked)
  def identify_lockable(username)

             sql = ActiveRecord::Base.connection()

             sql.begin_db_transaction
             query = "select lockable from buyers where id = " + 
             
             #sql.execute(query).fetch_row
             sql.select_rows(query)
             
  end 
#######################################################
  def update_lockable(id)
    sql = ActiveRecord::Base.connection()

             sql.begin_db_transaction
             
             query = "update buyers SET lockable = '2' where id = " + id.to_s
             #sql.execute(query).fetch_row
             sql.select_rows(query)
  end

 #######################################
  def lock
    @title = "Sorry, Your Account is Locked"
    if session[:user_id]
    #flash[:notice] = "Welcome #{identify_user(session[:user_id])}"
    #update_lockable(session[:user_id])
    end
  end


################################
# the session is terminated
  def logout
         session[:user_id] = nil
         flash[:notice] = " "
  end
    

#########################################
# shows the welcome page

  def welcome
    @title = "Welcome to My Site"
    if session[:user_id]
         #flash[:notice] = "Welcome #{identify_user(session[:user_id])}"
         flash[:notice] = "Welcome1 #{identify_user(session[:user_id])}"
    else
         redirect_to :action => "login"
    end
  end

############################################################
  ## define login page, if username and password matches, go to the
  ## security question page which randomly pop a security question
  ## if not match loop through login page  ###########
  def login
    @title = "Login to SJU"
    if request.post?
       @user = Buyer.new()
       $lockable = nil
        @user.username = params[:user][:username]
        @user.password = params[:user][:password]
        #$user_id = User.find_by_username(@user.username).id
         #$lockable = {identify_lockable(@user.username)}
         #$lockable = (@user.username)}
         #{identify_user(session[:user_id])}
        
       # $lockable = $user1.lockable
        $user =  Buyer.find_by_username_and_password(@user.username, @user.password)
          if $user
            $lockable = $user.lockable
            if ($lockable ==1)
             $num = rand(1..3)
             $question = ""
             $answer = ""

          case $num
          when 1
           $question = $user.squestion1
            $answer = $user.sanswer1
          when 2
            $question = $user.squestion2
            $answer = $user.sanswer2
          when 3
            $question = $user.squestion3
            $answer = $user.sanswer3
          end  # endn case

         session[:user_id] = $user.id
         session[:answer] = $answer
         session[:attemp] = nil
        
         flash[:notice] = "User #{$user.username} logged in!"
         redirect_to :action => "security"  
        else
          flash[:notice] = "Your account (#{$user.username}) is locked" 
         redirect_to :action => "lock"
       end # end if lockable or not
        else
        @user.password = nil
        flash[:notice] = "Invalid username/password combination" 
        end # end if user or else
  end # end if post
  end
   

   ########################################################
   ## define register. post all the fields to databaase and save the new user
   ## if user created successfully, go to login page, else pop the error massage
    def register
    @title = "Registration Page"
    #flash[:notice] = ""
    @squestionlib = [
    [
    "What is your mother's maid name?",
    "What is the last name of your favorite teacher?",
    "What is your best friends' name?",
    "What was the model of your first car?",
    "what is your favorite food?"
    ],
    [
    "What is the name of your highschool?",
    "What is the name of the town of your birthplace?",
    "What is the title of your favorite book?",
    "Where did you meet your sweetheart?",
    "What is the name of your favorite movie star?"
    ],
    [
    "What is the street name where you are living?",
    "What is your favorite subject in high school?",
    "What is the name of your favorite football team?",
    "What is your favorite city in the world?",
    "What is the last 4 digit of your SSN"
    ]
    ]
    if request.post?
        @user = Buyer.new()
        @user.username = params[:user][:username]
        @user.password =  params[:user][:password] 
        @user.squestion1 = params[:user][:squestion1]
        @user.sanswer1 = params[:user][:sanswer1]
        @user.squestion2 = params[:user][:squestion2]
        @user.sanswer2 = params[:user][:sanswer2]
        @user.squestion3 = params[:user][:squestion3]
        @user.sanswer3 = params[:user][:sanswer3]
        user = Buyer.find_by_username(@user.username)
        
        if @user.save
            session[:user_id] = @user.id
            flash[:notice] = "User #{@user.username} was successfully created!"

             redirect_to  :action => "login"
        else
            flash[:notice] = @user.errors.full_messages
        end
     end
  end  


##############################################

       
  ## define security page, if the pass the login, go to this page
  # a random security question pops out, if give a right answer within
  # 3 times, go to the welcome page, after 3 failures, go to a new page
  # to identify a randomly image  
  ##########################################################
 def security
   @title = "Security Page"
    
    id = session[:user_id]
    if session[:user_id] && $lockable ==1
        #flash[:notice] = "Welcome #{identify_user(session[:user_id])}"
        flash[:notice] = "Welcome #{$user.username}"
        #flash[:notice] = "User #{session[:user_id]} logged in!"
 
          if request.post?
             session[:error1] = nil
             if(session[:attemp] == nil)
                session[:attemp] =1
              elsif(session[:attemp])
                session[:attemp]+=1
             end
            
               answer = params[:answer]
               sanswer = session[:answer]
       
               if (answer == sanswer)
               redirect_to :action => 'welcome'

               elsif(answer !=sanswer && session[:attemp] <3)
     
                 $num = rand(1..3)
                 $question = nil
                 $answer = nil
                 
                case $num
                when 1
                 $question = $user.squestion1
                 $answer = $user.sanswer1
                when 2
                $question = $user.squestion2
                 $answer = $user.sanswer2
                when 3
                $question = $user.squestion3
                $answer = $user.sanswer3
                end
            session[:answer] = $answer
           redirect_to :action => 'security'
          else
                   
                redirect_to :action => 'new'
          end
     end
   
  end
end
  #######################################
  ## I use the rail rucaptcha plugin to verify the images
  # if identify the image within 5 tries, go to the welcome page
  # else the account is locked
    def new
     if session[:user_id]
         #flash[:notice] = "Welcome #{identify_user(session[:user_id])}"
         flash[:notice] = "Welcome #{$user.username}"
         if(session[:error1] == nil)
            session[:error1] =1
         elsif(session[:error1])
          session[:error1]+=1
           end
         if verify_rucaptcha?(@user)
            flash[:alert] = "You are not robot."
           redirect_to :action => 'welcome'
         elsif !verify_rucaptcha?(@user) && session[:error1] <= 5  
            flash[:notice] = "Please input Captcha code."
              render 'new'
          else
           redirect_to :action => 'lock'
                               # after 5th failure, go to lock
           flash[:notice] = " You failed 5 times" 
           update_lockable(session[:user_id])
         end
       end
     end
  end
  ##########################################
  # the page is define to use the images given by professor for the random
  # images, I do not acutally use this function
  # it is used to show the images randomly
   def random
    if session[:user_id] 
     flash[:notice] = "Welcome #{identify_user(session[:user_id])}"
     $random_no = rand(0..8)
     $images  = ["image1.jpg", "image2.jpg", "image3.jpg", "image4.jpg", "image5.jpg", "image6.jpg", "image7.jpg","image8.jpg", "image9.jpg"]
     
     $text =""
     $random_image=""
     case $random_no
         when 0
         $text = "braderlend"
         $random_image = $images[0]
         when 1
         $text = "ingednessn"
         $random_image = $images[1]
         when 2
         $text = "faniatome"
         $random_image = $images[2]
         when 3
         $text = "rehsolings"
         $random_image = $images[3]
         when 4
         $text = "spastedow"
         $random_image = $images[4]
         when 5
         $text = "tockitychi"
         $random_image = $images[5]
         when 6
         $text = "imetsonser"
         $random_image = $images[6]
         when 7
         $text = "plaveriti"
         $random_image = $images[7]
         when 8
         $text = "asilleen"
         $random_image = $images[8]
     end
     if request.post?

        if(session[:error1] == nil)
           # session[:error1] =1
        elsif(session[:error1])
          session[:error1]+=1
        end
        
        $myanswer = params[:randomQ][:ranswer]
        if ($myanswer == $text)  ## call match
           flash[:alert] = "You are not robot."
           redirect_to :action => 'welcome'
         elsif ($myanswer != $text) && session[:error1] <= 5
           flash[:notice] = "Please input Captcha code."
              redirect_to :action =>'random'
         else
           redirect_to :action => 'lock'
                               # after 5th failure, go to lock
          flash[:notice] = " You failed 5 times"
          update_lockable(session[:user_id])
        end
       end
  end
end

#########################################
# is the help function for the random
# def show
# $images  = ["image1.jpg", "image2.jpg", "image3.jpg", "image4.jpg", "image5.jpg", "image6.jpg", "image7.jpg","image8.jpg", "image9.jpg"]
  
  

#end
########################################
#def match
#   $random_no = rand(0..8)
#  $images  = ["image1.jpg", "image2.jpg", "image3.jpg", "image4.jpg", "image5.jpg", "image6.jpg", "image7.jpg","image8.jpg", "image9.jpg"]
   
# $text =""
   # $random_image=""
# case $random_no
#        when 0
#         $text = "braderlend"
#        $random_image = $images[0]
#       when 1
#        $text = "ingednessn"
#        $random_image = $images[1]
#    when 2
#         $text = "faniatome"
#        $random_image = $images[2]
#       when 3
#       $text = "rehsolings"
#         $random_image = $images[3]
#       when 4
#         $text = "spastedow"
#        $random_image = $images[4]
#      when 5
#        $text = "tockitychi"
#       $random_image = $images[5]
#      when 6
#     $text = "imetsonser"
#     $random_image = $images[6]
#    when 7
#      $text = "plaveriti"
#     $random_image = $images[7]
#   when 8
#    $text = "asilleen"
#     $random_image = $images[8]
#    end
# if (params[:randomQ][:ranswer] == $text)
#    return true
#  end
# end

# shows the account locked page, change lockable to 2



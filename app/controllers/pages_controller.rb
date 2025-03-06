class PagesController < ApplicationController
    def home
      @date = Date.today

      render({ :template => "pages_templates/home"})
    end

    def waitlist
      email = params[:email]
    
      if email.present?
        # Save to database (if you have a model) or log it for now
        Rails.logger.info "New waitlist signup: #{email}"
        flash[:notice] = "You're on the waitlist! 🎉"
      else
        flash[:alert] = "Please enter a valid email."
      end
    
      redirect_to "/"
      end  
  end 

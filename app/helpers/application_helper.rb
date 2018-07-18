module ApplicationHelper

  def user_redirection resource
    if resource.is_a?(User)
      if current_user.baker?
        # Redirections for bakers
        bakery = Bakery.where(:user_id => resource.id).first

        bakery ? bakery : "/bakeries/new"
      else
        # Redirections for users
        "/bakeries"
      end
    else
      "/bakeries"
    end
  end

  def price_currency price
    number_to_currency price, :unit => '€', :separator => ","
  end

end
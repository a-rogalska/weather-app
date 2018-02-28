module ManageCookies
  def create_cookies
    session[:cities] = []
  end

  def add_city_to_cookies(city)
    session[:cities] << city
  end

  def get_cookies
    session[:cities]
  end

  def cookies_exists?
    session[:cities].present?
  end

  def cookies_contains?(city)
    session[:cities].include? city
  end
end
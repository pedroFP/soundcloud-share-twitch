class TwitchController < ApplicationController
  def login
    respond_to do |format|
      format.html
      format.js
    end
  end
end
